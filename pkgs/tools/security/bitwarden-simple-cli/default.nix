{ stdenv
, setuptools
, buildPythonPackage
, bitwarden-cli
, fetchFromGitHub
, asn1crypto
, cffi
, cryptography
, pycparser
}:

buildPythonPackage rec {
  pname = "bitwarden-simple-cli";
  version = "1.3.1";

  src = fetchFromGitHub {
    owner = "mickaelperri";
    repo = "bitwarden-decrypt-cli";
    rev = "v${version}";
    sha256 = "1nvx66d57p7frr9gcvfkrbn36jwjafy02mh8prm77am1sixrj885";
  };

  buildInputs = [
    bitwarden-cli
  ];

  propagatedBuildInputs = [
    setuptools
    asn1crypto
    cffi
    cryptography
    pycparser
  ];

  postPatch = ''
    sed -i "s/==/>=/g" requirements/common.txt
  '';

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Bitwarden CLI ported to Python to decrypt secrets";
    homepage = "https://github.com/mickaelperrin/bitwarden-decrypt-cli";
    license = licenses.gpl3;
    platforms = platforms.all;
    maintainers = with maintainers; [ albakham luc65r ];
  };
}
