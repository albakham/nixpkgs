{ lib
, rustPlatform
, fetchCrate
, pinentry
, openssl
, pkgconfig
, cargo
}:

rustPlatform.buildRustPackage rec {
  pname = "rbw";
  version = "0.2.2";

  src = fetchCrate {
    inherit version;
    crateName = "${pname}";
    sha256 = "1rj0fkc1x78w85z2qy0dwa60vm0rhbp677f3wgadwrsk69cp9p7p";
  };
   
  cargoSha256 = "00l653al12vwxm8vrsf7lj0drx367hv4hmxq6licnvnqrvl913li";

  nativeBuildInputs = [
    pkgconfig
  ];

 # BuildInputs = [
 #   pinentry
 #   openssl
 # ];

  preConfigure = ''
    export OPENSSL_INCLUDE_DIR="${openssl.dev}/include"
    export OPENSSL_LIB_DIR="${openssl.out}/lib"
  '';

  meta = with lib; {
    description = "Unofficial command line client for Bitwarden";
    homepage = "https://crates.io/crates/rbw";
    license = licenses.mit;
    maintainers = with maintainers; [ albakham luc65r ];
    platforms = platforms.all;
  };
}

