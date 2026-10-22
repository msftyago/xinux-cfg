#                  .-'''-.
#                 '   _    \
#       .       /   /` '.   \  __  __   ___         __.....__
#     .'|      .   |     \  ' |  |/  `.'   `.   .-''         '.
#    <  |      |   '      |  '|   .-.  .-.   ' /     .-''"'-.  `.
#     | |      \    \     / / |  |  |  |  |  |/     /________\   \
#     | | .'''-.`.   ` ..' /  |  |  |  |  |  ||                  |
#     | |/.'''. \  '-...-'`   |  |  |  |  |  |\    .-------------'
#     |  /    | |             |  |  |  |  |  | \    '-.____...---.
#     | |     | |             |__|  |__|  |__|  `.             .'
#     | |     | |                                 `''-...... -'
#     | '.    | '.
#     '---'   '---'
{
  config,
  lib,
  pkgs,
  inputs,
  system,
  ...
}:
{
  home = {
    username = "yago";
    homeDirectory = "/home/yago";
    enableNixpkgsReleaseCheck = false;
    stateVersion = "26.05";
    sessionVariables = {
      EDITOR = "emacs";
    };
  };
  
  # nixpkgs.config.allowUnfree = true; 

  imports = [
    ./packages.nix
  ];

  programs.emacs = {
   enable = true;
   package = pkgs.emacs;
   extraPackages = epkgs: with epkgs; [
      ah
      avy
      kkp
      meow
      helm
      anzu
      emms
      xclip
      cargo
      magit
      corfu
      eping
      flymd
      #racer
      direnv
      pandoc
      elfeed
      blamer
      docker
      ipcalc
      quelpa
      rustic
      #agenix
      neotree
      blacken
      nethack
      ac-html
      #enlight
      ac-clang
      ac-emoji
      treemacs
      undohist
      wat-mode
      transwin
      toml-mode
      fish-mode
      scopeline
      grip-mode
      pdf-tools
      #netrunner
      docker-cli
      org-modern
      nerd-icons
      lsp-docker
      #ace-window
      wat-ts-mode
      elune-theme
      dummyparens
      auto-org-md
      wat-ts-mode
      #achievements
      cabledolphin
      esmond-theme
      lsp-treemacs
      mermaid-mode
      company-racer
      all-the-icons
      markdown-mode
      wakatime-mode
      pretty-symbols
      #sideline-eglot
      cargo-transient
      dockerfile-mode
      pretty-sha-path
      auto-virtualenv
      readable-numbers
      multiple-cursors
      #sideline-flymake
      #sideline-flycheck
      rainbow-delimiters
      docker-compose-mode
      all-the-icons-dired
      mermaid-docker-mode
      nerd-icons-completion

      # Nix
      nixfmt
      nix-mode
      nix-buffer
      nixpkgs-fmt
      nix-ts-mode
      nix-sandbox
      nix-modeline
      org-nix-shell
      nixos-options
      pretty-sha-path

      # Treemacs
      treemacs-tab-bar
      # treemacs-nerd-icons
      # treemacs-all-the-icons

      # Lisp
      elpaca
      elisp-def
      elisp-refs
      elisp-format

      # Haskell
      lsp-haskell
      haskell-mode
      haskell-tab-indent
    ];
  };

  # programs.devenv = {
  #   enable = true;
  #   enableBashIntegration = true;
  #   enableFishIntegration = true;
  #   enableZshIntegration = true;
  # };

  programs.home-manager.enable = true;
  
  programs.gh.enable = true;

  programs.git = {
    settings = {
      user = {
        name = "Kamol Hakimov";
        email = "meow@meow.uz";
        };

      ignores = [
          "rustfmt.toml"
          "# -*- mode: gitignore; -*-"
	  "*~"
          "\#*\#"
          "/.emacs.desktop"
          "/.emacs.desktop.lock"
          "*.elc"
          "auto-save-list"
          "tramp"
          ".\#*"
          "./nixos/parts/.secrets"
          "./modules/catnet.nix "
          "# Org-mode"
          ".org-id-locations"
          "*_archive"
          "# flymake-mode"
          "*_flymake.*"
          "# eshell files"
          "/eshell/history"
          "/eshell/lastdir"
          "# elpa packages"
          "/elpa/"
          "# reftex files"
          "*.rel"
          "# AUCTeX auto folder"
          "/auto/"
          "# cask packages"
          ".cask/"
          "dist/"
          "# Flycheck"
          "flycheck_*.el"
          "# server auth directory"
          "/server/"
          "# projectiles files"
          ".projectile"
          "# directory configuration"
          ".dir-locals.el"
          "# network security"
          "/network-security.data"
          "# undo-tree"
          "*.~undo-tree~"
      ];
      init.defaultBranch = "main";
    };
  };
}
