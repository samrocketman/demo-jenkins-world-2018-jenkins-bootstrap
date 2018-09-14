#!/bin/bash -l
# copied from https://github.com/samrocketman/jervis/blob/7989236b92f466b18a2a816560b3729fd16c7f9a/resources/header.sh
export PS4='$ '
echo '# ENVIRONMENT SECTION'
echo -n "Hostname: "
hostname
echo -n "Distro: "
head -n1 /etc/issue
echo -n "Kernel: "
uname -rms
echo -n "Bash: "
bash --version | head -n1
export JERVIS_RANDOM="${RANDOM}"
echo "JERVIS_RANDOM: ${JERVIS_RANDOM}"
set -auxeEo pipefail
