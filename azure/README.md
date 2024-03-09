```markdown
# Dockerfile for Alpine Linux with Terraform and Azure CLI

This Dockerfile sets up an Alpine Linux image with Terraform, Azure CLI, Python 3, pip, jq, git, and other necessary tools.

## Usage

1. Clone this repository:

```bash
git clone <repository-url>
```

2. Build the Docker image:

```bash
docker build -t alpine-terraform-azure .
```

3. Run a container based on the image:

```bash
docker run -it alpine-terraform-azure /bin/bash
```

## Software Versions

- **Alpine Linux Base Image:** 3.19.1
- **Terraform Version:** 1.7.4
- **Azure CLI Version:** 2.0.81

## Installed Packages

- Python 3
- pip
- jq
- git
- openssl
- unzip
- curl
- py3-cryptography
- gcc
- libc-dev
- libffi-dev
- yq (YAML processor)

## Notes

- This Dockerfile creates a non-root user named `dockuser`.
- The working directory is set to `/home/dockuser`.
- Upon building the image, it automatically installs Terraform, Azure CLI, and other required tools.
