{ pkgs, inputs, config, ... }: {
  imports = [
    inputs.stylix.homeManagerModules.stylix
  ];

  stylix = {
    enable = true;
    image = ./nixw.png;
    polarity = "dark";
    #base16Scheme = "${pkgs.base16-schemes}/share/themes/material-darker.yaml";
    base16Scheme = {
    base00 = "000000";                                                                                                               
    base01 = "212121";                                                                                                              
    base02 = "424242";                                                                                                               
    base03 = "616161";                                                                                                              
    base04 = "757575";                                                                                                               
    base05 = "F5F5F5";                                                                                                               
    base06 = "F5F5F5";                                                                                                               
    base07 = "F5F5F5";                                                                                                               
    base08 = "EF5350";                                                                                                               
    base09 = "FF9800";                                                                                                               
    base0A = "FDD835";                                                                                                               
    base0B = "00BFA5";                                                                                                               
    base0C = "FFFFFF";                                                                                                               
    base0D = "757575";                                                                                                               
    base0E = "7E57C2";                                                                                                               
    base0F = "EF5350";
    };
   
    
    cursor = {
      name = "GoogleDot-White";
      package = pkgs.google-cursor;
      size = 17;
    };
    fonts = {
      serif = {
        name = "JetBrainsMono";
        package = pkgs.jetbrains-mono;
      };
      monospace = config.stylix.fonts.serif;
      emoji.package = pkgs.noto-fonts-emoji;
      sizes.terminal = 12;
    };
  };

  gtk = {
    enable = true;
    gtk3.extraConfig = {
      gtk-xft-antialias = 1;
      gtk-xft-hinting = 1;
      gtk-xft-hintstyle = "hintslight";
      gtk-xft-rgba = "rgb";
    };
    gtk2 = {
      configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";
      extraConfig = ''
        gtk-xft-antialias=1
        gtk-xft-hinting=1
        gtk-xft-hintstyle="hintslight"
        gtk-xft-rgba="rgb"
      '';
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
  };
}
