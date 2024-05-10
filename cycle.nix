with (import <nixpkgs> {});

stdenv.mkDerivation rec {
  pname = "cycle";
  version = "v0.3.0";

  quicklisp = fetchurl {
    url = "https://beta.quicklisp.org/quicklisp.lisp";
    sha256 = "sha256:05rcxg7rrkp925s155p0rk848jp2jxrjcm3q0hbn8wg0xcm5qyja";
  };

  src = fetchFromGitHub {
    owner = "asimpson";
    repo = pname;
    rev = version;
    hash = "sha256-AEGceS5hX8VrBYHeViCaR++DI2kBeR2IWcD9TH2Ea5U=";
  };

  buildInputs = [
    sbcl
  ];

  preBuild = ''
    export HOME=$out
    mkdir -p $out/ql
    mkdir -p $out/bin
    sbcl --load ${quicklisp} \
         --eval "(quicklisp-quickstart:install :path \"$out/ql/quicklisp\")" \
         --eval "(quit)" && \
    sbcl --load $out/ql/quicklisp/setup.lisp \
         --eval "(ql::without-prompting (ql:add-to-init-file))" \
         --eval "(quit)"
  '';

  installPhase = ''
    mv cycle $out/bin
  '';

  dontStrip = true;
}
