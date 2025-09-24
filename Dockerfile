# set to unset value to avoid warning
ARG OPENTOFU_VERSION="unset"

FROM ghcr.io/opentofu/opentofu:${OPENTOFU_VERSION}-minimal AS tofu

FROM alpine:3.20

# Copy the tofu binary from the minimal image
COPY --from=tofu /usr/local/bin/tofu /usr/local/bin/tofu

ARG TERRAGRUNT_VERSION

# Install terragrunt binary & make it executable
RUN wget -O /bin/terragrunt https://github.com/gruntwork-io/terragrunt/releases/download/v${TERRAGRUNT_VERSION}/terragrunt_linux_amd64 \
  && chmod +x /bin/terragrunt

# Add curl to call rest api
RUN apk add curl git
RUN apk upgrade

WORKDIR /terragrunt

# entrypoint set to terragrunt
ENTRYPOINT ["/bin/terragrunt"]