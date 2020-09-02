#!/bin/bash

set -e
set -x

echo "PWD: $(pwd)"
echo "=============================="
echo "$(ls -al)"
echo "=============================="
echo "$(env)"

. "${PWD}/scripts/functions.sh"
