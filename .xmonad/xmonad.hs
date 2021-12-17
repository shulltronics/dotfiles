import XMonad
import XMonad.Util.Run (spawnPipe)
import XMonad.Util.EZConfig (additionalKeysP)
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.Place
import XMonad.Layout.Spacing

myLayout = spacingWithEdge sp $ tiled ||| Mirror tiled ||| Full
    where
        sp       = 6
        tiled    = Tall nmaster delta ratio
        nmaster  = 1
        ratio    = 1/2
        delta    = 3/100

myConfig = def
    { workspaces = ["1","2","3","4","5","6","7","8","9"]
    , layoutHook = myLayout
    , manageHook = placeHook simpleSmart <+> manageHook def
    , terminal = "xterm"
    , modMask = mod4Mask
    , focusedBorderColor = "#FF00FF"
    }
    `additionalKeysP`
    [ ("M-c", spawn "firefox")
    , ("M-p", spawn "rofi -show run")
    , ("<XF86AudioLowerVolume>", spawn "xrandr --output DP1 --off --output eDP1 --mode 3200x1800")
    , ("<XF86AudioRaiseVolume>", spawn "xrandr --output eDP1 --off --output DP1 --mode 1920x1080 --scale 2x2")
    ]

main :: IO()
main = xmonad . ewmh =<< xmobar myConfig

