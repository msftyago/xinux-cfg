# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{ config, pkgs, ... }:
{
  imports =
    [
      ./hardware.nix
      ./modules.nix
      ./disko.nix
      #./../../../mahalla/home.nix
    ];

  networking.hostName = "xinux";
  
  modules.xinux.language = "en_US.UTF-8";
  
  nixpkgs.config.permittedInsecurePackages = [
    "olm-3.2.16"
  ];

  services.xserver.xkb.layout = "us";
  console.useXkbConfig = true;

  users.users."yago" = {
    isNormalUser = true;
    description = "Chicken";
    extraGroups = [ "wheel" "wireshark" "networkmanager" "dialout" ];

    packages = with pkgs; [
      dig
      wget
      zeek
      trippy
      snicat
      netcat
      tshark
      tcpdump
      nethack
      suricata
      bandwhich
      inetutils

      vlc
      #nyxt
      anki
      gimp
      #lmms
      #nheko
      #kicad
      #krita
      #docker
      #ardour
      #fractal
      #element
      keymapp
      discord
      spotify
      #blender
      obsidian
      #gccgo14
      #audacity
      #gns3-gui
      #guitarix
      #openscad
      librewolf
      wireshark
      #dockerfmt
      #nerdfonts
      #proton-vpn
      obs-studio
      #element-web
      thunderbird
      qbittorrent
      yandex-music
      #docker-compose
      #element-desktop
      telegram-desktop
      #jetbrains-toolbox
      #libsForQt5.kamoso
      #ciscoPacketTracer8
      #ciscoPacketTracer7
      #docker-color-output
      libreoffice-qt6-still
      #dockerfile-language-server

      #kdePackages.akregator
      #kdePackages.alligator
      #kdePackages.bovo
      #kdePackages.falkon
      #kdePackages.filelight
      #kdePackages.francis
      #kdePackages.ghostwriter
      #kdePackages.isoimagewriter
      #kdePackages.kalarm
      #kdePackages.kalgebra
      #kdePackages.kamera
      #kdePackages.kamoso
      #kdePackages.kapman
      #kdePackages.karousel
      #kdePackages.kasts
      #kdePackages.kate
      #kdePackages.katomic
      #kdePackages.kbackup
      #kdePackages.kcachegrind
      #kdePackages.kclock
      #kdePackages.kcolorchooser
      #kdePackages.kcolorpicker
      #kdePackages.kdenlive
      #kdePackages.kfind
      #kdePackages.kget
      #kdePackages.kigo
      #kdePackages.kmahjongg
      #kdePackages.kmplot
      #kdePackages.knavalbattle
      #kdePackages.knetwalk
      #kdePackages.kolourpaint
      #kdePackages.konqueror
      #kdePackages.konquest
      #kdePackages.konversation
      #kdePackages.krdc
      #kdePackages.kreversi
      #kdePackages.krfb
      #kdePackages.kruler
      #kdePackages.kshisen
      #kdePackages.ksirk
      #kdePackages.ksudoku
      #kdePackages.ksystemlog
      #kdePackages.ksystemstats
      #kdePackages.kteatime
      #kdePackages.ktorrent
      #kdePackages.ktouch
      #kdePackages.marble
      #kdePackages.minuet
      #kdePackages.neochat
      #kdePackages.palapeli
      #kdePackages.step
      #kdePackages.umbrello
      #kdePackages.yakuake
      ];
  };

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    notonoto
    nerdctl
    iosevka
    liberation_ttf
    fira-code
    fira-code-symbols
    mplus-outline-fonts.githubRelease
    dina-font
    proggyfonts
  ];

  environment.sessionVariables.NIXPKGS_ALLOW_UNFREE = "1";

  environment.systemPackages = with pkgs; [
    nh
    lf
    git
    bat
    vim
    meow
    tmux
    spek
    htop
    tree
    btop
    fish
    curl
    nixd
    yazi
    emacs
    kitty
    oxker
    whois
    direnv
    cowsay
    lolcat
    bottom
    ntfs3g
    csvlens
    symbola
    busybox
    openocd
    rustfmt
    pkgconf
    hyfetch
    lazygit
    ripgrep
    hasklig	
    onefetch
    lemonade
    binsider
    keycloak
    firejail
    pciutils
    usbutils
    scope-tui
    alejandra
    man-pages
    font-alias
    nixpkgs-fmt
    mullvad-vpn    
    wakatime-cli
    rust-analyzer
    man-pages-posix
    mullvad-browser
    mullvad-compass
    gnome-disk-utility
    bluez-experimental

    netbird
    netbird-ui
    netbird-dashboard
    netbird-management

    fishPlugins.done
    fishPlugins.sponge
    fishPlugins.pisces
    fishPlugins.puffer
    fishPlugins.forgit
    fzf
    #fishPlugins.gruvbox
    fishPlugins.wakatime-fish
    fishPlugins.colored-man-pages
    fishPlugins.fish-you-should-use
    fishPlugins.grc
    grc
  ];

  system.stateVersion = "26.05";

  programs.nix-data = {
    enable = true;
    systemconfig = "/home/yago/nix/systems/x86_64-linux/xinux/default.nix";
    flake = "/home/yago/nix/flake.nix";
    hostname = "xinux";
  };
}
