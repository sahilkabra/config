import System.IO
import qualified Data.Map as M
import Graphics.X11.ExtraTypes.XF86
import XMonad
import XMonad.Actions.Submap
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.EZConfig
import XMonad.Util.Run (spawnPipe)
import XMonad.Layout.Tabbed
import XMonad.Layout.Accordion
import XMonad.Layout.Spiral
import XMonad.Actions.WindowBringer

main = xmonad =<< statusBar myBar myPP toggleStrutsKey myConfig

myBar = "xmobar"

-- determines what is being written to the bar
myPP = xmobarPP { ppCurrent = xmobarColor "#429942" "" . wrap "<" ">" }

-- hide the bar using mod+b
toggleStrutsKey XConfig {XMonad.modMask = myModMask} = (myModMask, xK_b)

myConfig = def
  {
    borderWidth = myBorderWidth
  , focusedBorderColor = myFocusedBorderColor
  , focusFollowsMouse = myFocusFollowMouse
  , layoutHook = myLayoutHook
  , manageHook = manageDocks <+> manageHook def
  , normalBorderColor = myNormalBorderColor
  , modMask = myModMask
  , workspaces = myWorkspaces
  } `additionalKeys` myAdditionalKeys

lAltKey = mod1Mask
numLockKey = mod2Mask
winKey = mod4Mask
menuKey =0xff67

myBorderWidth = 3
myFocusFollowMouse = False
myFocusedBorderColor = "#cd8b00"
myModMask = winKey
myNormalBorderColor = "#cccccc"

myLayoutHook = avoidStruts $ layoutHook def
    ||| simpleTabbed
    ||| simpleTabbedBottom
    ||| Accordion
    ||| spiral (6/7)

myWorkspaces =
  ["1:home","2:personal","3:code","4:app","5:work","6:vm","7:messengers","8:extr1","9:extr2"]

myAdditionalKeys =
  [
    appSubmap
  , myBringWindow
  , brightnessUp
  , brightnessDown
  , gotoWindow
  , myKillWindow
  , switchKbLayout
  , systemSubmap
  ]

-- application submap
appSubmap = ((myModMask, xK_x), submap . M.fromList $
  [
    launchFirefox
  , launchPersonalChrome
  , launchPycharm
  , screenshot
  , launchWorkChrome
  , launchVsCode
  ])
launchFirefox = ((0, xK_f), spawn "firefox")
launchPersonalChrome = ((0, xK_c), spawn "google-chrome --profile-directory='Default'")
launchWorkChrome = ((0, xK_w), spawn "google-chrome --profile-directory='Profile 1'")
launchPycharm = ((0, xK_p), spawn "wmname LG3D && pycharm")
screenshot = ((0, xK_Print), spawn "shutter")
launchVsCode = ((0, xK_v), spawn "code-insiders")

-- window, come here!
myBringWindow = ((myModMask .|. shiftMask, xK_b), bringMenu)

-- brightness
brightnessDown = ((0, xF86XK_MonBrightnessDown), spawn "xbacklight -10")
brightnessUp = ((0, xF86XK_MonBrightnessUp), spawn "xbacklight +10")

-- go to window prompt
gotoWindow = ((myModMask .|. shiftMask, xK_g), gotoMenu)

-- alt+f4 to kill window
myKillWindow = ((lAltKey, xK_F4), kill)

-- switch keyboard layout
switchKbLayout = ((myModMask .|. shiftMask, xK_Insert), spawn "$HOME/.bin/switch-layout")

-- system maps; lock, suspend etc.
systemSubmap = ((myModMask, xK_s), submap . M.fromList $
  [
    locker
  , suspend
  , poweroff
  ])
locker = ((0, xK_l), spawn "i3lock")
suspend = ((0, xK_s), spawn "systemctl suspend")
poweroff = ((0, xK_h), spawn "poweroff")
