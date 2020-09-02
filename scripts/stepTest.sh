#!/bin/bash

set -e
set -x

# ---------------------------------------------------------------------------------------------------------------------
# includes

. "${PWD}/scripts/config.sh"
. "${PWD}/scripts/functions.sh"
. "${PWD}/tmpRunConfig.sh"

# ---------------------------------------------------------------------------------------------------------------------
# run basic test

CONTAINER="$(createTestContainerName)"
runTestContainer "${CONTAINER}" "${TAG}"

curl "http://127.0.0.1:3080/"

docker stop "${CONTAINER}"
