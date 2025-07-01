# TODO doesnt work
function change_zsh_arch
    set CURRENT_ARCH (arch)
    if test $CURRENT_ARCH = "i386"
        set ZSH_ARCH "arm64"
    else
        set ZSH_ARCH "x86_64"
    end
    arch -$ZSH_ARCH fish
end
