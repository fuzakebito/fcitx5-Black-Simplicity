{
  description = "Flake for fcitx5-Black-Simplicity";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }: {


    packages.x86_64-linux.default = 

      with import nixpkgs { system = "x86_64-linux"; };
      stdenv.mkDerivation {
        pname = "fcitx5-Black-Simplicity";
        version = "1.0";

        src = self;
      
        installPhase = ''
          mkdir -p $out/share/fcitx5/themes/
          cp -r Black-Simplicity $out/share/fcitx5/themes/
        '';

        meta = {
          description = "A monochrome skin that gives a simpler look to fcitx5";
          homepage = "https://github.com/fuzmare/fcitx5-Black-Simplicity";
          license = lib.licenses.mit;
          maintainers = with lib.maintainers; [ ProbablyRohan ];
          platforms = lib.platforms.all;
        };
      };

  };
}
