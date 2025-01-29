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

    # Now the plugins are physically in /lib/gstreamer-1.0
    Env = [
      "GST_PLUGIN_PATH=/lib/gstreamer-1.0"
    ];
  };
}
