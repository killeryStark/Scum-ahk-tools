Gui, Tab, Macros
Gui, Font, s14, Lucida Sans Unicode
Gui, Add, Tab, x-1 y59 w490 h650 +Center, Hot keys|Scum hot keys|Admin tools|Macros|Music|Settings
Gui, Tab, Hot keys
Gui, Add, Text, x372 y339 w-210 h-250 , hotkeys
Gui, Add, Text, x22 y189 w450 h30 +BackgroundTrans, ctrl + z - Menu
Gui, Add, Text, x22 y299 w450 h30 +BackgroundTrans, F11 - On/Off Crosshair
Gui, Add, Text, x22 y329 w450 h30 +BackgroundTrans, F10 - Crosshair settings
Gui, Add, Text, x22 y359 w450 h30 +BackgroundTrans, F8 - Add zoom
Gui, Add, Text, x22 y389 w450 h30 +BackgroundTrans, F7 - Reduce zoom
Gui, Add, Text, x22 y419 w450 h30 +Left +BackgroundTrans, F6 - Magnifier control
Gui, Tab, Admin tools
Gui, Add, Picture, x149 y-1 w190 h60 +BackgroundTrans, C:\Users\ilyaf\Documents\GitHub\Scum-ahk-tools\img\logo_v.png
Gui, Add, Text, x198 y342 w100 h30 +Center, Soon
Gui, Tab, Hot keys
Gui, Add, Picture, x149 y-1 w190 h60 +BackgroundTrans, C:\Users\ilyaf\Documents\GitHub\Scum-ahk-tools\img\logo_v.png
Gui, Add, Text, x22 y139 w450 h30 +BackgroundTrans, Hot keys
Gui, Add, Text, x22 y219 w450 h30 +BackgroundTrans, shift + m - Maps
Gui, Add, Text, x22 y249 w450 h30 +BackgroundTrans, shift + o - Server online
Gui, Add, Text, x22 y469 w450 h30 +BackgroundTrans, ScrollLock - On/Off Virtual Numpad
Gui, Tab, Settings
Gui, Add, Picture, x149 y-1 w190 h60 +BackgroundTrans, C:\Users\ilyaf\Documents\GitHub\Scum-ahk-tools\img\logo_v.png
Gui, Add, Text, x12 y129 w460 h30 +BackgroundTrans, Server id
Gui, Add, Edit, x12 y159 w300 h40 vservid +BackgroundTrans -Number, %servid%
Gui, Add, Button, x322 y159 w150 h40 gServer_save +BackgroundTrans, Save
Gui, Add, Button, x12 y209 w470 h50 gfund_server, Find server
Gui, Tab, Scum hot keys
Gui, Add, Picture, x149 y-1 w190 h60 +BackgroundTrans, C:\Users\ilyaf\Documents\GitHub\Scum-ahk-tools\img\logo_v.png
Gui, Add, Text, x22 y139 w450 h30 +BackgroundTrans, Scum Hot keys
Gui, Add, Text, x22 y189 w450 h30 , F1 - Toggle event scoreboard
Gui, Add, Text, x22 y219 w450 h30 , Shift + W - Toggle auto run
Gui, Add, Text, x22 y299 w450 h30 , Shift + E - Toggle weapon flashlight
Gui, Add, Text, x22 y329 w450 h30 , Shift + Right mouse button - Cancel throw
Gui, Add, Text, x22 y359 w450 h30 , NUM - -Toggle HUD
Gui, Add, Text, x22 y409 w450 h30 , LShift + J - Radio volume up
Gui, Add, Text, x22 y439 w450 h30 , LControl + J - Radio volume down
Gui, Add, Text, x22 y469 w450 h30 , LAlt + J - Change radio channel
Gui, Add, Text, x22 y499 w450 h30 , LShift + C - Enter inventory when in car
Gui, Tab, Hot keys
Gui, Add, Text, x22 y499 w450 h30 , End - Exit the scum tools
Gui, Tab, Macros
Gui, Add, Text, x12 y209 w200 h30 , Activate - Shift + f
Gui, Tab, Scum hot keys
Gui, Add, Text, x22 y249 w450 h30 , LAlt + C - Craft again
Gui, Tab, Macros
Gui, Add, Edit, x82 y169 w100 h30 , Edit
Gui, Add, Text, x12 y169 w60 h30 , Loops
Gui, Tab, Macros
Gui, Add, Text, x-664 y-113 w666 h352 , Text
Gui, Tab, Macros
Gui, Add, Text, x12 y139 w460 h30 , Lockpicking
Gui, Tab, Macros
Gui, Add, Button, x12 y259 w180 h50 , Record macros
Gui, Add, Button, x12 y319 w180 h50 , Stop
Gui, Add, Button, x12 y379 w180 h50 , Run macros
Gui, Add, Button, x12 y439 w180 h50 , Edit macros
Gui, Add, Button, x212 y439 w180 h50 , Documentation
Gui, Add, Text, x22 y509 w450 h30 , Preset
Gui, Add, Button, x12 y549 w180 h50 , Farm money
; Generated using SmartGUI Creator 4.0
Gui, Show, x828 y177 h718 w500, New GUI Window
Return

GuiClose:
ExitApp