# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./system/hardware-configuration.nix
      ./system/fonts.nix
      ./system/variables.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.configurationLimit = 2;
  
  boot = {
   kernelPackages = inputs.chaotic.packages.${pkgs.system}.linuxPackages_cachyos;
   initrd.kernelModules = [ "amdgpu" ];
  };
  
  nixpkgs.config.allowUnfree = true;
  
 system.autoUpgrade = {
  enable = true;
  channel = "https://nixos.org/channels/nixos-unstable";
 };
  
 services.auto-cpufreq.enable = true;

 nix = {
  settings.auto-optimise-store = true;
  gc = {
   automatic = true;
   dates = "weekly";
   options = "--delete-older-than 7d";
  };
 };

 
 programs.zsh.enable = true;
 users.defaultUserShell = pkgs.zsh;

 networking.hostName = "emx"; # Define your hostname.
  # Pick only one of the below networking options.

 networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.


 time.timeZone = "Europe/Riga";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
   console = {
     font = "Lat2-Terminus16";
     keyMap = "us";
#     useXkbConfig = true; # use xkb.options in tty.
   };
 
 xdg.portal.enable = true;
 xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  # Enable the X11 windowing system.
 #services.xserver.enable = true;
 services.displayManager.sddm.enable = true;
 services.displayManager.sddm.wayland.enable = true;
 services.displayManager.autoLogin.enable = true;
 services.displayManager.autoLogin.user = "emin";

 
 programs.hyprland = {
   enable = true;
   xwayland.enable = true;

 };

  # Enable the Plasma 5 Desktop Environment.
#  services.xserver.displayManager.sddm.enable = true;
#  services.xserver.desktopManager.plasma5.enable = true;
  

  # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  security.rtkit.enable = true; 
  services.pipewire = {
  enable = true;
  alsa.enable = true;
  alsa.support32Bit = true;
  pulse.enable = true;
  # If you want to use JACK applications, uncomment this
  #jack.enable = true;
};
  # hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
   users.users.emin = {
     isNormalUser = true;
     extraGroups = [ "wheel" ]; 
   };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
     firefox 
     wget
     git
     kitty
     pavucontrol
     glib
     grim
     slurp
     wayland
     satty
     wl-clipboard
     gcc
     brightnessctl
     hyprpicker
     swappy

     python311Packages.requests
     python310Packages.requests 
   ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "23.11"; # Did you read the comment?

 nix = {
  package = pkgs.nixFlakes;
  extraOptions = "experimental-features = nix-command flakes";
 };


}

