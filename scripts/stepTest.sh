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

HOST_PORT="127.0.0.1:3080"
BASE="http://${HOST_PORT}"

curl "${BASE}/" > /dev/null
curl "${BASE}/Page1.md" > /dev/null
curl "${BASE}/Page1" > /dev/null
curl "${BASE}/gollum/search?q=test" > /dev/null
curl "${BASE}/gollum/search?q=foo" > /dev/null
curl "${BASE}/Page1_9" > /dev/null
curl "${BASE}/large.bin" > /dev/null

docker stop "${CONTAINER}"
