killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
polybar --config=~/.config/polybar/config.ini top_external &
polybar --config=~/.config/polybar/config.ini top &
