{ pkgs, config, ... }: {
  home.packages = with pkgs; [ hyprpaper ];

  xdg.configFile."hypr/hyprpaper.conf".text = ''
    preload = ~/.config/wallpapers/nixw.png
    wallpaper = ,~/.config/wallpapers/nixw.png
    ipc=true
    splash=false
  '';
}
