#!/bin/bash

set -e
set -x

# ---------------------------------------------------------------------------------------------------------------------
# includes

. "${PWD}/scripts/config.sh"
. "${PWD}/scripts/functions.sh"
. "${PWD}/tmpRunConfig.sh"

# ---------------------------------------------------------------------------------------------------------------------
# tag everything

VERSION_GOLLUM=$(run gollum --version | grep -o "[0-9\.]*")
MAJOR="${VERSION_GOLLUM:0:1}"
MINOR="$(echo "${VERSION_GOLLUM}" | grep -o -P "^\d\.\d*")"

docker tag "${FULL}" "${LATEST}"

[[ -z "${MAJOR}" ]]          || docker tag "${FULL}" "${IMAGE}:${MAJOR}"
[[ -z "${MINOR}" ]]          || docker tag "${FULL}" "${IMAGE}:${MINOR}"
[[ -z "${VERSION_GOLLUM}" ]] || docker tag "${FULL}" "${IMAGE}:${VERSION_GOLLUM}"

# ---------------------------------------------------------------------------------------------------------------------
# write the tags to a file

cat > "${PWD}/tmpTagList.txt" <<__HERE__
"${TAG}"
"${MAJOR}"
"${MINOR}"
"${VERSION_GOLLUM}"
__HERE__

# ---------------------------------------------------------------------------------------------------------------------
# write the tags to a sh config file

cat > "${PWD}/tmpTagConfig.sh" <<__HERE__
MAJOR="${MAJOR}"
MINOR="${MINOR}"
VERSION_GOLLUM="${VERSION_GOLLUM}"
__HERE__
