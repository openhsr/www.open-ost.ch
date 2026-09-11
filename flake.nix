{
  description = "open-ost website local setup";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  outputs =
    { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
      };
    in
    {
      devShells.${system} = rec {
        default = pkgs.mkShell {
          packages = with pkgs; [
            ruby
          ];
          shellHook = ''
            echo ""
            bundle # same as `bundle install`
            bundle exec jekyll serve
          '';
        };
      };
    };
}
