import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.SetWMName
import XMonad.Util.Run(spawnPipe)
import System.IO

main = do
    xmproc <- spawnPipe "xmobar"
    xmonad $ defaultConfig {
        modMask = mod4Mask,
        terminal = "urxvt",

        focusFollowsMouse = True,
        normalBorderColor = "#000000",
        focusedBorderColor = "#ff6600",
        borderWidth = 1,

        startupHook = setWMName "LG3D",
        manageHook = manageDocks <+> manageHook defaultConfig,
        handleEventHook = handleEventHook defaultConfig <+> docksEventHook,
        layoutHook = avoidStruts $ layoutHook defaultConfig,
        logHook = dynamicLogWithPP xmobarPP {
            ppOutput = hPutStrLn xmproc,
            ppTitle = xmobarColor "darkgreen"  "" . shorten 20,
            ppHiddenNoWindows = xmobarColor "grey" ""
        }
    }
