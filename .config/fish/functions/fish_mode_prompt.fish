function fish_mode_prompt --description 'Displays the current mode'
    switch $fish_bind_mode
      case default
          set_color ebcb8b
            echo 'n'
        case insert
            set_color 88c0d0
            echo 'i'
        case visual
            set_color b48ead
            echo 'v'
    end
    set_color normal
    echo -n ' '
end
