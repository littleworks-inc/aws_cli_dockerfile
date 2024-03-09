# Use the latest Alpine Linux base image
FROM alpine:3.19.1

ENV TERRAFORM_VERSION=1.7.4
ENV AZURE_CLI_VERSION=2.0.81

# Install necessary packages: Python 3, pip, awscli, jq, git
RUN apk --update --no-cache add \
        alpine-sdk \
        python3 \
        python3-dev \
        py3-pip \
        py3-yaml \
        jq \
        git \
        openssl \
        unzip \
        curl \
        py3-cryptography \
        gcc \
        libc-dev \
        libffi-dev \
    # Install yq (YAML processor)
    && wget -q -O /usr/bin/yq $(wget -q -O - https://api.github.com/repos/mikefarah/yq/releases/latest | jq -r '.assets[] | select(.name == "yq_linux_amd64") | .browser_download_url') \
    && chmod +x /usr/bin/yq \
    && echo "Intalling Terraform ...." \
    && wget -q https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    && unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/bin \
    && rm -rf /var/cache/apk/*

RUN pip install --upgrade pip --break-system-packages \
    && pip install azure-cli --break-system-packages

# Add a non-root user named dockuser
# RUN addgroup -g 1000 dockuser \
#     && adduser -D -G dockuser -u 1000 dockuser

# # Switch to the dockuser
# USER dockuser

# # Set the working directory
# WORKDIR /home/dockuser
