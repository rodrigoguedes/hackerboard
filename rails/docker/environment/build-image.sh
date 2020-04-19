#!/bin/bash

set -o errexit

readonly VERSION_RUBY="2.7.1"
readonly VERSION_RAILS="6.0.2.2"
readonly DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
readonly VERSION=${VERSION:-ruby_$VERSION_RUBY-rails_$VERSION_RAILS-"$(cat VERSION.txt)"}
readonly IMAGE_NAME="rails-environment"
readonly IMAGE_PREFIX="${IMAGE_PREFIX:-rodrigoguedes}"
readonly IMAGE_TAG="${IMAGE_TAG:-$VERSION}"

build_image() {
  local full_name=$IMAGE_PREFIX/$IMAGE_NAME:$IMAGE_TAG

  echo -n -e " \033[1;31m
  Starting to build image
    FULL_NAME:              $full_name
    IMAGE_PREFIX:           $IMAGE_PREFIX
    IMAGE_TAG:              $IMAGE_TAG
    CONTEXT:                $(realpath ./)
  \033[0m
"
  docker build \
    --build-arg BUILD_DATE=$(date -u +'%Y-%m-%dT%H:%M:%SZ') \
    --build-arg BUILD_VERSION=$IMAGE_TAG \
    --build-arg VERSION_RUBY=$VERSION_RUBY \
    --build-arg VERSION_RAILS=$VERSION_RAILS \
    --tag "$IMAGE_PREFIX/$IMAGE_NAME:$IMAGE_TAG" \
    --tag "$IMAGE_PREFIX/$IMAGE_NAME:local" \
    $DIR \
    "$@"

  echo -e -n " \033[1;31m
  Succesfully built $full_name
  \033[0m"
}

build_image "$@"