# Use the latest Alpine Linux base image
FROM alpine:latest

ENV TERRAFORM_VERSION=1.7.4
# ARG ANSIBLE_VERSION=9.1.0
# ARG ANSIBLE_LINT_VERSION=6.22.1

# Install necessary packages: Python 3, pip, awscli, jq, git
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
    # Install yq (YAML processor)
    && wget -q -O /usr/bin/yq $(wget -q -O - https://api.github.com/repos/mikefarah/yq/releases/latest | jq -r '.assets[] | select(.name == "yq_linux_amd64") | .browser_download_url') \
    && chmod +x /usr/bin/yq \
    && echo "Intalling Terraform ...." \
    && wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    && unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/bin \
    # && pip3 install --no-cache-dir --upgrade \
    #     pip \
    # && pip3 install --no-cache-dir --upgrade --no-binary \
    #     ansible==${ANSIBLE_VERSION} \
    #     ansible-lint==${ANSIBLE_LINT_VERSION} \
    # && ansible --version \
    # Remove unnecessary files
    && rm -rf /var/cache/apk/*
