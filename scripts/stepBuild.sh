#!/bin/bash

set -e
set -x

# ---------------------------------------------------------------------------------------------------------------------
# includes

. "${PWD}/scripts/config.sh"
. "${PWD}/scripts/functions.sh"
. "${PWD}/tmpRunConfig.sh"

# ---------------------------------------------------------------------------------------------------------------------
# build

docker build --build-arg "BASE_IMAGE=${BASE_IMAGE}" -t "${FULL}" .
