{
  config,
  lib,
  pkgs,
  ...
}:
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

  config = mkIf config.services.przewrotkapp.enable {
    users.users.przewrotkapp = {
      description = "PrzeWrotkApp server service user";
      home = "/var/lib/przewrotkapp";
      createHome = true;
      isSystemUser = true;
      group = "przewrotkapp";
      shell = "/run/current-system/sw/bin/fish";
      packages = with pkgs; [ dart flutter fish rclone ];
    };
    users.groups.przewrotkapp = { };

    systemd.services.przewrotkapp = {
      description = "PrzeWrotkApp server";
      wantedBy = [ "multi-user.target" ];
      after = [ "postgresql.service" ];
      path = with pkgs; [ dart ];
      serviceConfig = {
        User = "przewrotkapp";
        WorkingDirectory = "/var/lib/przewrotkapp/przewrotkapp/przewrotkapp_server";
        ExecStartPre =
          if (config.services.przewrotkapp.compile == false) then
            "${pkgs.dart}/bin/dart pub get"
          else
            "true";
        ExecStart =
          if config.services.przewrotkapp.compile then
            "${lib.getExe pkgs.pwa} --mode production --apply-migrations"
          else
            "${pkgs.dart}/bin/dart run bin/main.dart --mode production --apply-migrations";
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

    systemd.services.przewrotkapp-backups = mkIf config.services.przewrotkapp.enable {
      serviceConfig.User = "przewrotkapp";
      path  = with pkgs; [ postgresql rclone ];
      script = ''
      cd /var/lib/przewrotkapp/db-backups
      pg_dump -Fc przewrotkapp > "przewrotkapp-db_$(date '+%Y-%m-%d_%H-%M-%S').dump"
      # leave only 7 latest, delete the rest
      ls -1t | tail -n +8 | xargs -d '\n' rm --
      rclone --drive-shared-with-me --transfers 1 -v --stats 5s sync . matigdrive:/db-backups
      '';
      startAt = "*-*-* 01:00:00";
    };
  };
}
