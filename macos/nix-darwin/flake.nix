{
  description = "Example nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs }:
  let
    configuration = { pkgs, config, ... }: {

      nixpkgs.config.allowUnfree = true;
	
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages =
        [
          pkgs.ansible
          pkgs.brave
	        pkgs.cmatrix
	        pkgs.doppler
          pkgs.dotnet-sdk
          pkgs.git-credential-manager
          pkgs.go
          pkgs.google-chrome
          pkgs.k9s
          #pkgs.karabiner-elements
	        pkgs.kubectl
	        pkgs.kustomize
          pkgs.mkalias
          pkgs.neovim
          pkgs.neofetch
          pkgs.obsidian
          pkgs.rectangle
          pkgs.starship
	        pkgs.stow
	        pkgs.terraform
	        pkgs.vscodium
        ];

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      system.activationScripts.applications.text = let
	env = pkgs.buildEnv {
	  name = "system-applications";
	  paths = config.environment.systemPackages;
	  pathsToLink = "/Applications";
	};
      in
	pkgs.lib.mkForce ''
	# Set up applications.
	echo "setting up /Applications..." >&2
	rm -rf /Applications/Nix\ Apps
	mkdir -p /Applications/Nix\ Apps
	find ${env}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
	while read -r src; do
	  app_name=$(basename "$src")
	  echo "copying $src" >&2
	  ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
	done
	    '';

      # Enable alternative shell support in nix-darwin.
      # programs.fish.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 6;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#peacock
    darwinConfigurations."peacock" = nix-darwin.lib.darwinSystem {
      modules = [ configuration ];
    };
  };
}
