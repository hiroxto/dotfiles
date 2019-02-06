#!/usr/bin/env zsh

set -eu

echo "Setup psysh"

DOWNLOAD_URL="https://psysh.org/manual/ja/php_manual.sqlite"
DOWNLOAD_TO_DIR="${HOME}/.local/share/psysh"
MANUAL_FILE_NAME="php_manual.sqlite"
DOWNLOAD_TO_FILE="${DOWNLOAD_TO_DIR}/${MANUAL_FILE_NAME}"

echo "Create ${DOWNLOAD_TO_DIR} directory"
mkdir -p ${DOWNLOAD_TO_DIR}

if [ -e ${DOWNLOAD_TO_FILE} ]; then
    echo "File ${DOWNLOAD_TO_FILE} is already exist."
    echo "Delete the old file."
    rm ${DOWNLOAD_TO_FILE}
fi

echo "Gets manual file from ${DOWNLOAD_URL}."
echo "Save to ${DOWNLOAD_TO_FILE}"
if type "wget" > /dev/null 2>&1; then
    echo "Use the wget command."
    wget -O ${DOWNLOAD_TO_FILE} ${DOWNLOAD_URL}
elif type "curl" > /dev/null 2>&1; then
    echo "Use the curl command."
    curl -o ${DOWNLOAD_TO_FILE} ${DOWNLOAD_URL}
else
    echo "\"wget\" or \"curl\" command is missing."
    echo "Skip the manual download."
fi
