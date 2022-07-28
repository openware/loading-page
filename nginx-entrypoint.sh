#!/bin/sh

WWW_DIR=/usr/share/nginx/html
INJECT_FILE_SRC="${WWW_DIR}/inject.template.js"
INJECT_FILE_DST="${WWW_DIR}/inject.js"

envsubst < "${INJECT_FILE_SRC}" > "${INJECT_FILE_DST}"

mkdir -p ${WWW_DIR}/${BASE_PATH}
cp -r ${WWW_DIR}/* ${WWW_DIR}/${BASE_PATH}

[ -z "$@" ] && nginx -g 'daemon off;' || $@
