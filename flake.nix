{
  description = "open-ost website local setup";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  outputs =
    { self, nixpkgs }:
    let
      systems = nixpkgs.lib.platforms.unix;
      eachSystem =
        f:
        nixpkgs.lib.genAttrs systems (
          system:
          f (
            import nixpkgs {
              inherit system;
              config = { };
              overlays = [ ];
            }
          )
        );
    in
    {
      devShells = eachSystem (pkgs: {
        default = pkgs.mkShell {
          packages = with pkgs; [
            ruby
            rubyPackages.github-pages
            gnumake
          ];
        };
      });

      packages = eachSystem (pkgs: {
        default = pkgs.writeShellApplication {
          name = "develop-local";
          runtimeInputs = with pkgs; [ ruby ];
          text = ''
            bundle # same as `bundle install`
            bundle exec jekyll serve
          '';
        };
      });

      apps = eachSystem (
        pkgs:
        pkgs.lib.mapAttrs (_: drv: {
          type = "app";
          program = "${drv}${drv.passthru.exePath or "/bin/${drv.pname or drv.name}"}";
        }) self.packages.${pkgs.stdenv.hostPlatform.system}
      );
    };
}
