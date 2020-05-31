function pour_brews
  # install brew if we don't have it yet
  if not type -q brew
    /bin/bash -c "(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  end

  # now the packages
  brew cask install emacs-mac
  brew install ripgrep ffmpeg imagemagick deno vim tldr neofetch htop fzf cloc yadm
end
