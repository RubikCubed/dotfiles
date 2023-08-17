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
main = do
  h <- spawnPipe "xmobar -x 0 ~/.config/xmobar/xmobarrc"
  xmonad . ewmh . docks $ myConfig h

fgColor, bgColor, accentColor :: String
fgColor     = "#ebdbb2"
bgColor     = "#282828"
accentColor = "#928374"

myWorkspaces :: [String]
myWorkspaces = ["dev", "www", "chat", "game", "music", "misc"]

myManageHook = composeAll
  [ title =? "Mozilla Firefox"     --> doShift ( myWorkspaces !! 1 )
  ]

myConfig h = def
  { modMask            = mod4Mask
  , terminal           = "alacritty"
  , layoutHook         = myLayout
  , manageHook         = myManageHook
  , workspaces         = myWorkspaces
  , borderWidth        = 4
  , normalBorderColor  = accentColor
  , focusedBorderColor = fgColor
  , focusFollowsMouse  = False
  , logHook            = dynamicLogWithPP $ def
    { ppVisible = xmobarColor fgColor ""
    , ppOutput  = hPutStrLn h
    , ppCurrent = xmobarColor bgColor fgColor . wrap
                            ("<box color=" <> fgColor <> "> ") " </box>"
    }
  } `additionalKeysP` -- mimics windows bindings
    [ "<Print>"    ## spawn "scrot -q100 -e 'xclip -selection clipboard -target image/png -i $f; rm -f $f'"
    , "M1-<Print>" ## spawn "scrot -q100 -u -e 'xclip -selection clipboard -target image/png -i $f; rm -f $f'"
    , "M-S-s"      ## spawn "scrot -q100 -fs -e 'xclip -selection clipboard -target image/png -i $f; rm -f $f'"
    ]

-- convenience functions
(##) = (,)

