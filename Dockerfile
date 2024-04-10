FROM ghcr.io/actions/actions-runner:2.315.0

ARG TARGETARCH

USER root

RUN <<EOF
apt-get update -y
apt-get install -y --no-install-recommends \
 git curl rsync
EOF

RUN <<EOF
export RUNNER_ARCH=${TARGETARCH}
export KUBECTL_VERSION=v1.29.3
curl -LO https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/${RUNNER_ARCH}/kubectl
echo "$(curl -L -s https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/${RUNNER_ARCH}/kubectl.sha256) kubectl"  | sha256sum --check
install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
EOF

RUN curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

USER runner
