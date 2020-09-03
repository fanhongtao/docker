#!/bin/bash

set -e
set -x

# ---------------------------------------------------------------------------------------------------------------------
# includes

. "${PWD}/scripts/config.sh"

# ---------------------------------------------------------------------------------------------------------------------
# write config file

TIMESTAMP=$(date +%Y%m%d-%H%M%S)
TAG="BUILD-${TIMESTAMP}"
FULL="${IMAGE}:${TAG}"
LATEST="${IMAGE}:latest"

cat > "${PWD}/tmpRunConfig.sh" <<__HERE__
TIMESTAMP="${TIMESTAMP}"
TAG="${TAG}"
FULL="${FULL}"
LATEST="${LATEST}"
__HERE__
