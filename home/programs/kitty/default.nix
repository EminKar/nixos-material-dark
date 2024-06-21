{ config, pkgs, ... }: {

  programs.kitty = {
    enable = true;
    settings = {

      scrollback_lines = 10000;
      enable_audio_bell = false;
      update_check_interval = 0;
      font_family = "FiraCode Nerd Font Mono";
      font_size = 13;
      cursor_shape = "Underline";
      cursor_underline_thickness = 1;
      window_padding_width = 10;
      url_style = "curly";
      confirm_os_window_close = "0";
      remember_window_size = "no";
      disable_ligatures = "never";
      initial_window_width = 1200;
      initial_window_height = 600;

      background = "#040409";
      url_color = "#000000";

      color0 = "#000000";
      color8 = "#515878";
      color1 = "#f7768e";
      color9 = "#f7869e";
      color2 = "#73daca";
      color10 = "#83eada";
      color3 = "#e0af68";
      color11 = "#f0bf78";
      color4 = "#7aa2f7";
      color12 = "#8ab2f7";
      color5 = "#9978F8";
      color13 = "#A988F8";
      color6 = "#bbcde5";
      color14 = "#ccdef6";
      color7 = "#E4E5E7";
      color15 = "#f4f5f7";

      cursor = "#FCFCFC";
      cursor_text_color = "#040409";

      selection_foreground = "#000000";
      selection_background = "#bbcde5";
    };
  };
}
