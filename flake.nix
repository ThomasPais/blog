{
  description = "Development environment for my Zola blog";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    { self, nixpkgs }:
    let
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      forAllSystems =
        f:
        builtins.listToAttrs (
          map (system: {
            name = system;
            value = f system;
          }) systems
        );
    in
    {
      devShells = forAllSystems (
        system:
        let
          pkgs = import nixpkgs { inherit system; };
        in
        {
          default = pkgs.mkShell {
            packages = with pkgs; [
              zola
            ];

            shellHook = ''
              echo "--- 🦀 Zola Development Environment ---"
              zola --version
              echo "Commands:"
              echo "  zola serve  - Start local dev server"
              echo "  zola build  - Build for production"
              echo "---------------------------------------"
            '';
          };
        }
      );
    };
}
