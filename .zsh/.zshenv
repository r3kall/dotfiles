typeset -U path PATH
path=(~/.local/bin $path)
export PATH

# Use vivid to customize ls_colors.
export LS_COLORS="$(vivid generate one-dark)"

# Alacritty workaround.
export WINIT_UNIX_BACKEND=x11
