# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
       ./herbstluft.nix
    ];

  nixpkgs.config.packageOverrides = pkgs: {
    nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
      inherit pkgs;
    };
  };

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.enableCryptodisk = true;
  
  networking.hostName = "motherbase"; # Define your hostname.
  nixpkgs.config.allowUnfree = true; # Allow unfree packages like the nvidia drivers.

  # Set your time zone.
  time.timeZone = "America/Chicago";
  services.localtime.enable = true;
  time.hardwareClockInLocalTime = true;

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.wireless.enable = false;
  networking.networkmanager.enable = true;
  networking.interfaces.enp0s31f6.useDHCP = true;
  networking.interfaces.wlp4s0.useDHCP = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Monospace";
    keyMap = "us";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Bumblebee -- I know its deprecated, hardware does not support offload. 
  hardware.bumblebee.enable = true;
  hardware.nvidia.powerManagement.enable = true;
  services.xserver.videoDrivers = [ "intel" ];
  services.xserver.dpi = 96;
  hardware.opengl.enable = true;
  hardware.opengl.driSupport32Bit = true;
    
  # Configure keymap in X11
  # services.xserver.xkbOptions = "eurosign:e";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.jalen = {
    isNormalUser = true;
    extraGroups = [ "wheel" "bumblebee" "libvirtd" ]; # Enable ‘sudo’ for the user.
    hashedPassword = "$6$a21W5OZg.B1A$FbnwFuE4/qV1LeBSy0IeNoL1ETnPFAkvgYWyqamGvRigOfMNneXtrlFgOaZh/SzPqSFqvQ1E8t/joJbsJfrsK.";
  };

  # List packages installed in system profile. To search, run:
  #$ nix search wget
  environment.systemPackages = with pkgs; [
    wget vim
    xorg.xf86videointel
    glxinfo
  ];

  # Virtual Box
  virtualisation.virtualbox.host.enable = true;
  virtualisation.virtualbox.host.enableExtensionPack = true;
  users.extraGroups.vboxusers.members = [ "jalen" ];

  # libvirtd
  virtualisation.libvirtd.enable = true;

  hardware.trackpoint.emulateWheel = true;

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.09"; # Did you read the comment?

}

