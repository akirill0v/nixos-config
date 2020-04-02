{ stdenv, curl, glfw, freetype, fetchzip }:
stdenv.mkDerivation rec {
  pname = "volt";
  version = "0.80";

  src = fetchzip {
    url = "https://github.com/voltapp/volt/releases/download/${version}/volt_linux.zip";
    sha256 = "1kj7xb3lc48hca8jqf0c8ixr2wjaklgpkx679pah8iksdkqxz8pi";
    stripRoot = false;
  };

  buildPhase = ":";

  installPhase = ''
    mkdir -p $out/bin
    cp ./volt $out/bin/
  '';

  preFixup = let
    libPath = stdenv.lib.makeLibraryPath [ curl glfw freetype ];
  in ''
    patchelf \
      --set-interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" \
      --set-rpath "${libPath}" \
      $out/bin/volt
  '';

  dontStrip = true;

  meta = with stdenv.lib; {
    homepage = https://volt-app.com/;
    description = "a 300 KB desktop client for Slack, Skype, Gmail, Twitter, Facebook and more";
    license = license.proprietary;
    platforms = platforms.linux;
    maintainers = [ mt-caret ];
  };
}
