# Use the latest Alpine Linux base image
FROM alpine:latest

# Install necessary packages: Python 3, pip, awscli, jq, git
RUN apk --no-cache add \
        python3 \
        py3-pip \
        aws-cli \
        jq \
        git \
    # Install yq (YAML processor)
    && wget -q -O /usr/bin/yq $(wget -q -O - https://api.github.com/repos/mikefarah/yq/releases/latest | jq -r '.assets[] | select(.name == "yq_linux_amd64") | .browser_download_url') \
    && chmod +x /usr/bin/yq \
    # Remove unnecessary files
    && rm -rf /var/cache/apk/*
