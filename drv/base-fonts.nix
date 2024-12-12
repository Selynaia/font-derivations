{ pkgs }: pkgs.stdenv.mkDerivation rec {
  name = "base-fonts";
  src = pkgs.fetchFromGitHub {
    owner = "Selynaia";
    repo = "fonts";
    rev = "afb836b1105bdecf025c90f4636edb1779685c99";
    hash = "sha256-b8k/y2WtF7O8YKekOkGi2JviYy28GMRCvT6VxhLR+/c=";
    fetchSubmodules = false;
    deepClone = false;
    sparseCheckout = [
      "base-fonts"
    ];
  };
  dontConfigure = true;
  dontBuild = true;
  doCheck = false;

  installPhase = ''
    mkdir -p $out/share/fonts
    mkdir -p $out/share/fonts/${name}
    cp -r "${src}/base-fonts/ttf" "$out/share/fonts/${name}"
  '';
}
