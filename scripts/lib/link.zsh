#!/usr/bin/env zsh

# link_to にファイルやシンボリックリンクが既にある場合は作成しない
create_symlink() {
    local link_from="$1"
    local link_to="$2"

    echo "Link ${link_from} to ${link_to}"

    # リンク切れのシンボリックリンクは -e が偽になるため、-L でも判定する
    if [ -e "${link_to}" ] || [ -L "${link_to}" ]; then
        echo "File '${link_to}' is already exist."
        echo "Skip create symbolic link."
    else
        echo "Create symbolic link to ${link_to}"
        ln -s "${link_from}" "${link_to}"
    fi
}
