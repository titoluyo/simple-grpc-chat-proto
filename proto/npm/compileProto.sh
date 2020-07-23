#!/bin/bash

set -e

PWD="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROTO_PATH=$PWD/../src
PROTO_DIR="${PWD}/proto_out"

rm -f "${PWD}/proto-schemas.js"
rm -f "${PWD}/proto-schemas.d.ts"
rm -rf "${PROTO_DIR}"

mkdir "${PROTO_DIR}"
cp -R "${PROTO_PATH}/" "${PROTO_DIR}"

TOP_LEVEL_PROTOS=( $(find ${PROTO_DIR} -name "*.proto") )

# JS
pbjs --es6 -t static-module --path "${PROTO_DIR}" --out "${PWD}/proto-schemas.js" ${TOP_LEVEL_PROTOS[@]}

# TypeScript
pbts --out "${PWD}/proto-schemas.d.ts" "${PWD}/proto-schemas.js"

