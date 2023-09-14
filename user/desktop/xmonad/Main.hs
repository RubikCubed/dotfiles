{-# OPTIONS_GHC -Wall #-}

import XMonad
import XMonad.Hooks.EwmhDesktops (ewmh)
import XMonad.Hooks.ManageDocks (avoidStruts, docks)
import XMonad.Hooks.DynamicLog
import XMonad.Layout.ThreeColumns
import XMonad.Layout.Spacing (smartSpacingWithEdge)
import XMonad.Util.Run (spawnPipe, hPutStrLn)
import XMonad.Util.EZConfig (additionalKeysP)

myLayout = avoidStruts . smartSpacingWithEdge 8 $ tiled ||| Mirror tiled ||| Full
  where
    tiled = Tall 1 (3 / 100) (2 / 3)

main :: IO ()
main = xmonad . ewmh . docks $ myConfig

fgColor, bgColor, accentColor :: String
fgColor     = "#ebdbb2"
bgColor     = "#282828"
accentColor = "#928374"

dmenuRun = spawn "dmenu_run -l 10 -fn 'Iosevka-12' -nb '#282828' -nf '#ebdbb2' -sb '#fbf1c7' -sf '#3c3836' -p '-> ' &"

myWorkspaces :: [String]
myWorkspaces = ["dev", "www", "chat", "game", "music", "misc"]

myManageHook = composeAll
  [ title =? "Mozilla Firefox"     --> doShift ( myWorkspaces !! 1 )
  ]

myConfig = def
  { modMask            = mod4Mask
  , terminal           = "alacritty"
  , layoutHook         = myLayout
  , manageHook         = myManageHook
  , workspaces         = myWorkspaces
  , borderWidth        = 4
  , normalBorderColor  = accentColor
  , focusedBorderColor = fgColor
  , focusFollowsMouse  = False
  , clickJustFocuses   = False
  } `additionalKeysP` -- mimics windows bindings
    [ "<Print>"    ## spawn "scrot -q100 -e 'xclip -selection clipboard -target image/png -i $f; rm -f $f'"
    , "M1-<Print>" ## spawn "scrot -q100 -u -e 'xclip -selection clipboard -target image/png -i $f; rm -f $f'"
    , "M-S-s"      ## spawn "scrot -q100 -fs -e 'xclip -selection clipboard -target image/png -i $f; rm -f $f'"
    , "M-p"        ## dmenuRun
    ]

-- convenience functions
(##) = (,)

