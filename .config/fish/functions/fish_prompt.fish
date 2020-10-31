function fish_prompt --description 'Write out the prompt'
    set -l last_status $status

    # User
    set_color 81a1c1
    echo -n $USER
    set_color normal

    # echo -n '@'

    # Host
    # set_color $fish_color_host
    # echo -n (prompt_hostname)
    # set_color normal

    echo -n ':'

    # PWD
    set_color 81a1c1
    echo -n (prompt_pwd)
    set_color normal

    git_prompt
    fish_hg_prompt
    echo

    if not test $last_status -eq 0
        set_color $fish_color_error
    end

    echo -n '➤ '
    set_color normal
end
