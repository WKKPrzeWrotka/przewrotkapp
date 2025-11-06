{
  pkgs ? import <nixpkgs>{},
  lib ? pkgs.lib,
  buildDartApplication ? pkgs.buildDartApplication,
}:
buildDartApplication rec {
	pname = "pwa";
	version = "0.0.1";
	src = ./.;
	autoPubspecLock = src + "/pubspec.lock";
	meta = {
		mainProgram = "pwa";
	};
}
