# docker-terragrunt
Docker image with terraform &amp; terragrunt

## Usage

Set your favorite terraform version & terragrunt version as build arg.

docker build --build-arg TERRAFORM_VERSION=1.0.7 --build-arg TERRAGRUNT_VERSION=0.34.3 --no-cache -t terragrunt:latest .
