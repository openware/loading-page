#!/bin/sh

WWW_DIR=/usr/share/nginx/html
INJECT_FILE="${WWW_DIR}/inject.js"

envsubst < "${INJECT_FILE}.tpl" > "${INJECT_FILE}"

mkdir -p ${WWW_DIR}/${BASE_PATH}
cp -r ${WWW_DIR}/* ${WWW_DIR}/${BASE_PATH}

[ -z "$@" ] && nginx -g 'daemon off;' || $@
