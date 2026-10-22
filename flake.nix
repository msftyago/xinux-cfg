{

  description = "xinux flake";

  nixConfig.experimental-featues = [ "nix-command" "flakes" ];

  inputs = {
    nixpkgs.url = "git+https://git.oss.uzinfocom.uz/xinux/nixpkgs?ref=nixos-26.05&shallow=1";

    xinux-lib = {
      url = "git+https://git.oss.uzinfocom.uz/xinux/lib?ref=release-26.05&shallow=1";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    xinux-modules = {
      #url = "git+https://git.oss.uzinfocom.uz/msft/xinux-modules?ref=release-26.05&shallow=1";
      #url = "git+https://git.oss.uzinfocom.uz/msft/xinux-modules";
      url = "path:/home/yago/modules";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    nix-data = {
      url = "git+https://git.oss.uzinfocom.uz/xinux/nix-data?ref=release-26.05&shallow=1";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    uz-xkb = {
      url = "git+https://git.oss.uzinfocom.uz/mirrors/uzbek-linux-keyboard?shallow=1";
      flake = false;
    };
    
    disko = {
      url = "git+https://git.oss.uzinfocom.uz/mirrors/disko?ref=master&shallow=1";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      # inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs:
    inputs.xinux-lib.mkFlake {
      inherit inputs;
      src = ./.;

      channels-config.allowUnfree = true;
      # home-manager.backupFileExtension = "hm-backup";
      
      systems.modules.nixos = with inputs; [
      
        disko.nixosModules.disko
        nix-data.nixosModules.nix-data
        xinux-modules.nixosModules.efiboot
        xinux-modules.nixosModules.meta
	# home-manager.nixosModules.home-manager
  
  ];
  # mahalla.modules = with inputs; [];
  };
}