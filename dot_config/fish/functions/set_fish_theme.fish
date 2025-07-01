function set_fish_theme
    set current_hour (date +%H)

    if test $current_hour -ge 6 -a $current_hour -lt 18
        yes | fish_config theme save "Catppuccin Latte"
    else
        yes | fish_config theme save "Catppuccin Macchiato"
    end
end

