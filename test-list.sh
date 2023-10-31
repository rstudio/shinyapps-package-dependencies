#!/bin/bash

# Lists packages that are supported and testable.
all_packages=$(find packages/ -mindepth 1 -maxdepth 1 -type d)

for package in ${all_packages}; do
    if [ ! -f "${package}"/UNSUPPORTED ]; then
        basename "${package}"
    fi
done
