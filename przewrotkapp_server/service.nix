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
  };

  config = mkIf config.services.przewrotkapp.enable {
    users.users.przewrotkapp = {
      description = "PrzeWrotkApp server service user";
      home = "/var/lib/przewrotkapp";
      createHome = true;
      isSystemUser = true;
      group = "przewrotkapp";
      shell = "/run/current-system/sw/bin/fish";
      packages = with pkgs; [ dart flutter fish ];
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
        ExecStart =
          if config.services.przewrotkapp.compile then
            "${lib.getExe pkgs.pwa} --mode production --apply-migrations"
          else
            "${pkgs.dart}/bin/dart pub get && ${pkgs.dart}/bin/dart run bin/main.dart --mode production --apply-migrations";
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
  };
}
