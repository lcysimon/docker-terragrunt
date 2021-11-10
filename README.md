# docker-terragrunt
Docker image with terraform &amp; terragrunt & github actions configured

## Docker hub

All docker images are published to [docker hub](https://hub.docker.com/repository/docker/lcysimon/terragrunt), tagged with Terragruntversion_Terraformversion

## Usage

### Local build

Set your favorite terraform version & terragrunt version as build arg.

`docker build --build-arg TERRAFORM_VERSION=1.0.7 --build-arg TERRAGRUNT_VERSION=0.34.3 --no-cache -t terragrunt:latest .`

### Release workflow

- Update [providers.yml](providers.yml) to reflect the providers you want. The providers will be built inside the docker image so you do not have time to download them each time. You will not be able to use providers from the internet due to the .terraformrc file
- Update the [github workflow file](./.github/workflows/build-and-push.yml) with the proper versions
- Create a merge request, this will test that your docker image can be built.
- On merge, it will publish the new docker image to dockerhub with proper tags
