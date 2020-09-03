#!/bin/bash

set -e
set -x

# ---------------------------------------------------------------------------------------------------------------------
# includes

. "${PWD}/scripts/config.sh"
. "${PWD}/scripts/functions.sh"
. "${PWD}/tmpRunConfig.sh"

# ---------------------------------------------------------------------------------------------------------------------
# Get Detailed Version Information

VERSION_GEM=$(run gem --version)
VERSION_GOLLUM=$(run gollum --versions)

cat > "${PWD}/tmpDetailedVersion.txt" << __HERE__
## ${TAG}

### Gollum Version Info

\`\`\`
${VERSION_GOLLUM}
\`\`\`

### Ruby Gem Version

\`\`\`
${VERSION_GEM}
\`\`\`

__HERE__

cat "${PWD}/tmpDetailedVersion.txt"
