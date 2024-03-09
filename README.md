```markdown
# Docker Image Build Pipelines

This repository contains GitHub Actions workflow YAML files for building and publishing Docker images containing CLI tools for various cloud platforms. The workflows are triggered on pushes to any branch.

## Pipelines

### AWS Pipeline

- **File:** [docker_aws_image.yml](docker_aws_image.yml)
- **Description:** This pipeline builds and publishes a Docker image containing the AWS CLI tools.

### Azure Pipeline

- **File:** [docker_azure_image.yml](docker_azure_image.yml)
- **Description:** This pipeline builds and publishes a Docker image containing the Azure CLI tools.

### GCP Pipeline

- **File:** [docker_gcp_image.yml](docker_gcp_image.yml)
- **Description:** This pipeline builds and publishes a Docker image containing the Google Cloud Platform CLI tools.

## Pipeline Overview

Each pipeline is designed to perform the following tasks:

1. **Checkout:** Checks out the code at the specified commit SHA.
2. **Set up QEMU:** Configures QEMU to support multi-platform builds.
3. **Set up Docker Buildx:** Sets up Docker Buildx for building Docker images for multiple platforms.
4. **Lint Dockerfile:** Lints the Dockerfile located in the respective directory (`aws/`, `azure/`, `gcp/`) to ensure Dockerfile best practices are followed.
5. **Log in to Docker Hub:** Logs in to Docker Hub using the provided Docker Hub username and token stored as GitHub secrets.
6. **Generate Docker Metadata:** Generates metadata for the Docker image, including labels and tags.
7. **Build & Push Docker Image:** Builds and pushes the Docker image to the specified container registry (Docker Hub).
8. **Scan Docker Image:** Scans the Docker image for security vulnerabilities (CVEs) using the Docker Scout action.

## Environment Variables

Each pipeline uses the following environment variables:

- `REGISTRY`: The container registry where the Docker image will be pushed (e.g., Docker Hub).
- `IMAGE_NAME`: The name of the Docker image.
- `COMPARE_TAG`: The tag to compare the changes with (e.g., `latest`).
- `SHA`: The GitHub commit SHA of the pushed commit.

## Usage

1. Clone this repository:

```bash
git clone <repository-url>
```

2. Modify the YAML files (`docker_aws_image.yml`, `docker_azure_image.yml`, `docker_gcp_image.yml`) or Dockerfiles in the respective directories (`aws/`, `azure/`, `gcp/`) as needed.

3. Ensure that Docker is installed and configured on your local machine.

4. Push changes to the repository to trigger the respective pipeline(s).

## Additional Notes

- Each pipeline is written using GitHub Actions YAML syntax.
- Docker Hub is assumed as the container registry. Modify the login step if using a different registry.
- The pipelines are set up to run on Ubuntu latest runners.
- For security, Docker Hub credentials should be stored as GitHub secrets.
```