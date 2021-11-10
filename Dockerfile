# https://hub.docker.com/r/hashicorp/terraform/tags
ARG TERRAFORM_VERSION
FROM hashicorp/terraform:$TERRAFORM_VERSION

ARG TERRAGRUNT_VERSION

# Install terragrunt binary & make it executable
RUN wget -O /bin/terragrunt https://github.com/gruntwork-io/terragrunt/releases/download/v${TERRAGRUNT_VERSION}/terragrunt_linux_amd64 \
  && chmod +x /bin/terragrunt

## Create plugins directory for terraform
RUN mkdir /plugins

# Install all plugins
WORKDIR /tmp

ADD install.sh install.sh
ADD providers.yml providers.yml
RUN ./install.sh $PLUGINS_PATH

# Clear everything in the tmp folder
RUN rm * && rm -R .terraform

# Add terraformrc on the home folder
ADD terraformrc /root/.terraformrc

WORKDIR /terragrunt

# entrypoint set to terragrunt
ENTRYPOINT /bin/terragrunt
