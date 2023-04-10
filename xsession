ulimit -Sc 0

export LANG=en_US.UTF-8
export ENV=$HOME/.zshrc
export MOZ_USE_XINPUT2=1
export MOZ_ACCELERATED=1
export MOZ_WEBRENDER=1
export XDG_SESSION_TYPE=x11
export USE_WASM=1

if [ -x ${PREFIX}/bin/dbus-launch -a -z "${DBUS_SESSION_BUS_ADDRESS}" ]; then
	eval `dbus-launch --sh-syntax --exit-with-x11`
fi

xset b 0 0 0 &
xset s off
xset r rate 350 35 &
xrdb -merge .Xresources &

pkill xidle
xidle -delay 5 -sw -program "/usr/X11R6/bi/slock" -timeout 1800 &

xcompmgr -c -C -f -I 0.1 -O 0.1 &
hsetroot -fill Pictures/4.jpg &
dunst &
tint2 &
exec cwm 
