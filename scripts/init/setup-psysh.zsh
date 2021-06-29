#!/usr/bin/env zsh

set -eu

echo "Setup psysh"

download_url="https://psysh.org/manual/ja/php_manual.sqlite"
download_to="${HOME}/.local/share/psysh/php_manual.sqlite"
download_to_dir=`dirname ${download_to}`

echo "Create ${download_to_dir} directory"
mkdir -p ${download_to_dir}

if [ -e ${download_to} ]; then
    echo "File ${download_to} is already exist."
    echo "Delete the old file."
    rm ${download_to}
fi

echo "Gets manual file from ${download_url}."
echo "Save to ${download_to}"
if type "wget" > /dev/null 2>&1; then
    echo "Use wget command."
    wget -O ${download_to} ${download_url}
elif type "curl" > /dev/null 2>&1; then
    echo "Use curl command."
    curl -o ${download_to} ${download_url}
else
    echo "\"wget\" or \"curl\" command is missing."
    echo "Skip psysh manual download."
fi
