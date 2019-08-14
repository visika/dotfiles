[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

systemctl --user import-environment DISPLAY
# swap windows key with alt key, setxkbmap -option to reset
setxkbmap -option altwin:swap_alt_win
~/.fehbg
xrandr --dpi 201
exec i3
