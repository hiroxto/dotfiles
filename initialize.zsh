#!/usr/bin/env zsh

set -eu

script_dir="${0:A:h}"

print "Run dotfiles init scripts.\n"

for file in "${script_dir}"/scripts/init/*.zsh; do
    print "Run : ${file}"
    # 変数やシェルオプションがほかのスクリプトに影響しないよう、別プロセスで実行する
    zsh "${file}"
    print "Done : ${file}\n"
done

print "Finished init scripts."
