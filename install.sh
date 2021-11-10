#!/bin/sh

set -ex

export TF_PLUGIN_CACHE_DIR="/plugins"

# Ugly script to install all providers contain in providers.yml
NAME=""
VERSION=""
cat providers.yml | while read line; do
  case "$line" in
  *name:*)
    NAME=${line##* }
    ;;
  *version:*)
    VERSION=${line##* }
    ;;
  esac

  # If we have name & version, let's install & reset them
  if [ ! -z $VERSION ] && [ ! -z $NAME ]
  then
    echo -e "terraform {
  required_providers {
    aws = {
      source  = \"$NAME\"
      version = \"= $VERSION\"
    }
  }
}" > version.tf
    # Install provider
    terraform init
    # Remove dependency file created
    rm .terraform.lock.hcl
    VERSION=""
    NAME=""
  fi


done
