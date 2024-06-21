{ pkgs, inputs, ... }: {

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [
    "FiraCode"
    "Ubuntu"
      "UbuntuMono"
      "CascadiaCode"
      "FantasqueSansMono"
      "JetBrainsMono"
      "Mononoki"
      "SpaceMono"
    ]; })

    (google-fonts.override { fonts = [
      # Sans
      "Gabarito" "Lexend"
      # Serif
      "Chakra Petch" "Crimson Text"
    ]; })
    openmoji-color
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    mplus-outline-fonts.githubRelease
    dina-font
    proggyfonts
  ];

}
