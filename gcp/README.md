```markdown
# Dockerfile for Alpine Linux with Terraform and Google Cloud SDK

This Dockerfile sets up an Alpine Linux image with Terraform, Google Cloud SDK, Python 3, AWS CLI, jq, git, and other necessary tools.

## Usage

1. Clone this repository:

```bash
git clone <repository-url>
```

2. Build the Docker image:

```bash
docker build -t alpine-terraform-gcloud .
```

3. Run a container based on the image:

```bash
docker run -it alpine-terraform-gcloud /bin/bash
```

## Software Versions

- **Alpine Linux Base Image:** 3.19.1
- **Terraform Version:** 1.7.4
- **Google Cloud SDK Version:** 467.0.0

## Installed Packages

- Python 3
- pip
- awscli
- jq
- git
- openssl
- unzip
- curl
- py3-cryptography
- bash
- gnupg
- yq (YAML processor)
- kubectl (Google Cloud SDK component)

## Notes

- This Dockerfile creates a non-root user named `dockuser`.
- The working directory is set to `/home/dockuser`.
- Upon building the image, it automatically installs Terraform, Google Cloud SDK, and other required tools.
