import XMonad

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP

import XMonad.Util.EZConfig
import XMonad.Util.Loggers
import XMonad.Util.Ungrab

import XMonad.Layout.Magnifier
import XMonad.Layout.ThreeColumns
import XMonad.Layout.Spacing
import XMonad.Layout.Tabbed

import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.FadeWindows


main :: IO ()
main = xmonad
     . ewmhFullscreen
     . ewmh
     . withEasySB (statusBarProp "xmobar" (pure myXmobarPP)) defToggleStrutsKey
     $ myConfig

myConfig = def
    { modMask    = mod4Mask      -- Rebind Mod to the Super key
    , layoutHook = myLayout      -- Use custom layouts
    , manageHook = myManageHook  -- Match on certain windows
    , logHook = fadeWindowsLogHook myFadeHook
    , handleEventHook = fadeWindowsEventHook
    , terminal = "alacritty"
    , normalBorderColor = "#073642"
    , focusedBorderColor = "#268bd2"
    }
  `additionalKeysP`
    [ ("M-S-z", spawn "xscreensaver-command -lock"                                         )
    , ("M-C-s", unGrab *> spawn "scrot -s"                                                 )
    , ("M-f"  , spawn "brave"                                                              )
    , ("<Print>", unGrab *> spawn "maim -m 9 | xclip -selection clipboard -t image/png -i" )
    , ("C-<Print>", spawn "maim -s -m 9 | xclip -selection clipboard -t image/png -i"      )
    , ("<XF86MonBrightnessUp>", spawn "xbacklight -inc 5"                                  )
    , ("<XF86MonBrightnessDown>", spawn "xbacklight -dec 5"                                )
	, ("M-p", spawn "rofi -show combi"                                                     )
    ]

myFadeHook = composeAll [
    opaque
  , isUnfocused --> opacity 0.9
  ]

myManageHook :: ManageHook
myManageHook = composeAll
    [ className =? "Gimp" --> doFloat
    , isDialog            --> doFloat
    ]

myTabConfig = def { inactiveBorderColor = "#073642"
                  , inactiveBorderWidth = 0
                  , activeBorderWidth = 2
                  , inactiveTextColor = "#657b83"
                  , activeTextColor = "#93a1a1"
                  , activeBorderColor = "#073642"
                  , fontName = "xft:Mononoki Nerd Font:size=12:weight=bold:antialias=true:hinting=true"
                  , inactiveColor = "#073642"
                  , activeColor = "#002b36"
                  , decoHeight = 24 }

myLayout = spacingRaw False (Border 6 6 6 6) True (Border 6 6 6 6) True
         $ tiled ||| Mirror tiled ||| Full ||| threeCol ||| tabbed shrinkText myTabConfig
  where
    threeCol = magnifiercz' 1.3 $ ThreeColMid nmaster delta ratio
    tiled    = Tall nmaster delta ratio
    nmaster  = 1      -- Default number of windows in the master pane
    ratio    = 1/2    -- Default proportion of screen occupied by master pane
    delta    = 3/100  -- Percent of screen to increment by when resizing panes

myXmobarPP :: PP
myXmobarPP = def
    { ppSep             = magenta " | "
    , ppTitleSanitize   = xmobarStrip
    , ppCurrent         = wrap " " "" . xmobarBorder "Top" "#8be9fd" 2
    , ppHidden          = white . wrap " " ""
    , ppHiddenNoWindows = lowWhite . wrap " " ""
    , ppUrgent          = red . wrap (yellow "!") (yellow "!")
    , ppOrder           = \[ws, l, _, wins] -> [ws, l, wins]
    , ppExtras          = [logTitles formatFocused formatUnfocused]
    }
  where
    formatFocused   = wrap (white    "[") (white    "]") . magenta . ppWindow
    formatUnfocused = wrap (lowWhite "[") (lowWhite "]") . blue    . ppWindow

    -- | Windows should have *some* title, which should not not exceed a
    -- sane length.
    ppWindow :: String -> String
    ppWindow = xmobarRaw . (\w -> if null w then "untitled" else w) . shorten 30

    blue, lowWhite, magenta, red, white, yellow :: String -> String
    magenta  = xmobarColor "#ff79c6" ""
    blue     = xmobarColor "#bd93f9" ""
    white    = xmobarColor "#f8f8f2" ""
    yellow   = xmobarColor "#f1fa8c" ""
    red      = xmobarColor "#ff5555" ""
    lowWhite = xmobarColor "#bbbbbb" ""

