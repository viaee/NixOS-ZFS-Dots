{ inputs, config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.home-manager
    ];


#------------------------------------------------------------------

# Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.devices = [ "nodev" ];
  boot.loader.grub.efiInstallAsRemovable = true;
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.useOSProber = true;
  boot.supportedFilesystems = [ "zfs" ];
  boot.zfs.requestEncryptionCredentials = true;
  boot.zfs.devNodes = "/dev/disk/by-partuuid";
  services.zfs.autoScrub.enable = true; 

  networking.hostId = "d13e0d41";
#------------------------------------------------------------------

# Hostname / System Settings
  networking.hostName = "navi"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

#------------------------------------------------------------------

# XORG / WAYLAND

 services = {
    xserver = {
      enable = false;
      displayManager.gdm = {
        enable = true;
        wayland = true;
      };
    };
    dbus.enable = true;
    gvfs.enable = true;
    tumbler.enable = true;
  };


#------------------------------------------------------------------

 # XDG Portals
  xdg = {
    autostart.enable = true;
    portal = {
      enable = true;
      extraPortals = [
        pkgs.xdg-desktop-portal
        pkgs.xdg-desktop-portal-gtk
      ];
    };
  };


#------------------------------------------------------------------

# Experimental Features (flakes)
nix.settings.experimental-features = [ "nix-command" "flakes" ];


#------------------------------------------------------------------

# AMD Drviers
  boot.initrd.kernelModules = [ "amdgpu" ];
  services.xserver.videoDrivers = [ "amdgpu" ];
  hardware.enableRedistributableFirmware = true;

hardware = {
    opengl.enable = true;
};


#------------------------------------------------------------------

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = false;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };


#------------------------------------------------------------------

# Hyprland
programs.hyprland.enable = true;


#------------------------------------------------------------------

# User
  users.users.vi = {
    isNormalUser = true;
    description = "vi";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      vim
      btop
      kitty
      nwg-look
      xdg-desktop-portal-hyprland
      cinnamon.nemo
      polkit_gnome
      ranger
      unzip
      p7zip
      unrar
      rofi-wayland
      python311Packages.pip
      python311Packages.pylint-venv
      python311
      zsh
      git
      wget 
      imagemagick
      dunst
      wpgtk
      geany
      nsxiv
      grim
      slurp
      wl-clipboard
      xdg-user-dirs
      neovim
    ];
  };
  
fonts.packages = with pkgs; [
	nerdfonts
	noto-fonts
	noto-fonts-emoji
];
#------------------------------------------------------------------

# Environment Variables
 environment.sessionVariables = {
    POLKIT_AUTH_AGENT = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
    XDG_SESSION_TYPE = "wayland";
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
    MOZ_ENABLE_WAYLAND = "1";
    SDL_VIDEODRIVER = "wayland";
    _JAVA_AWT_WM_NONREPARENTING = "1";
    CLUTTER_BACKEND = "wayland";
    WLR_RENDERER = "vulkan";
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_DESKTOP = "Hyprland";
    GTK_USE_PORTAL = "1";
    NIXOS_XDG_OPEN_USE_PORTAL = "1";
  }; 


#------------------------------------------------------------------

# ZSH
programs.zsh.enable = true;
users.defaultUserShell = pkgs.zsh;

#------------------------------------------------------------------

# Allow unfree packages
  nixpkgs.config.allowUnfree = true;

#------------------------------------------------------------------

# System Packages
  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
     wayland
     wlroots
     wayland-protocols
     home-manager
  ];


#------------------------------------------------------------------

# Automatic Garbage Collection
nix.gc = {
                automatic = true;
                dates = "weekly";
                options = "--delete-older-than 4d";
        };


#------------------------------------------------------------------

# Auto system update
system.autoUpgrade = {
      enable = true;
};


#------------------------------------------------------------------

# Home Manager
home-manager = {
  extraSpecialArgs = { inherit inputs; };
  users = {
    vi = import ./home.nix;
  };
};


#------------------------------------------------------------------

# Apparmor
security.apparmor = {
 enable = true;
 
};

#------------------------------------------------------------------

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

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

#------------------------------------------------------------------

}
