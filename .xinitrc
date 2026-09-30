#!/bin/sh

export PATH="$HOME/.local/bin:$PATH"

export XDG_SESSION_TYPE=x11
export XDG_CURRENT_DESKTOP=dwm
export XDG_SESSION_DESKTOP=dwm

export XMODIFIERS=@im=fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx

dbus-update-activation-environment --systemd \
    DISPLAY XAUTHORITY DBUS_SESSION_BUS_ADDRESS \
    XDG_SESSION_TYPE XDG_CURRENT_DESKTOP XDG_SESSION_DESKTOP \
    XMODIFIERS GTK_IM_MODULE QT_IM_MODULE

xsetroot -cursor_name left_ptr

xwallpaper --zoom "$HOME/Pictures/IMG_0545.JPG"

fcitx5 -d &
picom --config "$HOME/.config/picom/picom.conf" &
slstatus &

(
    sleep 2
    wpctl set-volume @DEFAULT_AUDIO_SINK@ 0%
    wpctl set-mute @DEFAULT_AUDIO_SINK@ 0
) &

export GTK_THEME=Adwaita

exec "/usr/local/bin/dwm"
