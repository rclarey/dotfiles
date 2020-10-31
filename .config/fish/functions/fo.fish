function fo --description "Fuzzy find a file and open it"
  set __fo_file (rg --files --hidden ~ | fzf)
  [ "$__fo_file" != "" ] && open $__fo_file
end
