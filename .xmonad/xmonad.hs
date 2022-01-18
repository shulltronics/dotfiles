import XMonad
import XMonad.Util.Run (spawnPipe)
import XMonad.Util.EZConfig (additionalKeysP)
import XMonad.Util.Scratchpad
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.Place
import XMonad.Layout.Spacing

myLayoutHook = spacingWithEdge sp $ tiled ||| Mirror tiled ||| Full
    where
        sp       = 6
        tiled    = Tall nmaster delta ratio
        nmaster  = 1
        ratio    = 1/2
        delta    = 3/100

myManageHook = scratchpadManageHookDefault

spConf :: String
spConf = "xterm "

myConfig = def
    { workspaces = ["1","2","3","4","5","6","7","8","9"]
    , layoutHook = myLayoutHook
    , manageHook = myManageHook
    , terminal = "xterm"
    , modMask = mod4Mask
    , focusedBorderColor = "#FF00FF"
    }
    `additionalKeysP`
    [ ("M-<Return>", spawn "xterm")
    , ("M-S-<Return>", scratchpadSpawnActionCustom "xterm -fs 24 -name scratchpad")
    , ("M-c", spawn "firefox")
    , ("M-p", spawn "rofi -show run")
    , ("<XF86AudioLowerVolume>", spawn "xrandr --output DP1 --off --output eDP1 --mode 3200x1800")
    , ("<XF86AudioRaiseVolume>", spawn "xrandr --output eDP1 --off --output DP1 --mode 1920x1080 --scale 2x2")
    ]

main :: IO()
main = xmonad . ewmh =<< xmobar myConfig

