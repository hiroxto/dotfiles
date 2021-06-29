#!/usr/bin/env zsh

set -eu

echo "Setup composer configs"

COMPOSER_BIN_INSTALL_DIR=`realpath ${HOME}/bin-local`
COMPOSER_BIN=`realpath ${COMPOSER_BIN_INSTALL_DIR}/composer`
COMPOSER_BIN_FILENAME=`basename ${COMPOSER_BIN}`

if type "php" > /dev/null 2>&1; then
    if [ -e ${COMPOSER_BIN} ]; then
        echo "Composer binary is already exists."
    else
        echo "Download composer binary"
        mkdir -p ${COMPOSER_BIN_INSTALL_DIR}
        curl -sS https://getcomposer.org/installer | php -- --install-dir=${COMPOSER_BIN_INSTALL_DIR} --filename=${COMPOSER_BIN_FILENAME}
    fi

    echo "Install composer global packages"
    ${COMPOSER_BIN} g install
else
    echo "php command does not exist."
    echo "Skip setup composer configs."
fi
