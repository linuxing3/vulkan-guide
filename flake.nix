{
  description = "A Nix-flake-based C/C++ development environment";

  inputs.nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/0.1.*.tar.gz";

  outputs = { self, nixpkgs }:
    let
      supportedSystems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
      forEachSupportedSystem = f: nixpkgs.lib.genAttrs supportedSystems (system: f {
        pkgs = import nixpkgs { inherit system; };
      });
    in
    {
      devShells = forEachSupportedSystem ({ pkgs }: {
        default = pkgs.mkShell.override
          {
          }
          rec {
            # Override stdenv in order to change compiler:
            # stdenv = pkgs.clangStdenv;
            buildInputs = with pkgs; [
              SDL2
              vulkan-headers
              vk-bootstrap
            ];

            cmakeFlags = with buildInputs; [
            ];

            LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath buildInputs;
            C_INCLUDE_PATH = pkgs.lib.makeIncludePath buildInputs;
            CXX_INCLUDE_PATH = pkgs.lib.makeIncludePath buildInputs;

            packages = with pkgs; [
              clang-tools
              cmake
              codespell
              conan
              cppcheck
              doxygen
              gtest
              lcov
              vcpkg
              vcpkg-tool

              SDL2
              xorg.libX11
              xorg.libXcursor
              xorg.libXrandr
              xorg.libXi
              xorg.libXau
              xorg.libxcb
              xorg.libXinerama
              xorg.xkbutils
              vk-bootstrap
              glslang
              vulkan-loader
              vulkan-helper
              vulkan-headers
              vulkan-tools-lunarg
              vulkan-utility-libraries
              vulkan-validation-layers
              vulkan-volk
              vulkan-tools
            ] ++ (if system == "aarch64-darwin" then [ ] else [ gdb ]);
          };
      });
    };
}

