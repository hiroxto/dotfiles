# aliasの設定

# 基本的なalias
alias nano="nano -w"
alias vi="vim"
alias rmdir="rm -rf"
alias mkdir="mkdir -p"
alias cp="cp -i"
alias mv="mv -i"

# grcが使える環境でのみgrcで色をつける設定
if [ type grc > /dev/null 2>&1 ];then
  alias mount="grc mount"
  alias ifconfig="grc ifconfig"
  alias dig="grc dig"
  alias -g netstat="grc netstat"
  alias ping="grc ping"
  alias ps="grc ps"
  alias traceroute="grc traceroute"
  alias gcc="grc gcc"
fi