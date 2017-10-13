#!/bin/bash
set -e

# Fix Java apps in i3
export _JAVA_AWT_WM_NONREPARENTING=1

function setup() {
    # Export X envvars to systemd
    systemctl --user import-environment DISPLAY
    systemctl --user import-environment XAUTHORITY

    # Use Caps_Lock for Super (i.e. i3 main modifier)
    setxkbmap -option 'caps:super'
    #setxkbmap -device 3 -option 'ctrl:swap_lalt_lctl'

    # Configure keyboard layouts and enable toggling with right ctrl+shift
    setxkbmap -layout us,no
    setxkbmap -option 'grp:shifts_toggle'

    # Set urxvt theme to Gruber Darker
    xrdb -merge ~/gruber-darker.xresources

    # Use multitouch clicks instead of tap areas.
    # (Note: I don't know if the input device number is stable)
    xinput set-prop 15 292 0 1

    # Enable tap-to-click
    xinput set-prop 11 274 1

    # Enable compositor
    compton -bCG

    # Start wallpaper timer
    systemctl --user start feh-wp.timer

    # ... and Redshift
    systemctl --user start redshift
}

setup | logger

exec i3
