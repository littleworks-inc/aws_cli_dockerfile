# Use the latest Alpine Linux base image
FROM alpine:3.19.1

ENV TERRAFORM_VERSION=1.7.4
ENV CLOUD_SDK_VERSION=467.0.0
ENV PATH /google-cloud-sdk/bin:$PATH

# Add a non-root user named dockuser
RUN addgroup -g 1000 dockuser \
    && adduser -D -G dockuser -u 1000 dockuser

RUN if [ `uname -m` = 'x86_64' ]; then echo -n "x86_64" > /tmp/arch; else echo -n "arm" > /tmp/arch; fi;

# Install necessary packages: Python 3, pip, awscli, jq, git
RUN ARCH=`cat /tmp/arch` && apk --update --no-cache add \
        python3 \
        py3-pip \
        py3-yaml \
        jq \
        git \
        openssl \
        unzip \
        curl \
        py3-cryptography \
        bash \
        gnupg \
    # Install yq (YAML processor)
    && wget -q -O /usr/bin/yq $(wget -q -O - https://api.github.com/repos/mikefarah/yq/releases/latest | jq -r '.assets[] | select(.name == "yq_linux_amd64") | .browser_download_url') \
    && chmod +x /usr/bin/yq \
    && echo "Intalling Terraform ...." \
    && wget -q https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    && unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/bin \
    && curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-${CLOUD_SDK_VERSION}-linux-${ARCH}.tar.gz \
    && tar xzf google-cloud-cli-${CLOUD_SDK_VERSION}-linux-${ARCH}.tar.gz \
    && rm google-cloud-cli-${CLOUD_SDK_VERSION}-linux-${ARCH}.tar.gz \
    && gcloud components install kubectl \
    && rm -rf /var/cache/apk/*

# Switch to the dockuser
USER dockuser

# Set the working directory
WORKDIR /home/dockuser
