{ config, pkgs, lib, ... }:
{

  programs = {
    nm-applet.enable = true;
    sway = {
      enable = true;
      wrapperFeatures.gtk = true;
      extraOptions = [ "--unsupported-gpu" ];
      extraPackages = with pkgs; [
        adwaita-icon-theme
        alacritty
        bemenu
        jq
        gammastep
        grim
        i3status
        mako
        nwg-look
        slurp
        swayidle
        swayimg
        swaylock
        zathura
      ];
      #package = pkgs.swayfx;
    };
    yazi.enable = true;
  };

  xdg.portal = {
    wlr.enable = true;
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  services.gnome.gnome-keyring.enable = true;

}
