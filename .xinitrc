#!/bin/sh

export PATH="$HOME/.local/bin:$PATH"

export XDG_SESSION_TYPE=x11
export XDG_CURRENT_DESKTOP=dwm
export XDG_SESISON_DESKTOP=dwm

dbus-update-activation-environment --systemd \
    DISPLAY XAUTHORITY DBUS_SESSION_BUS_ADDRESS \
    XDG_SESSION_TYPE XDG_CURRENT_DESKTOP XDG_SESSION_DESKTOP

systemctl --user import-environment \
    DISPLAY XAUTHORITY \
    XDG_SESSION_TYPE XDG_CURRENT_DESKTOP XDG_SESSION_DESKTOP

xsetroot -cursor_name left_ptr

xwallpaper --zoom "$HOME/Pictures/IMG_0124.JPG"
# xwallpaper --zoom "$HOME/Pictures/IMG_0087.JPG"

export XMODIFIERS=@im=fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx

fcitx5 -d &
picom --config "$HOME/.config/picom/picom.conf" &
slstatus &

toggle-touchpad

synclient TapButton1=1 TapButton2=3 TapButton3=2
synclient VertTwoFingerScroll=1 HorizTwoFingerScroll=1

(
    sleep 2
    wpctl set-volume @DEFAULT_AUDIO_SINK@ 0%
    wpctl set-mute @DEFAULT_AUDIO_SINK@ 0
) &

export GTK_THEME=Adwaita

exec "/usr/local/bin/dwm"
