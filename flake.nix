
{
  
  outputs = { self, nixpkgs, home-manager, stylix,... }@inputs: 
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      lib = nixpkgs.lib;
    in {
      
      nixosConfigurations = {
        emx = inputs.nixpkgs.lib.nixosSystem {
	        specialArgs = { inherit inputs; };
	         modules = [ 
	           ./nixos/configuration.nix
           ];
	        };
         };
 
      homeConfigurations = {
        emin = home-manager.lib.homeManagerConfiguration {
          pkgs = inputs.nixpkgs.legacyPackages."x86_64-linux";
          extraSpecialArgs = { inherit inputs; };
          modules = [        
            ./home/home.nix
     
          ];
        };
      };

};

 inputs = {                                                                                                
   nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
   chaotic.url = "https://flakehub.com/f/chaotic-cx/nyx/*.tar.gz";
   
   home-manager = {
   url = github:nix-community/home-manager;                           
   inputs.nixpkgs.follows = "nixpkgs";                                      };

   stylix.url = "github:danth/stylix";

 };

 nixConfig = {
    builders-use-substitutes = true;
    auto-optimise-store = true;
    experimental-features = [ "nix-command" "flakes" ];
  };

}
