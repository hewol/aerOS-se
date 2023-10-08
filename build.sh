#!/usr/bin/env bash

set -e

archlive_dir="archlive"
rerun=true

retry_build() {
    echo -n "Build failed. Do you want to retry the build? [y/N] "
    read -r retry
    if [[ ${retry:0:1} != "y" ]]; then
        rerun=false
    else
        echo
    fi
}

while $rerun; do
    cd "$archlive_dir"
    if ! sudo mkarchiso -v .; then
        retry_build
    else
        rerun=false
    fi
done

[[ $rerun == false ]] && echo "Building finished successfully." || echo "Building failed."
