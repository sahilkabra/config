--
-- xmonad example config file.
--
-- A template showing all available configuration hooks,
-- and how to override the defaults in your own xmonad.hs conf file.
--
-- Normally, you'd only override those defaults you care about.
--
import Data.Monoid
import System.Exit
import System.IO
import Graphics.X11.ExtraTypes.XF86

import qualified Data.Map        as M
import qualified XMonad.StackSet as W

import XMonad
import XMonad.Actions.Submap
import XMonad.Actions.WindowBringer
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Layout.Accordion
import XMonad.Layout.Spiral
import XMonad.Layout.Tabbed
import XMonad.Layout.IndependentScreens
import XMonad.Util.Run (spawnPipe)

------------------------------------------------------------------------
-- Now run xmonad with all the defaults we set up.

-- Run xmonad with the settings you specify. No need to modify this.
--
-- main = xmonad defaults
main = xmonad =<< statusBar myBar myPP toggleStrutsKey defaults

-- A structure containing your configuration settings, overriding
-- fields in the default config. Any you don't override, will
-- use the defaults defined in xmonad/XMonad/Config.hs
--
-- No need to modify this.
--
defaults = def {
      -- simple stuff
        terminal           = myTerminal,
        focusFollowsMouse  = myFocusFollowsMouse,
        clickJustFocuses   = myClickJustFocuses,
        borderWidth        = myBorderWidth,
        modMask            = myModMask,
        workspaces         = myWorkspaces,
        normalBorderColor  = myNormalBorderColor,
        focusedBorderColor = myFocusedBorderColor,

      -- key bindings
        keys               = myKeys,
        mouseBindings      = myMouseBindings,

      -- hooks, layouts
        layoutHook         = myLayout,
        manageHook         = myManageHook,
        handleEventHook    = myEventHook,
        logHook            = myLogHook,
        startupHook        = myStartupHook
    }

------------------------------------------------------------------------
-- Key aliases - useful to refer to keys by name
-- rather than cryptic values like mod1mask
lAltKey = mod1Mask
numLockKey = mod2Mask
winKey = mod4Mask
rAltKey = mod5Mask

-- modMask lets you specify which modkey you want to use. The default
-- is mod1Mask ("left alt").  You may also consider using mod3Mask
-- ("right alt"), which does not conflict with emacs keybindings. The
-- "windows key" is usually mod4Mask.
--
myModMask       = lAltKey

-- The preferred terminal program, which is used in a binding below and by
-- certain contrib modules.
--
myTerminal      = "x-terminal-emulator"

-- Whether focus follows the mouse pointer.
myFocusFollowsMouse :: Bool
myFocusFollowsMouse = False

-- Whether clicking on a window to focus also passes the click to the window
myClickJustFocuses :: Bool
myClickJustFocuses = False

-- Width of the window border in pixels.
--
myBorderWidth   = 1

-- The default number of workspaces (virtual screens) and their names.
-- By default we use numeric strings, but any string may be used as a
-- workspace name. The number of workspaces is determined by the length
-- of this list.
--
myWorkspaces =
  withScreens 3 (["1:home","2:personal","3:code","4:app","5:work","6:vm","7:messengers"] ++ map show [8 .. 12])

-- Border colors for unfocused and focused windows, respectively.
--
myNormalBorderColor  = "#dddddd"
myFocusedBorderColor = "#cd8b00"

------------------------------------------------------------------------
-- Key bindings. Add, modify or remove key bindings here.
--
myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $

    [
     -- Rotate through the available layout algorithms
      ((modm,               xK_space ), sendMessage NextLayout)

    --  Reset the layouts on the current workspace to default
    , ((modm .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf)

    -- Resize viewed windows to the correct size
    , ((modm,               xK_n     ), refresh)

    -- Push window back into tiling
    , ((modm,               xK_t     ), withFocused $ windows . W.sink)

    -- Quit xmonad
    , ((modm .|. shiftMask, xK_q     ), io (exitWith ExitSuccess))

    -- Restart xmonad
    , ((modm              , xK_q     ), spawn "xmonad --recompile; xmonad --restart")

    -- Run xmessage with a summary of the default keybindings (useful for beginners)
    , ((modm .|. shiftMask, xK_slash ), spawn ("echo \"" ++ help ++ "\" | xmessage -file -"))
    ]
    ++

    myAdditionalKeys
    ++

    --
    -- mod-[F1..F12], Switch to workspace N
    -- mod-shift-[F1..F12], Move client to workspace N
    --
    [((m .|. modm, k), windows $ onCurrentScreen f i)
        | (i, k) <- zip (workspaces' conf) [xK_F1 .. xK_F12]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
    ++

    -- mod-[Numpad keys], switch to workspace N
    -- mod-shift-[Numpad keys], move client to workspace N
    [((m .|. modm, k), windows $ onCurrentScreen f i)
        | (i, k) <- zip (workspaces' conf) numPadKeys
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]
    ]
    ++

    --
    -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
    -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
    --
    [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_w, xK_e, xK_r] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]

myAdditionalKeys =
  [
    commandSubmap
  , myBringWindow
  , gotoWindow
  , switchKbLayout
  , systemLock
  -- get out of here
  --, xf86controls
  , brightnessDown
  , brightnessUp
  , volumeUp
  , volumeDown
  , volumeMute
  ]

------------------------------------------------------------------------
-- Launch applications mode using Mod+x

appSubmap = ((0, xK_a), submap . M.fromList $
  [
    launchFirefox
  , launchPersonalChrome
  , launchPycharm
  , launchVsCode
  , launchWorkChrome
  , screenshot
  ])
launchFirefox = ((0, xK_f), spawn "firefox")
launchPersonalChrome = ((0, xK_c), spawn "google-chrome --profile-directory='Default'")
launchPycharm = ((0, xK_p), spawn "wmname LG3D && pycharm")
launchVsCode = ((0, xK_v), spawn "code-insiders")
launchWorkChrome = ((0, xK_w), spawn "google-chrome --profile-directory='Profile 1'")
screenshot = ((0, xK_Print), spawn "shutter")
------------------------------------------------------------------------
-- window, come here!
myBringWindow = ((myModMask .|. shiftMask, xK_b), bringMenu)

-- go to window prompt
gotoWindow = ((myModMask .|. shiftMask, xK_g), gotoMenu)

-- switch keyboard layout
switchKbLayout = ((myModMask .|. shiftMask, xK_Insert), spawn "$HOME/.bin/switch-layout")
------------------------------------------------------------------------
-- Launch command submap with mod+c

commandSubmap = ((myModMask, xK_c), submap . M.fromList $
  [
    appSubmap
  , cmdDecMaster
  , cmdExpandWindow
  , cmdIncMaster
  , cmdLaunchDmenu
  , cmdLaunchTerminal
  , cmdNextWindow
  , cmdPrevWindow
  , cmdFocusMaster
  , cmdShrinkWindow
  , cmdSwapMaster
  , killApp
  , systemSubmap
  , screenshot
  , swapNextWindow
  , swapPrevWindow
  ])
cmdLaunchDmenu = ((0, xK_p), spawn "dmenu_run")
cmdLaunchTerminal = ((0, xK_t), spawn myTerminal)

cmdNextWindow = ((0, xK_j), windows W.focusDown)
swapNextWindow = ((shiftMask, xK_j), windows W.swapDown)

cmdPrevWindow = ((0, xK_k), windows W.focusUp)
swapPrevWindow = ((shiftMask, xK_k), windows W.swapUp)

cmdFocusMaster = ((0, xK_m), windows W.focusMaster)
cmdSwapMaster = ((shiftMask, xK_m), windows W.swapMaster)

cmdShrinkWindow = ((0, xK_h), sendMessage Shrink)
cmdExpandWindow = ((0, xK_l), sendMessage Expand)

cmdIncMaster = ((0, xK_comma), sendMessage (IncMasterN 1))
cmdDecMaster = ((0, xK_period), sendMessage (IncMasterN (-1)))

killApp = ((0, xK_q), kill)
------------------------------------------------------------------------
-- Launch system submap with mod+s

-- system maps; lock, suspend etc.
systemLock = ((myModMask, xK_Menu), spawn lockCommand)
systemSubmap = ((0, xK_s), submap . M.fromList $
  [
    locker
  , suspend
  , poweroff
  , sysrestart
  ])
lockCommand = "xset dpms force off; slock"
locker = ((0, xK_l), spawn lockCommand)
suspend = ((0, xK_s), spawn "systemctl suspend")
poweroff = ((0, xK_h), spawn "poweroff")
sysrestart = ((0, xK_r), spawn "reboot")

-- not working to figure out why
xf86controls XConfig {XMonad.modMask = modMask} = M.fromList $
  [
    brightnessDown
  , brightnessUp
  , volumeUp
  , volumeDown
  , volumeMute
  ]
brightnessDown = ((0, xF86XK_MonBrightnessDown), spawn "xbacklight -10")
brightnessUp = ((0, xF86XK_MonBrightnessUp), spawn "xbacklight +10")
volumeMute = ((0, xF86XK_AudioMute), spawn "amixer set Master mute")
volumeDown = ((0, xF86XK_AudioLowerVolume), spawn "amixer set Master 5- unmute")
volumeUp = ((0, xF86XK_AudioRaiseVolume), spawn "amixer set Master 5+ unmute")

-- Non-numeric num pad keys, sorted by number
numPadKeys = [ xK_KP_End,  xK_KP_Down,  xK_KP_Page_Down -- 1, 2, 3
             , xK_KP_Left, xK_KP_Begin, xK_KP_Right     -- 4, 5, 6
             , xK_KP_Home, xK_KP_Up,    xK_KP_Page_Up   -- 7, 8, 9
             , xK_KP_Insert]
------------------------------------------------------------------------
-- Mouse bindings: default actions bound to mouse events
--
myMouseBindings (XConfig {XMonad.modMask = modm}) = M.fromList $

    -- mod-button1, Set the window to floating mode and move by dragging
    [ ((modm, button1), (\w -> focus w >> mouseMoveWindow w
                                       >> windows W.shiftMaster))

    -- mod-button2, Raise the window to the top of the stack
    , ((modm, button2), (\w -> focus w >> windows W.shiftMaster))

    -- mod-button3, Set the window to floating mode and resize by dragging
    , ((modm, button3), (\w -> focus w >> mouseResizeWindow w
                                       >> windows W.shiftMaster))

    -- you may also bind events to the mouse scroll wheel (button4 and button5)
    ]

------------------------------------------------------------------------
-- Layouts:

-- You can specify and transform your layouts by modifying these values.
-- If you change layout bindings be sure to use 'mod-shift-space' after
-- restarting (with 'mod-q') to reset your layout state to the new
-- defaults, as xmonad preserves your old layout settings by default.
--
-- The available layouts.  Note that each layout is separated by |||,
-- which denotes layout choice.
--
myLayout = avoidStruts $ tiled ||| Mirror tiled ||| Full ||| simpleTabbedBottom ||| Accordion ||| spiral (6/7)
  where
     -- default tiling algorithm partitions the screen into two panes
     tiled   = Tall nmaster delta ratio

     -- The default number of windows in the master pane
     nmaster = 1

     -- Default proportion of screen occupied by master pane
     ratio   = 2/3

     -- Percent of screen to increment by when resizing panes
     delta   = 3/100

------------------------------------------------------------------------
-- Window rules:

-- Execute arbitrary actions and WindowSet manipulations when managing
-- a new window. You can use this to, for example, always float a
-- particular program, or have a client always appear on a particular
-- workspace.
--
-- To find the property name associated with a program, use
-- > xprop | grep WM_CLASS
-- and click on the client you're interested in.
--
-- To match on the WM_NAME, you can use 'title' in the same way that
-- 'className' and 'resource' are used below.
--
myManageHook = manageDocks <+> composeAll
    [ className =? "MPlayer"        --> doFloat
    , className =? "Gimp"           --> doFloat
    , resource  =? "desktop_window" --> doIgnore
    , resource  =? "kdesktop"       --> doIgnore ]

------------------------------------------------------------------------
-- Event handling

-- * EwmhDesktops users should change this to ewmhDesktopsEventHook
--
-- Defines a custom handler function for X Events. The function should
-- return (All True) if the default handler is to be run afterwards. To
-- combine event hooks use mappend or mconcat from Data.Monoid.
--
myEventHook = mempty

------------------------------------------------------------------------
-- Status bars and logging

-- Perform an arbitrary action on each internal state change or X event.
-- See the 'XMonad.Hooks.DynamicLog' extension for examples.
--
myLogHook = return ()

------------------------------------------------------------------------
-- Startup hook

-- Perform an arbitrary action each time xmonad starts or is restarted
-- with mod-q.  Used by, e.g., XMonad.Layout.PerWorkspace to initialize
-- per-workspace layout choices.
--
-- By default, do nothing.
myStartupHook = return ()

myBar = "xmobar"

-- determines what is being written to the bar
myPP = xmobarPP { ppCurrent = xmobarColor "#429942" "" . wrap "<" ">" }

-- hide the bar using mod+b
toggleStrutsKey XConfig {XMonad.modMask = myModMask} = (myModMask, xK_b)


-- | Finally, a copy of the default bindings in simple textual tabular format.
help :: String
help = unlines ["The modifier key is 'lalt'.",
    "",
    "Keybindings:",
    "",
    "mod-Space                          Rotate through the available layout algorithms",
    "mod-Shift-Space                    Reset the layouts on the current workSpace to default",
    "mod-n                              Resize/refresh viewed windows to the correct size",
    "",
    "-- floating layer support",
    "mod-t                              Push window back into tiling; unfloat and re-tile it",
    "",
    "-- quit, or restart",
    "mod-Shift-q                        Quit xmonad",
    "mod-q                              Restart xmonad",
    "",
    "-- Workspaces & screens",
    "mod-[F1..F12]                      Switch to workSpace N",
    "mod-Shift-[F1..F9]                 Move client to workspace N",
    "mod-{w,e,r}                        Switch to physical/Xinerama screens 1, 2, or 3",
    "mod-Shift-{w,e,r}                  Move client to screen 1, 2, or 3",
    "",
    "-- Command Mode",
    "mod-c                              Enter Command Mode",
    "    a                              Enter Application Command Mode",
    "    s                              Enter System Command Mode",
    "    p                              Run Dmenu",
    "    t                              Launch Terminal",
    "    j                              Move focus to the next window",
    "    shift+j                        Swap focussed and next window",
    "    k                              Move focus to the previous window",
    "    shift+k                        Swap focussed and previous window",
    "    m                              Move focus to the master window",
    "    shift+m                        Swap focussed and master window",
    "    h                              Shrink master window",
    "    l                              Expand master window",
    "    comma(,)                       Increment the number of windows in the master area",
    "    period(.)                      Deincrement the number of windows in the master area",
    "",
    "-- System Command Mode",
    "    l                              Lock",
    "    r                              Restart",
    "    s                              Suspend",
    "    h                              Halt",
    "",
    "-- Application Command Mode",
    "    f                              Launch Firefox",
    "    c                              Launch Chrome",
    "    w                              Launch Work Chrome",
    "    p                              Launch Pycharm",
    "    print                          Launch Shutter for screenshot",
    "    v                              Launch VSCode",
    "",
    "-- Mouse bindings: default actions bound to mouse events",
    "mod-button1                        Set the window to floating mode and move by dragging",
    "mod-button2                        Raise the window to the top of the stack",
    "mod-button3                        Set the window to floating mode and resize by dragging"]
