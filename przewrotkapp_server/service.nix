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
  };

  config = mkIf config.services.przewrotkapp.enable {
  	systemd.services.przewrotkapp = {
  		description = "PrzeWrotkApp server";
  		wantedBy = [ "multi-user.target" ];
  		after = [ "postgresql.service" ];
  		serviceConfig = {
  			User = "przewrotkapp";
  			Group = "przewrotkapp";
  			WorkingDirectory = "/home/matiii/przewrotkapp/przewrotkapp_server";
  			ExecStart = "${lib.getExe pkgs.pwa}";
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
  			}
  		];
  	};
  };
}
