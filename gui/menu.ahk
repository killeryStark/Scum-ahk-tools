Gui, Font, s14, Lucida Sans Unicode
Gui, Add, Tab, x-1 y59 w490 h650 +Center, Hot keys|Scum hot keys|Admin tools|Settings
Gui, Tab, Hot keys
Gui, Add, Text, x372 y359 w-210 h-250 , hotkeys
Gui, Add, Text, x22 y159 w450 h30 , ctrl + z - Menu
Gui, Add, Text, x22 y299 w450 h30 , F11 - On/Off Crosshair
Gui, Add, Text, x22 y269 w450 h30 , F10 - Crosshair settings
Gui, Add, Text, x22 y329 w450 h30 , F8 - Add zoom
Gui, Add, Text, x22 y359 w450 h30 , F7 - Reduce zoom
Gui, Add, Text, x22 y389 w450 h30 +Left, F6 - Magnifier control
Gui, Tab, Admin tools
Gui, Add, Picture, x146 y-1 w192 h62 +BackgroundTrans, C:\Users\ilyaf\Documents\GitHub\Scum-ahk-tools\img\logo_v.png
Gui, Add, Text, x155 y254 w100 h30 +Center, Soon
Gui, Tab, Hot keys
Gui, Add, Picture, x147 y-1 w190 h60 +BackgroundTrans, C:\Users\ilyaf\Documents\GitHub\Scum-ahk-tools\img\logo_v.png
Gui, Add, Text, x22 y109 w450 h30 +BackgroundTrans, Hot keys
Gui, Add, Text, x22 y189 w450 h30 , shift + m - Maps
Gui, Add, Text, x22 y219 w450 h30 , shift + o - Server online
Gui, Add, Text, x22 y439 w450 h30 , ScrollLock - On/Off Virtual Numpad
Gui, Tab, Settings
Gui, Add, Picture, x146 y-1 w192 h62 +BackgroundTrans, C:\Users\ilyaf\Documents\GitHub\Scum-ahk-tools\img\logo_v.png
Gui, Add, Text, x12 y99 w460 h30 , Server id
Gui, Add, Edit, x12 y139 w300 h40 +BackgroundTrans +BackgroundTrans, Edit
Gui, Add, Button, x322 y139 w150 h40 , Save
Gui, Tab, Settings
Gui, Add, Button, x12 y189 w460 h40 , Find server
Gui, Tab, Scum hot keys
Gui, Add, Picture, x146 y-1 w192 h62 +BackgroundTrans, C:\Users\ilyaf\Documents\GitHub\Scum-ahk-tools\img\logo_v.png
Gui, Add, Text, x22 y109 w450 h30 +BackgroundTrans, Scum Hot keys
Gui, Add, Text, x22 y159 w450 h30 , F1 - Toggle event scoreboard
Gui, Tab, Scum hot keys
Gui, Add, Text, x22 y189 w450 h30 , Shift + W - Toggle auto run
Gui, Add, Text, x22 y219 w450 h30 , Shift + E - Toggle weapon flashlight
Gui, Add, Text, x22 y249 w450 h30 , Shift + Right mouse button - Cancel throw
Gui, Add, Text, x22 y279 w450 h30 , NUM - -Toggle HUD
Gui, Add, Text, x22 y329 w450 h30 , LShift + J - Radio volume up
Gui, Add, Text, x22 y359 w450 h30 , LControl + J - Radio volume down
Gui, Add, Text, x22 y389 w450 h30 , LAlt + J - Change radio channel
Gui, Add, Text, x22 y429 w450 h30 , LShift + C - Enter inventory when in car
; Generated using SmartGUI Creator 4.0
Gui, Show, x1396 y138 h716 w488, New GUI Window
Return

GuiClose:
ExitApp