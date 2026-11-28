#!/usr/bin/env zsh

set -eu

script_dir="${0:A:h}"

print "Running dotfiles init scripts.\n"

for file in "${script_dir}"/scripts/init/*.zsh; do
    print "Running: ${file}"
    # 変数やシェルオプションがほかのスクリプトに影響しないよう、別プロセスで実行する
    zsh "${file}"
    print "Done: ${file}\n"
done

print "All init scripts have finished."
