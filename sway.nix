{ config, pkgs, lib, ... }:
{

  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    extraOptions = [ "--unsupported-gpu" ];
    extraPackages = with pkgs; [
      alacritty
      bemenu
      jq
      gammastep
      grim
      i3status
      mako
      nwg-look
      slurp
    ];
    #package = pkgs.swayfx;
  };

  services.gnome.gnome-keyring.enable = true;

}
