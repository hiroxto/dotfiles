def task(desc, &block)
  puts "\033[0;36m#{desc}\033[0;39m"
  block.call
  puts "\033[0;36mFinish task!\033[0;39m"
end

def shell(command)
  puts " -> \"#{command}\""
  `#{command}`
end

def path(p)
  File.expand_path(p)
end

def git(repo)
  use_ssh = File.exist?(path("~/.ssh/GitHub/id_rsa"))
  use_ssh ? "git@github.com:#{repo}" : "git://github.com/#{repo}"
end

task("シンボリックリンクを作成") do
  %w(
    .editorconfig
    .gemrc
    .gitconfig
    .gitignore_global
    .hgignore_global
    .hgrc
    .nanorc
    .railsrc
    .tmux.conf
    .vimrc
    .zshrc
  ).each do |file|
    task("Link #{file} to ~/#{file}") do
      shell("ln -sf ~/dotfiles/#{file} ~/#{file}")
    end
  end
end

task("~/binのシンボリックリンクを作成") do
  next if File.exist?(path("~/bin"))
  shell("ln -sf ~/dotfiles/bin ~/bin")
end

task("oh-my-zshをインストール") do
  next if File.exist?(path("~/.oh-my-zsh"))
  remote = git("robbyrussell/oh-my-zsh.git")
  shell("git clone #{remote} ~/.oh-my-zsh")
end

task("anyenvをインストール") do
  next if File.exist?(path("~/.anyenv"))
  remote = git("riywo/anyenv")
  shell("git clone #{remote} ~/.anyenv")
  shell("source ~/.zshrc")
end

task("*envをインストール") do
  %w(rbenv phpenv pyenv crenv ndenv).each do |name|
    task("#{name}をインストール") do
      shell("anyenv install -f #{name}")
    end unless File.exist?(path("~/.anyenv/envs/#{name}"))
  end
end

task(".nanorcをセットアップ") do
  next if File.exist?(path("~/.nano"))
  remote = git("scopatz/nanorc")
  shell("git clone #{remote} ~/.nano")
  shell("cat nanorc.nanorc >> ~/.nanorc")
end

task("vimをセットアップ") do
  task("neobundleをインストール") do
    remote = git("Shougo/neobundle.vim")
    shell("mkdir -p ~/.vim/bundle")
    shell("git clone #{remote} ~/.vim/bundle/neobundle.vim")
  end unless File.exist?(path("~/.vim/bundle"))

  colors = {
    molokai: {
      url: "https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim",
      path: path("~/.vim/colors/molokai.vim"),
    },
    onedark: {
      url: "https://raw.githubusercontent.com/geoffharcourt/one-dark.vim/master/colors/onedark.vim",
      path: path("~/.vim/colors/onedark.vim"),
    },
  }

  task("Vim colorをインストール") do
    shell("mkdir -p ~/.vim/colors")
    colors.each do |name, info|
      task("Vim color (#{name})をインストール") do
        shell("curl -Sslf #{info[:url]} > #{info[:path]}")
      end
    end
  end
end

task("composerをセットアップ") do
  %w(composer.json composer.lock config.json).each do |f|
    task("Link ~/dotfiles/.composer/#{f} to ~/.composer/#{f}") do
      shell("ln -sf ~/dotfiles/.composer/#{f} ~/.composer/#{f}")
    end
  end

  task("composerのglobal packageをインストール") do
    shell("composer g install")
  end
end

task("psyshをセットアップ") do
  shell("ln -sf ~/dotfiles/.local/share/psysh/php_manual.sqlite ~/.local/share/psysh/php_manual.sqlite")
end