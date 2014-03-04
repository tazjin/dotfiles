function xrdc
         xrandr --output $argv --off
         xmonad --restart
         xfce4-panel --restart
end
