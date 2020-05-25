{
  description = "A flake for building Hello World";

  edition = 201909;

  inputs.nixpkgs.url = github:NixOS/nixpkgs/nixos-20.03;

  outputs = { self, nixpkgs }: {

    defaultPackage.x86_64-darwin =
      # Notice the reference to nixpkgs here.
      with import nixpkgs { system = "x86_64-darwin"; };
      stdenv.mkDerivation {
        name = "hello";
        src = self;
        buildPhase = "clang -o hello ./hello.c";
        installPhase = "mkdir -p $out/bin; install -t $out/bin hello";
      };
  };
}
