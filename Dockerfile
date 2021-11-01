# https://hub.docker.com/r/hashicorp/terraform/tags
ARG TERRAFORM_VERSION
FROM hashicorp/terraform:$TERRAFORM_VERSION

ARG TERRAGRUNT_VERSION

# Install terragrunt binary & make it executable
RUN wget -O /bin/terragrunt https://github.com/gruntwork-io/terragrunt/releases/download/v${TERRAGRUNT_VERSION}/terragrunt_linux_amd64 \
  && chmod +x /bin/terragrunt

WORKDIR /terragrunt

# entrypoint set to terragrunt
ENTRYPOINT /bin/terragrunt
