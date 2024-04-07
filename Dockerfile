FROM ghcr.io/actions/actions-runner:2.315.0

RUN <<EOF
apt-get install -y git
EOF

ENTRYPOINT ["bash"]
