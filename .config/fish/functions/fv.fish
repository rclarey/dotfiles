function fv --description "Fuzzy find a file and open it with vim"
  set __fv_file (rg --files --hidden ~ | fzf)
  [ "$__fv_file" != "" ] && vim $__fv_file
end
