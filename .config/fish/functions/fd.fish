function fd --description "Fuzzy find a file and cd to it"
  set __fd_dir (rg --files --hidden ~ | fzf | xargs dirname)
  [ "$__fd_dir" != "" ] && cd $__fd_dir
end
