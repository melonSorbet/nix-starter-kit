{
  description = "A GStreamer development flake";

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
        bash = buildImage {
                name = "bash";
                tag = "latest";
                copyToRoot = pkgs.buildEnv {
                name = "image-root";
                paths = [ pkgs.bashInteractive ];
                pathsToLink = [ "/bin" ];
            };
            config = {
                Cmd = [
                  "nginx"
                  "-c"
                  nginxConf
                ];
                ExposedPorts = {
                  "${nginxPort}/tcp" = { };
                };
          };
        };


    };
}
