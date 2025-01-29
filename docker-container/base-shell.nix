{ pkgs ? import <nixpkgs> {} }:

pkgs.dockerTools.buildImage {
  name = "interactive-bash-docker";

    tag = "latest";
    copyToRoot = pkgs.buildEnv {
      name = "image-root";
      paths = [ pkgs.bashInteractive ];
      pathsToLink = [ "/bin" ];
    };

  config = {
    Cmd = [ "bash" ];
  };
}
