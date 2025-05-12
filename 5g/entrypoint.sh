#!/usr/bin/env bash
set -o errexit
set -o nounset
set -o pipefail
if [[ "${TRACE-0}" == "1" ]]; then
    set -o xtrace
fi

function becho {
    echo -e "\033[1m$1\033[0m"
}

becho "|-- SCC365: Ryu Docker Image 🐳 --|"
ryu-manager "$@"
