{ config, pkgs, lib, ... }:
{

  programs = {
    sway = {
      enable = true;
      wrapperFeatures.gtk = true;
      package = pkgs.swayfx;
      extraOptions = [ "--unsupported-gpu" ];
      extraPackages = with pkgs; [
	    acpilight # Con el script en ~/Scripts funciona xbacklight
        adwaita-icon-theme
        alacritty
        bemenu
        gammastep
        grim
        i3status
        mako
        nwg-look
        pavucontrol
	    pulseaudio # Para pactl
        slurp
        swayidle
        swayimg
        swaylock
        zathura
      ];
      xwayland.enable = true;
    };
  };

  xdg.portal = {
    wlr.enable = true;
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  services = { 
    gnome.gnome-keyring.enable = true;
    power-profiles-daemon.enable = true;
  };

}
