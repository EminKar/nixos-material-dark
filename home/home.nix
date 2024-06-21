{ config, pkgs, inputs, ... }:

{
  
  imports = [ 
  ./system 
  ./programs
  ./stylix/stylix.nix ];

  home.username = "emin";
  home.homeDirectory = "/home/emin";

  
  home.stateVersion = "24.05";

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };
  
  home.packages = with pkgs; [
    htop
    fastfetch
    gnome.nautilus
    icon-library
    playerctl 
    mpd
    ydotool

    hyprcursor
    xdg-desktop-portal-hyprland
    wlr-randr
    gnome.gnome-themes-extra
    wlsunset
    xwayland
    xdg-desktop-portal-gtk
    wlroots
    qt5ct
    libva
    dconf
    wayland-utils
    wayland-protocols
    meson

    telegram-desktop
    android-studio
    vscode-with-extensions
    jetbrains.idea-community-bin
    kotlin
                                                                                                                                                                                                        python312Packages.requests 
  ];

  

  programs.home-manager.enable = true;



}
