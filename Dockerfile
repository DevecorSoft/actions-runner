FROM ghcr.io/actions/actions-runner:2.315.0

RUN <<EOF
sudo apt-get update
sudo apt-get install -y git
EOF

ENTRYPOINT ["bash"]
