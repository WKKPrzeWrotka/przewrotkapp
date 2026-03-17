{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.services.przewrotkapp;
in
with lib;
{
  options.services.przewrotkapp = {
    enable = lib.mkEnableOption "PrzeWrotkApp server";
    compile = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = ''
        Whether to use pre-compiled version or directly run dart run bin/main.dart
        Useful for developing
      '';
    };
    dbBackups = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = ''
        Run pg_dump everyday at 2am
      '';
    };
  };

  config = mkIf cfg.enable {
    users.users.przewrotkapp = {
      description = "PrzeWrotkApp server service user";
      home = "/var/lib/przewrotkapp";
      createHome = true;
      isSystemUser = true;
      group = "przewrotkapp";
      shell = "/run/current-system/sw/bin/fish";
      packages = with pkgs; [ flutter335 fish rclone git ];
    };
    users.groups.przewrotkapp = { };

    systemd.services.przewrotkapp = {
      description = "PrzeWrotkApp server";
      wantedBy = [ "multi-user.target" ];
      after = [ "postgresql.service" ];
      path = with pkgs; [ flutter335 git ];
      serviceConfig = {
        User = "przewrotkapp";
        WorkingDirectory = "/var/lib/przewrotkapp/przewrotkapp/przewrotkapp_server";
        ExecStartPre =
          if (cfg.compile == false) then
            "${pkgs.flutter335}/bin/dart pub get"
          else
            "true";
        ExecStart =
          if cfg.compile then
            "${lib.getExe pkgs.pwa} --mode production --apply-migrations"
          else
            "${pkgs.flutter335}/bin/dart run bin/main.dart --mode production --apply-migrations";
        Restart = "always";
        RestartSec = "5";
      };
    };

    services.postgresql = {
      enable = true;
      ensureDatabases = [ "przewrotkapp" ];
      ensureUsers = [
        {
          name = "przewrotkapp";
          ensureDBOwnership = true;
          ensureClauses = {
            login = true;
          };
        }
      ];
    };

    systemd.services.przewrotkapp-backups-daily = mkIf (cfg.enable && cfg.dbBackups) {
      serviceConfig.User = "przewrotkapp";
      path  = with pkgs; [ postgresql rclone ];
      script = ''
      cd /var/lib/przewrotkapp/db-backups
      # Exclude email auth to not leak password hashes
      pg_dump -Fc przewrotkapp --exclude-table-data serverpod_email_auth > "daily/przewrotkapp-db_$(date '+%Y-%m-%d_%H-%M-%S').dump"
      # leave only 7 latest, delete the rest
      ls -1t daily/ | tail -n +8 | xargs -d '\n' -I {} rm -- "daily/{}"
      rclone --transfers 1 -v --stats 5s sync . matigdrive:/db-backups
      '';
      startAt = "*-*-* 01:00:00";
    };

    systemd.services.przewrotkapp-backups-monthly = mkIf (cfg.enable && cfg.dbBackups) {
          serviceConfig.User = "przewrotkapp";
          path  = with pkgs; [ postgresql rclone ];
          script = ''
          cd /var/lib/przewrotkapp/db-backups
          # Copy latest from daily to monthly
          ls -1t daily/ | head -n1 | read latest
          cp -p "daily/$latest" "monthly/$latest"
          # leave only 3 latest, delete the rest
          ls -1t monthly/ | tail -n +4 | xargs -d '\n' -I {} rm -- "monthly/{}"
          # Daily runner will do the sync
          '';
          # Run it BEFORE daily so it later does the gdrive sync in one run
          startAt = "*-*-01 00:30:00";
        };
  };
}
