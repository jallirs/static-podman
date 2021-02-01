FROM nixos/nix
  
RUN nix-channel --update
RUN nix-env -i git
RUN git clone --branch v2.0.6 https://github.com/containers/podman.git
WORKDIR podman
RUN nix build --max-jobs 8 -f nix/ 
RUN ./result-bin/bin/podman --version



FROM nixos/nix
  
RUN nix-channel --update
RUN nix-env -i git
RUN git clone --branch v2.0.20 https://github.com/containers/conmon.git
WORKDIR conmon
RUN nix build  --print-build-logs --max-jobs 8 --cores 4 -f nix/ 
RUN ./result-bin/bin/conmon --help
