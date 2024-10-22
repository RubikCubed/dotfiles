{-# OPTIONS_GHC -Wall #-}

import XMonad
import XMonad.Actions.Volume
import XMonad.Hooks.EwmhDesktops (ewmh)
import XMonad.Hooks.ManageDocks (avoidStruts, docks)
import XMonad.Hooks.DynamicLog
import XMonad.Layout.ThreeColumns
import XMonad.Layout.Spacing (smartSpacingWithEdge)
import XMonad.Util.Run (spawnPipe, hPutStrLn)
import XMonad.Util.EZConfig (additionalKeysP)
import Data.List (isInfixOf)

myLayout = avoidStruts . smartSpacingWithEdge 8 $ tiled ||| Mirror tiled ||| Full
  where
    tiled = Tall 1 (3 / 100) (2 / 3)

main :: IO ()
main = xmonad . ewmh . docks $ myConfig

fgColor, bgColor, accentColor :: String
fgColor     = "#ebdbb2"
bgColor     = "#282828"
accentColor = "#665c54"

dmenuRun = spawn "dmenu_run -l 10 -fn 'Iosevka-12' -nb '#282828' -nf '#ebdbb2' -sb '#fbf1c7' -sf '#3c3836' -p '-> ' &"

myWorkspaces :: [String]
myWorkspaces = ["dev", "www", "chat", "game", "media", "misc"]

myManageHook = composeAll
  [ title =? "Mozilla Firefox"     --> doShift ( myWorkspaces !! 1 )
  , title ~? "Discord"             --> doShift ( myWorkspaces !! 2 )
  ]

q ~? x = fmap (x `isInfixOf`) q

myConfig = def
  { modMask            = mod4Mask
  , terminal           = "ghostty"
  , layoutHook         = myLayout
  , manageHook         = myManageHook
  , workspaces         = myWorkspaces
  , borderWidth        = 2
  , normalBorderColor  = accentColor
  , focusedBorderColor = fgColor
  , focusFollowsMouse  = False
  , clickJustFocuses   = False
  } `additionalKeysP` -- mimics windows bindings
    [ "<Print>"    ## spawn "scrot -q100 -e 'xclip -selection clipboard -target image/png -i $f; rm -f $f'"
    , "M1-<Print>" ## spawn "scrot -q100 -u -e 'xclip -selection clipboard -target image/png -i $f; rm -f $f'"
    , "M-S-s"      ## spawn "scrot -q100 -fs -e 'xclip -selection clipboard -target image/png -i $f; rm -f $f'"
    , "M--"        ## (lowerVolume 5 *> getVolume >>= spawn . ("notify-send -t 1000 -a 'sysnotif' 'Volume' -h int:value:" ++) . show)
    , "M-="        ## (raiseVolume 5 *> getVolume >>= spawn . ("notify-send -t 1000 -a 'sysnotif' 'Volume' -h int:value:" ++) . show)
    , "M-p"        ## dmenuRun
    ]

-- convenience functions
(##) = (,)

