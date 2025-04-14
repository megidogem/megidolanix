{ pkgs, ... }:

{
  # System packages
  environment.systemPackages = with pkgs; [
    audacity
    btop
    eza
    fastfetch
    gimp
    #hakuneko
    kdePackages.kdenlive
    keepassxc
    killall
    libreoffice-fresh
    librewolf
    mcrcon
    mpv
    ncdu
    #osu-lazer-bin
    pcsx2
    #ppsspp
    #protonup
    prismlauncher
    #qbittorrent
    rar
      unrar
    #remmina
    #sm64coopdx
    #spotdl
    tldr
    tor-browser
    #ventoy-full-gtk
    vesktop
    vim
    #vscodium-fhs
    wget
    #winePackages.unstableFull
    wl-clipboard
    yt-dlp
    zip
      unzip
  ];
}
