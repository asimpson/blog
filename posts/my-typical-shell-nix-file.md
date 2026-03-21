I use nix to manage packages on macOS and on Linux (nixOS). This is for my future self more than anything to document my "ideal" `shell.nix` file.

```nix
{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.go
    pkgs.gopls
    pkgs.nodejs
  ];

  hardeningDisable = [ "fortify" ];

  shellHook = ''
    DIRECTORY_NAME="/tmp/$(basename "$PWD")"
    mkdir -p $DIRECTORY_NAME/go-cache $DIRECTORY_NAME/go $DIRECTORY_NAME/npm
    export GOPATH=$DIRECTORY_NAME/go
    export GOCACHE=$DIRECTORY_NAME/go-cache
    export NODE_PATH=$DIRECTORY_NAME/npm
    export NPM_CONFIG_PREFIX=$NODE_PATH
    export PATH=$DIRECTORY_NAME/go/bin:$PATH:$NODE_PATH/bin
  '';
}
```
The goal of `shell.nix` is to give every project it's own shell where all the needed tools are available and isolate each project from itself, e.g. one project can use a different version of `node`.

I've settled on the convention of `/tmp/<project-dir-name>` as the location for "language" or "runtime" dependencies. Meaning, `nix` handles bringing in `node` but then `node` wants to install things too. `/tmp` is a nice place because I don't care where that stuff goes I just don't want it to collide with other things.
