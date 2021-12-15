xcompmgr -c &
feh --bg-max ~/Media/Photos/Airstream-in-Big-Bend.jpg

if [[ -n $HI ]]; then
    xrdb -DSOLARIZED_LIGHT -merge ~/.Xresources
else
    xrdb -DSOLARIZED_DARK -merge ~/.Xresources
fi

xmodmap ~/.xmodmap
#sudo /home/carsten/scripts/system/ui/mag.py &
export _JAVA_AWT_WM_NONREPARENTING=1
touchegg &

exec xmonad
