#!/bin/bash

set -e
set -x

# ---------------------------------------------------------------------------------------------------------------------
# includes

. "${PWD}/scripts/config.sh"
. "${PWD}/scripts/functions.sh"
. "${PWD}/tmpRunConfig.sh"
. "${PWD}/tmpTagConfig.sh"

# ---------------------------------------------------------------------------------------------------------------------
# push everything

# docker push "${FULL}"
docker push "${LATEST}"

[[ -z "${MAJOR}" ]]          || docker push "${IMAGE}:${MAJOR}"
[[ -z "${MINOR}" ]]          || docker push "${IMAGE}:${MINOR}"
[[ -z "${VERSION_GOLLUM}" ]] || docker push "${IMAGE}:${VERSION_GOLLUM}"
