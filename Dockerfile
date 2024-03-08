# Use the latest Alpine Linux base image
FROM alpine:latest

ENV TERRAFORM_VERSION=1.7.4
ENV TERRAFORM_SHA256=<SHA256_checksum>

# Install necessary packages: Python 3, pip, awscli, jq, git, gnupg
RUN apk --update --no-cache add \
        python3 \
        py3-pip \
        py3-yaml \
        aws-cli \
        jq \
        git \
        openssl \
        unzip \
        curl \
        py3-cryptography \
        gnupg \
    # Install yq (YAML processor)
    && wget -q -O /usr/bin/yq $(wget -q -O - https://api.github.com/repos/mikefarah/yq/releases/latest | jq -r '.assets[] | select(.name == "yq_linux_amd64") | .browser_download_url') \
    && chmod +x /usr/bin/yq \
    && echo "Intalling Terraform ...." \
    && wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    && wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_SHA256SUMS \
    && wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_SHA256SUMS.sig \
    && gpg --keyserver hkp://keyserver.ubuntu.com --recv-keys 51852D87348FFC4C \
    && gpg --verify terraform_${TERRAFORM_VERSION}_SHA256SUMS.sig terraform_${TERRAFORM_VERSION}_SHA256SUMS \
    && sha256sum -c --ignore-missing terraform_${TERRAFORM_VERSION}_SHA256SUMS \
    && unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/bin \
    && rm -rf terraform_${TERRAFORM_VERSION}_linux_amd64.zip terraform_${TERRAFORM_VERSION}_SHA256SUMS terraform_${TERRAFORM_VERSION}_SHA256SUMS.sig

# Add a non-root user named dockuser
RUN addgroup -g 1000 dockuser \
    && adduser -D -G dockuser -u 1000 dockuser

# Switch to the dockuser
USER dockuser

# Set the working directory
WORKDIR /home/dockuser

# Specify any additional configuration or commands as needed
