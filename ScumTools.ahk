; ########### init program ###########
;
; AutoHotkey Version: 0.5.0
; Language:       Russia
; Platform:       Windows 7/8/8.1/10/11 32/64bit
; Author:         KilleryStark 	krutikovily@gmail.com
{
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Persistent
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetBatchLines, -1
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
CoordMode, ToolTip, Screen 
Thread, NoTimers
SetTitleMatchMode, 2
DetectHiddenWindows, On

;-------------Remove .ahk and .exe from filename to get name for INI file
ScriptName := A_ScriptName
StringReplace, ScriptName, ScriptName, .ahk,, All
StringReplace, ScriptName, ScriptName, .exe,, All
}
Menu, Tray, NoStandard 
Menu, Tray, Add, Exit, Exit
Menu, Tray, Default, Exit

if FileExist(A_ScriptDir . "\img\logo.ico")
	Menu, Tray, Icon, %A_ScriptDir%\img\logo.ico
if not A_IsAdmin ; Checks if script is being run as an administrator, if not it wil prompt for it.
{
    Run *RunAs "%A_ScriptFullPath%"
    ExitApp
}

LogFile:=A_Temp . "\~Record.txt"
UsedKeys:="F1,F2,F3,F4,F5,F6"
Play_Title:=RegExReplace(LogFile,".*\\") " ahk_class AutoHotkey"

diam = 25 ; Maximum canvas size of X-Y values for crosshair

; Max = 255 ; Used to set max color value for slider
; a1=BE        ; Red value
; a2=00        ; Green value
; a3=FF        ; Blue value


crosshair1 = 11-11 14-11 14-14 11-14 11-11
crosshair2 = 11-16 11-22 9-20 8-19 7-18 6-17 5-16 5-15 4-14 4-10 5-9 5-8 6-7 7-6 8-5 9-4 10-4 11-3 14-3 15-4 16-4 17-5 18-6 19-7 20-8 20-9 21-10 21-14 20-15 20-16 19-17 18-18 17-19 16-20 14-22 14-16 15-17 16-17 17-16 17-15 18-14 18-10 17-9 17-8 16-7 15-7 14-6 11-6 10-7 9-7 8-8 8-9 7-10 7-14 8-15 8-16 9-17 10-17 11-16 11-16 11-12 12-13 12-10 13-11 12-12 12-13 11-12 12-13 11-14 13-14 13-12 14-13 13-14 11-14
crosshair3 = 12-0 15-0 16-1 17-1 18-2 19-2 20-3 21-4 22-5 22-6 23-7 23-8 24-9 24-15 23-16 23-17 22-18 22-19 21-20 20-21 19-22 18-22 17-23 16-23 15-24 9-24 8-23 7-23 6-22 5-22 4-21 3-20 2-19 2-18 1-17 1-16 0-15 0-9 1-8 1-7 2-6 2-5 3-4 4-3 5-2 6-2 7-1 8-1 9-0 12-0 12-2 9-2 8-3 7-3 6-4 4-3 3-4 4-6 3-7 3-8 2-9 2-15 3-16 3-17 4-18 2-19 4-22 6-20 7-21 8-21 9-22 15-22 16-21 17-21 18-20 20-21 21-19 20-18 21-17 21-16 22-15 22-9 21-8 21-7 20-6 21-4 20-3 18-4 17-3 16-3 15-2 12-2 12-0 12-13 13-12 12-11 12-0
crosshair4 = 12-0 15-0 16-1 17-1 18-2 19-2 20-3 21-4 22-5 22-6 23-7 23-8 24-9 24-15 23-16 23-17 22-18 22-19 21-20 20-21 19-22 18-22 17-23 16-23 15-24 9-24 8-23 7-23 6-22 5-22 4-21 3-20 2-19 2-18 1-17 1-16 0-15 0-9 1-8 1-7 2-6 2-5 3-4 4-3 5-2 6-2 7-1 8-1 9-0 12-0 13-1 13-9 12-9 12-2 9-2 8-3 7-3 6-4 5-4 4-5 4-6 3-7 3-8 2-9 2-12 9-12 9-13 2-13 2-15 3-16 3-17 4-18 4-19 5-20 6-20 7-21 8-21 9-22 12-22 12-15 13-15 13-22 15-22 16-21 17-21 18-20 19-20 20-19 20-18 21-17 21-16 22-15 22-13 15-13 15-12 22-12 22-9 21-8 21-7 20-6 20-5 19-4 18-4 17-3 16-3 15-2 12-2 12-0
crosshair5 = 12-0 15-0 16-1 17-1 18-2 19-2 20-3 21-4 22-5 22-6 23-7 23-8 24-9 24-15 23-16 23-17 22-18 22-19 21-20 20-21 19-22 18-22 17-23 16-23 15-24 9-24 8-23 7-23 6-22 5-22 4-21 3-20 2-19 2-18 1-17 1-16 0-15 0-9 1-8 1-7 2-6 2-5 3-4 4-3 5-2 6-2 7-1 8-1 9-0 12-0 12-2 9-2 8-3 7-3 6-4 5-4 4-5 4-6 3-7 3-8 2-9 2-15 3-16 3-17 4-18 4-19 5-20 6-20 7-21 8-21 8-20 8-16 4-16 4-17 7-20 8-20 8-21 9-22 15-22 16-21 16-20 16-16 18-16 20-16 20-17 16-20 16-21 17-21 18-20 19-20 20-19 20-18 21-17 21-16 22-15 22-9 21-8 21-7 20-6 20-5 19-4 18-4 17-3 16-3 15-3 9-3 12-6 15-3 15-2 12-2 12-0
crosshair6 = 12-0 25-0 25-25 0-25 0-0 9-0 7-2 2-2 2-7 0-9 0-15 2-17 2-23 7-23 9-25 16-25 18-23 23-23 23-17 25-15 25-9 23-7 23-2 17-2 15-0 12-0 12-3 12-11 11-11 11-12 3-12 3-13 11-13 11-14 12-14 12-22 13-22 13-14 14-14 14-13 22-13 22-12 14-12 14-11 13-11 13-3 12-3 12-0
crosshair7 = 10-10 7-2 12-2 12-13 13-12 12-11 12-2 18-2 14-10 23-5 23-18 14-14 18-23 7-23 10-14 2-18 2-5 10-10 6-2 5-2 3-3 2-5 2-5 2-18 2-19 3-21 5-23 6-23 18-23 19-23 21-22 23-19 23-18 23-5 23-5 22-3 20-2 19-2 6-2
crosshair8 = 10-0 10-4 9-5 8-5 7-5 6-7 5-8 5-10 0-9 0-15 5-14 5-16 6-17 7-18 8-19 9-19 10-20 9-25 15-25 14-19 15-19 16-19 17-18 18-17 19-16 19-15 20-14 25-15 25-9 20-10 19-9 19-8 18-7 17-5 16-5 14-5 15-0 10-0 12-9 10-4 9-5 8-5 7-5 6-7 5-8 5-10 9-12 5-14 5-16 6-17 7-18 8-19 9-19 10-20 12-15 14-19 15-19 16-19 17-18 18-17 19-16 19-15 20-14 16-12 20-10 19-9 19-8 18-7 17-5 16-5 14-5 12-9 12-11 13-12 12-13 12-12 12-11 12-9 10-0

;--------------------Load the saved values.
IfExist %ScriptName%.ini
{
	IniRead,activecrosshair, %ScriptName%.ini, Crochair tol,activecrosshair
	IniRead, activecrosshair, %ScriptName%.ini, Crochair tol,activecrosshair
    IniRead, Max, %ScriptName%.ini, Crochair tol,Max
	IniRead, a1, %ScriptName%.ini, Crochair tol,a1
	IniRead, a2, %ScriptName%.ini, Crochair tol,a2
	IniRead, a3, %ScriptName%.ini, Crochair tol,a3
	IniRead, ab, %ScriptName%.ini, Crochair tol,ab
	IniRead, aa, %ScriptName%.ini, Crochair tol,aa
	IniRead, previewactive1, %ScriptName%.ini, Crochair tol,previewactive1
	IniRead, previewactive2, %ScriptName%.ini, Crochair tol,previewactive2
	IniRead, previewactive3, %ScriptName%.ini, Crochair tol,previewactive3
	IniRead, previewactive4, %ScriptName%.ini, Crochair tol,previewactive4
	IniRead, previewactive5, %ScriptName%.ini, Crochair tol,previewactive5
	IniRead, previewactive6, %ScriptName%.ini, Crochair tol,previewactive6
	IniRead, previewactive7, %ScriptName%.ini, Crochair tol,previewactive7
	IniRead, previewactive8, %ScriptName%.ini, Crochair tol,previewactive8
	IniRead, servid, %ScriptName%.ini, Crochair tol,servid
}

;--------------------Set the new values.
IfnotExist %ScriptName%.ini
{
	activecrosshair = crosshair1
	Max = 255 ; Used to set max color value for slider
	a1=BE        ; Red value
	a2=00        ; Green value
	a3=FF        ; Blue value
	servid=4410378
	previewactive1 = 1 ; Default cursor is selected in F10 Menu
	previewactive2 = 0 ; Following selections are 'inactive'
	previewactive3 = 0
	previewactive4 = 0
	previewactive5 = 0
	previewactive6 = 0
	previewactive7 = 0
	previewactive8 = 0
	IniWrite, %previewactive1%, %ScriptName%.ini, Crochair tol,previewactive1
	IniWrite, %previewactive2%, %ScriptName%.ini, Crochair tol,previewactive2
	IniWrite, %previewactive3%, %ScriptName%.ini, Crochair tol,previewactive3
	IniWrite, %previewactive4%, %ScriptName%.ini, Crochair tol,previewactive4
	IniWrite, %previewactive5%, %ScriptName%.ini, Crochair tol,previewactive5
	IniWrite, %previewactive6%, %ScriptName%.ini, Crochair tol,previewactive6
	IniWrite, %previewactive7%, %ScriptName%.ini, Crochair tol,previewactive7
	IniWrite, %previewactive8%, %ScriptName%.ini, Crochair tol,previewactive8
	IniWrite, %activecrosshair%, %ScriptName%.ini, Crochair tol,activecrosshair
    IniWrite, %Max%, %ScriptName%.ini, Crochair tol,Max
	IniWrite, %a1%, %ScriptName%.ini, Crochair tol,a1
	IniWrite, %a2%, %ScriptName%.ini, Crochair tol,a2
	IniWrite, %a3%, %ScriptName%.ini, Crochair tol,a3
	IniWrite, %servid%, %ScriptName%.ini, Crochair tol,servid
}
;------------------------------------------


activecrosshair := %activecrosshair% ; Default crosshair

invisible = 0
menutoggle = 1 ; Initialize menu to OFF
; previewactive1 = 1 ; Default cursor is selected in F10 Menu
; previewactive2 = 0 ; Following selections are 'inactive'
; previewactive3 = 0
; previewactive4 = 0
; previewactive5 = 0
; previewactive6 = 0
; previewactive7 = 0
; previewactive8 = 0
; previewactive9 = 0
;previewactive10 = 0
start: ; Gosubs here after icon selection
Gui, crosshair:New, +LastFound +AlwaysOnTop -Caption ; Instantiate GUI window with name 'crosshair', set as Active window, set to be always-on-top, and remove the window borders.
Gui, crosshair:+Owner ; Makes the GUI owned by the script's main window, forcing non-display of a taskbar button
Gui margin,0,0 ; Sets the window margin to 0,0 to disable padding
Gui crosshair:Add,Progress,x-2 y-2 w35 h35 c%a1%%a2%%a3% -border vCrosshair,100 ; Creates a silder with the hex color value of a1+a2+a3(RGB), and removes the slider's default border
SysGet, mon, Monitor ; Get main working monitor's maximum dimensions
Gui crosshair:show, % "x" monRight//2-(diam//2) " y" monBottom//2-(diam//2) NA ; Set crosshair to center in the main monitor
WinSet, Region, %activecrosshair%, A ; Set active crosshair
WinGetPos, Xpos, Ypos, A ; Grab window's Xpos and Ypos to allow everything to adjust dynamically with window position.
menuXpos := Xpos+50 ; Offset F10 Menu from center of main GUI window
menuYpos := Ypos+50 ; Offset F10 Menu from center of main GUI window
Gui, +E0x80020 ; Extended style, makes the window ignore the mouse cursor
return

; +f::
; if lockpick =1
; {
; 	lockpick =0
; }
; Else
; {
; 	lockpick=1
; 	loop, 10
; 		{
; 			if lockpick = 1
; 			{
; 				Send {f down}
; 				sleep, 170
; 				Send {f up}
; 				sleep, 60
; 			}
			
; 		}
; }
; return


+f::
loop, 500
	{
		Send {f down}
		sleep, 170
		Send {f up}
		sleep, 60
	}

return


END::
  ExitApp
Return

+o::
if servertoggle1 = 0
{
    servertoggle1 = 1
	FileDelete, %A_ScriptDir%/img/serv.png
    Gui, server:Destroy
}
Else
{
	servertoggle1 = 0
	UrlDownloadToFile, https://cdn.battlemetrics.com/b/horizontal500x80px/%servid%.png, %A_ScriptDir%/img/serv.png
	Gui, server:New, +LastFound +AlwaysOnTop -Caption
	Gui, server:+Owner ; Makes the GUI owned by the script's main window, forcing non-display of a taskbar button
	Gui margin,0,0
	SysGet, mon, Monitor ; Get main working monitor's maximum dimensions
	Gui, server:Add, Picture,% w80 h500, %A_ScriptDir%/img/serv.png
	Gui server:show, % "x" monLeft " y" monTop NA 
	Gui, +E0x80020
}
return

+m::
if mapstoggle1 = 0
{
    mapstoggle1 = 1
    Gui, maps:Destroy
}
Else
{
	mapstoggle1 = 0
	Gui, maps:New, +LastFound +AlwaysOnTop -Caption
	Gui, maps:+Owner ; Makes the GUI owned by the script's main window, forcing non-display of a taskbar button
	Gui margin,0,0
	SysGet, mon, Monitor ; Get main working monitor's maximum dimensions
	Gui, maps:Add, Picture,% "w" monBottom " h" monBottom NA, %A_ScriptDir%\img\maps.png
	Gui maps:show, % "x" monRight//4.5 " y" monTop NA 
	Gui, +E0x80020
}
return

^z::
if menutoolstoggle1 = 0
{
    menutoolstoggle1 = 1
    Gui, menutools:Destroy
}
Else
{
    menutoolstoggle1 = 0 ; Just in case
	Gui, menutools:New, +LastFound +AlwaysOnTop -Caption +Theme
	Gui, menutools:Font, s14, Lucida Sans Unicode
	Gui margin,0,0 
	Gui, menutools:Add, Tab, x-1 y59 w490 h650 +Center, Hot keys|Scum hot keys|Admin tools|Macros|Music|Settings

	Gui, menutools:Tab, Hot keys
	Gui, menutools:Add, Text, x372 y339 w-210 h-250 , hotkeys
	Gui, menutools:Add, Picture, x149 y-1 w190 h60 +BackgroundTrans, %A_ScriptDir%\img\logo_v.png
	Gui, menutools:Add, Text, x22 y189 w450 h30 +BackgroundTrans, ctrl + z - Menu
	Gui, menutools:Add, Text, x22 y299 w450 h30 +BackgroundTrans, F11 - On/Off Crosshair
	Gui, menutools:Add, Text, x22 y329 w450 h30 +BackgroundTrans, F10 - Crosshair settings
	Gui, menutools:Add, Text, x22 y359 w450 h30 +BackgroundTrans, F8 - Add zoom
	Gui, menutools:Add, Text, x22 y389 w450 h30 +BackgroundTrans, F7 - Reduce zoom
	Gui, menutools:Add, Text, x22 y419 w450 h30 +Left +BackgroundTrans, F6 - Magnifier control
	Gui, menutools:Add, Text, x22 y139 w450 h30 +BackgroundTrans, Hot keys
	Gui, menutools:Add, Text, x22 y219 w450 h30 +BackgroundTrans, shift + m - Maps
	Gui, menutools:Add, Text, x22 y249 w450 h30 +BackgroundTrans, shift + o - Server online
	Gui, menutools:Add, Text, x22 y469 w450 h30 +BackgroundTrans, ScrollLock - On/Off Virtual Numpad
	Gui, menutools:Add, Text, x22 y499 w450 h30 , End - Exit the scum tools

	Gui, menutools:Tab, Scum hot keys
	Gui, menutools:Add, Picture, x149 y-1 w190 h60 +BackgroundTrans, %A_ScriptDir%\img\logo_v.png
	Gui, menutools:Add, Text, x22 y139 w450 h30 +BackgroundTrans, Scum Hot keys
	Gui, menutools:Add, Text, x22 y189 w450 h30 , F1 - Toggle event scoreboard
	Gui, menutools:Add, Text, x22 y219 w450 h30 , Shift + W - Toggle auto run
	Gui, menutools:Add, Text, x22 y299 w450 h30 , Shift + E - Toggle weapon flashlight
	Gui, menutools:Add, Text, x22 y329 w450 h30 , Shift + Right mouse button - Cancel throw
	Gui, menutools:Add, Text, x22 y359 w450 h30 , NUM - -Toggle HUD
	Gui, menutools:Add, Text, x22 y409 w450 h30 , LShift + J - Radio volume up
	Gui, menutools:Add, Text, x22 y439 w450 h30 , LControl + J - Radio volume down
	Gui, menutools:Add, Text, x22 y469 w450 h30 , LAlt + J - Change radio channel
	Gui, menutools:Add, Text, x22 y499 w450 h30 , LShift + C - Enter inventory when in car

	Gui, menutools:Tab, Admin tools
	Gui, menutools:Add, Picture, x149 y-1 w190 h60 +BackgroundTrans, %A_ScriptDir%\img\logo_v.png
	Gui, menutools:Add, Text, x155 y254 w100 h30 +Center, Soon

	Gui, menutools:Tab, Macros
	Gui, menutools:Add, Picture, x149 y-1 w190 h60 +BackgroundTrans, %A_ScriptDir%\img\logo_v.png
	Gui, menutools:Add, Text, x12 y139 w460 h30 , Lockpicking
  Gui, Add, Button, x12 y259 w180 h50 , Record macros
  Gui, Add, Button, x12 y319 w180 h50 , Stop
  Gui, Add, Button, x12 y379 w180 h50 , Run macros
  Gui, Add, Button, x12 y439 w180 h50 , Edit macros
  Gui, Add, Button, x212 y439 w180 h50 , Documentation
  Gui, Add, Text, x22 y509 w450 h30 , Preset
  Gui, Add, Button, x12 y549 w180 h50 , Farm money

	Gui, menutools:Tab, Settings
	Gui, menutools:Add, Picture, x149 y-1 w190 h60 +BackgroundTrans, %A_ScriptDir%\img\logo_v.png

	Gui, menutools:Add, Text, x12 y129 w460 h30 +BackgroundTrans, Server id
	Gui, menutools:Add, Edit, x12 y159 w300 h40 vservid +BackgroundTrans -Number, %servid%
	Gui, menutools:Add, Button, x322 y159 w150 h40 gServer_save +BackgroundTrans, Save
	Gui, menutools:Add, Button, x12 y209 w470 h50 gfund_server, Find server

	; Generated using SmartGUI Creator 4.0
	Gui, menutools:Show, % "x" monRight-543 " y" monTop NA h707 w493, Menu

	Return

	
}
return

F7:: sendinput #{NumpadAdd} ;zoom in
F8:: sendinput #{NumpadSub} ;zoom out
F6:: ;toggle Magnifier visibility
 if magmin=0
  {
  WinMinimize, ahk_class MagUIClass
  WinHide, ahk_class MagUIClass
  magmin=1
  }
 else
  {
  WinShow, ahk_class MagUIClass
  magmin=0
  }
return

F11::
if invisible = 0
{
    invisible = 1
    Gui, crosshair:Hide
    Gui, colorslider:Destroy
}
Else
{
    invisible = 0
    Gui, crosshair:Show
}
return

F10::
if menutoggle = 0
{
    menutoggle = 1
    Gui, colorslider:Destroy
}
Else
{
    menutoggle = 0 ; Just in case

	crosshairXpos1 := Xpos+100, crosshairXpos6 := Xpos+100
	crosshairXpos2 := Xpos+140, crosshairXpos7 := Xpos+140
	crosshairXpos3 := Xpos+180, crosshairXpos8 := Xpos+180
	crosshairXpos4 := Xpos+220, crosshairXpos9 := Xpos+220
	crosshairXpos5 := Xpos+260, crosshairXpos10 := Xpos+260
	crosshairYpos1 := Ypos+60, crosshairYpos2 := Ypos+60, crosshairYpos3 := Ypos+60, crosshairYpos4 := Ypos+60, crosshairYpos5 := Ypos+60
	crosshairYpos6 := Ypos+100, crosshairYpos7 := Ypos+100, crosshairYpos8 := Ypos+100, crosshairYpos9 := Ypos+100, crosshairYpos10 := Ypos+100
	
	Gui, colorslider:New, +AlwaysOnTop +E0x08000000 -Caption +border
    Gui -dpiscale
    Gui margin,5,5
    Gui, colorslider:Show,x%menuXpos% y%menuYpos% w245 h85, Color Slider
    Gui, colorslider:Add, Slider, w35 h75 vaa gsave AltSubmit -border Page10 Range1-300 TickInterval50 Vertical, 
	
	loop, 8
	{
		boxXpos%A_Index% := crosshairXpos%A_Index%-5
		boxYpos%A_Index% := crosshairYpos%A_Index%-5
		if previewactive%A_Index% = 1
		{
			SelectionColor%A_Index% = Silver
			PreviewColor%A_Index% = Fuchsia
		}
		else
		{
			SelectionColor%A_Index% = Gray
			PreviewColor%A_Index% = Blue
		}

			selectionColorLoopX := % boxXpos%A_Index%
			selectionColorLoopY := % boxYpos%A_Index%
			crosshairColorLoopX := % crosshairXpos%A_Index%
			crosshairColorLoopY := % crosshairYpos%A_Index%
			shadowboxColor := % selectioncolor%A_Index%
			crosshairColor := % previewcolor%A_Index%
			crosshairNumber := % crosshair%A_Index%
			selectionNumber = Selection%A_Index% ;

			Gui, shadowbox%A_Index%:New, +AlwaysOnTop +E0x08000000 -Caption
			Gui -dpiscale
			Gui margin,0,0
			Gui shadowbox%A_Index%:Add,Listview, w35 h35 Background%shadowboxColor% v%A_Index% gSelection -Hdr -E0x200 -border AltSubmit
			Gui, shadowbox%A_Index%:+Ownercolorslider
			Gui, shadowbox%A_Index%:Show,x%selectionColorLoopX% y%selectionColorLoopY% w35 h35

			Gui, crosshairpreview%A_Index%:New, +AlwaysOnTop +E0x08000000 -Caption
			Gui crosshairpreview%A_Index%:Add,Progress, x-3 y-3 w35 h35 c%crosshairColor% vPreview%A_Index% -border,100
			Gui, crosshairpreview%A_Index%:+Ownercolorslider
			Gui, crosshairpreview%A_Index%:Show,x%crosshairColorLoopX% y%crosshairColorLoopY% w35 h35
			WinSet, Region, %crosshairNumber%, A
			Gui, +E0x80020
			Gosub save
		}
	return
	}


Selection: 
selectionCrosshairXpos := % crosshairXpos%A_GuiControl%
selectionCrosshairYpos := % crosshairYpos%A_GuiControl%
crosshairActiveNum := % crosshair%A_GuiControl%
if A_GuiEvent = Normal
{
	loop, 8
	{
		if A_Index = %A_GuiControl%
		{
			previewactiveNew1 = 0 ; Default cursor is selected in F10 Menu
			previewactiveNew2 = 0 ; Following selections are 'inactive'
			previewactiveNew3 = 0
			previewactiveNew4 = 0
			previewactiveNew5 = 0
			previewactiveNew6 = 0
			previewactiveNew7 = 0
			previewactiveNew8 = 0
			previewactive%A_GuiControl% = 1
			previewactiveNew = 1
			IniWrite, %previewactiveNew1%, %ScriptName%.ini, Crochair tol,previewactive1
			IniWrite, %previewactiveNew2%, %ScriptName%.ini, Crochair tol,previewactive2
			IniWrite, %previewactiveNew3%, %ScriptName%.ini, Crochair tol,previewactive3
			IniWrite, %previewactiveNew4%, %ScriptName%.ini, Crochair tol,previewactive4
			IniWrite, %previewactiveNew5%, %ScriptName%.ini, Crochair tol,previewactive5
			IniWrite, %previewactiveNew6%, %ScriptName%.ini, Crochair tol,previewactive6
			IniWrite, %previewactiveNew7%, %ScriptName%.ini, Crochair tol,previewactive7
			IniWrite, %previewactiveNew8%, %ScriptName%.ini, Crochair tol,previewactive8
			IniWrite, %previewactiveNew%, %ScriptName%.ini, Crochair tol,previewactive%A_GuiControl%
			Gui, crosshairpreview%A_GuiControl%:New, +AlwaysOnTop +E0x08000000 -Caption
			Gui crosshairpreview%A_GuiControl%:Add,Progress,x-2 y-2 w35 h35 cFuchsia vPreview%A_GuiControl% -border,100
			Gui, crosshairpreview%A_GuiControl%:+Ownercolorslider
			Gui, crosshairpreview%A_GuiControl%:Show,x%selectionCrosshairXpos% y%selectionCrosshairYpos% w35 h35
			WinSet, Region, %crosshairActiveNum%, A
			Gui, +E0x80020
            IniWrite, crosshair%A_Index%, %ScriptName%.ini, Crochair tol,activecrosshair
			activecrosshair := crosshairActiveNum
			Gui, crosshair:Destroy
			GuiControl shadowbox%A_GuiControl%:+BackgroundSilver, %A_GuiControl%
			GuiControl crosshairpreview%A_GuiControl%:+cFuchsia, Preview%A_GuiControl%
			gosub, Start
		}
		else
		{
			previewactive%A_Index% = 0
			GuiControl shadowbox%A_Index%:+BackgroundGray, %A_Index%
			GuiControl crosshairpreview%A_Index%:+cBlue, Preview%A_Index%
		}
	}
}
return

server_save:
Gui, Submit
menutoolstoggle1 = 1
IniWrite, %servid%, %ScriptName%.ini, Crochair tol,servid
return

fund_server:
Run, https://www.battlemetrics.com/servers/scum
return

save:
Gui, crosshair:Submit, Nohide
n := Round(max/50,0)
if aa between 1 and 50
{
    a1 := Color(max)
    ab := aa*n
    a2 := Color(ab)
    a3 := Color(0)
	IniWrite, %a1%, %ScriptName%.ini, Crochair tol,a1
	IniWrite, %a2%, %ScriptName%.ini, Crochair tol,a2
	IniWrite, %a3%, %ScriptName%.ini, Crochair tol,a3
	IniWrite, %ab%, %ScriptName%.ini, Crochair tol,ab
	IniWrite, %aa%, %ScriptName%.ini, Crochair tol,aa
}
if aa between 51 and 100
{
    a2 := Color(max)
    ab := (max-aa)*n
    a1 := Color(ab)
    a3 := Color(0)
	IniWrite, %a1%, %ScriptName%.ini, Crochair tol,a1
	IniWrite, %a2%, %ScriptName%.ini, Crochair tol,a2
	IniWrite, %a3%, %ScriptName%.ini, Crochair tol,a3
	IniWrite, %ab%, %ScriptName%.ini, Crochair tol,ab
	IniWrite, %aa%, %ScriptName%.ini, Crochair tol,aa
}
if aa between 101 and 150
{
    a2 := Color(max)
    ab := (aa-100)*n
    a3 := Color(ab)
    a1 := Color(0)
	IniWrite, %a1%, %ScriptName%.ini, Crochair tol,a1
	IniWrite, %a2%, %ScriptName%.ini, Crochair tol,a2
	IniWrite, %a3%, %ScriptName%.ini, Crochair tol,a3
	IniWrite, %ab%, %ScriptName%.ini, Crochair tol,ab
	IniWrite, %aa%, %ScriptName%.ini, Crochair tol,aa
}
if aa between 151 and 200
{
    a3 := Color(max)
    ab := (max-(aa-150))*n
    a2 := Color(ab)
    a1 := Color(0)
	IniWrite, %a1%, %ScriptName%.ini, Crochair tol,a1
	IniWrite, %a2%, %ScriptName%.ini, Crochair tol,a2
	IniWrite, %a3%, %ScriptName%.ini, Crochair tol,a3
	IniWrite, %ab%, %ScriptName%.ini, Crochair tol,ab
	IniWrite, %aa%, %ScriptName%.ini, Crochair tol,aa
}
if aa between 201 and 250
{
    a3 := Color(max)
    ab := (aa-200)*n
    a1 := Color(ab)
    a2 := Color(0)
	IniWrite, %a1%, %ScriptName%.ini, Crochair tol,a1
	IniWrite, %a2%, %ScriptName%.ini, Crochair tol,a2
	IniWrite, %a3%, %ScriptName%.ini, Crochair tol,a3
	IniWrite, %ab%, %ScriptName%.ini, Crochair tol,ab
	IniWrite, %aa%, %ScriptName%.ini, Crochair tol,aa
}
if aa between 251 and 300
{
    a1 := Color(max)
    ab := (max-(aa-250))*n
    a3 := Color(ab)
    a2 := Color(0)
	IniWrite, %a1%, %ScriptName%.ini, Crochair tol,a1
	IniWrite, %a2%, %ScriptName%.ini, Crochair tol,a2
	IniWrite, %a3%, %ScriptName%.ini, Crochair tol,a3
	IniWrite, %ab%, %ScriptName%.ini, Crochair tol,ab
	IniWrite, %aa%, %ScriptName%.ini, Crochair tol,aa
}
loop, 1
{
    GuiControl crosshair:+c%a1%%a2%%a3%, Crosshair
}
return

Color(N) {
   SetFormat, Integer, Hex 
   N += 0 
   SetFormat, Integer, D 
   StringTrimLeft, N, N, 2 
   If(StrLen(N) < 2) 
      N = 0%N%
   Return N 
}

Exit: 
    ExitApp 
Return




Run:
if IsLabel(k:=RegExReplace(RegExReplace(A_GuiControl,".*]"),"\W"))
  Goto, %k%
return

ShowTip(s:="", pos:="y35", color:="Red|00FFFF") {
  static bak, idx
  if (bak=color "," pos "," s)
    return
  bak:=color "," pos "," s
  SetTimer, ShowTip_ChangeColor, Off
  Gui, ShowTip: Destroy
  if (s="")
    return
  ; WS_EX_NOACTIVATE:=0x08000000, WS_EX_TRANSPARENT:=0x20
  Gui, ShowTip: +LastFound +AlwaysOnTop +ToolWindow -Caption +E0x08000020
  Gui, ShowTip: Color, FFFFF0
  WinSet, TransColor, FFFFF0 150
  Gui, ShowTip: Margin, 10, 5
  Gui, ShowTip: Font, Q3 s20 bold
  Gui, ShowTip: Add, Text,, %s%
  Gui, ShowTip: Show, NA %pos%, ShowTip
  SetTimer, ShowTip_ChangeColor, 1000
  ShowTip_ChangeColor:
  Gui, ShowTip: +AlwaysOnTop
  r:=StrSplit(SubStr(bak,1,InStr(bak,",")-1),"|")
  Gui, ShowTip: Font, % "Q3 c" r[idx:=Mod(Round(idx),r.length())+1]
  GuiControl, ShowTip: Font, Static1
  return
}

;============ Hotkey =============


F1::
Suspend, Permit
Goto, RecordScreen

F2::
Suspend, Permit
Goto, RecordWindow

RecordScreen:
RecordWindow:
if (Recording or Playing)
  return
Coord:=InStr(A_ThisLabel,"Win") ? "Window":"Screen"
LogArr:=[], oldid:="", Log(), Recording:=1, SetHotkey(1)
ShowTip("Recording")
return


F3::
Stop:
Suspend, Permit
if Recording
{
  if (LogArr.MaxIndex()>0)
  {
    s:="`nLoop, 1`n{`n`nSetTitleMatchMode, 2"
      . "`nCoordMode, Mouse, " Coord "`n"
    For k,v in LogArr
      s.="`n" v "`n"
    s.="`nSleep, 1000`n`n}`n"
    s:=RegExReplace(s,"\R","`n")
    FileDelete, %LogFile%
    FileAppend, %s%, %LogFile%
    s:=""
  }
  SetHotkey(0), Recording:=0, LogArr:=""
}
else if Playing
{
  WinGet, list, List, %Play_Title%
  Loop, % list
    if WinExist("ahk_id " list%A_Index%)!=A_ScriptHwnd
    {
      WinGet, pid, PID
      WinClose,,, 3
      IfWinExist
        Process, Close, %pid%
    }
  SetTimer, CheckPlay, Off
  Playing:=0
}
ShowTip()
Suspend, Off
Pause, Off
GuiControl,, Pause, % "[F6] Pause "
isPaused:=0
return


Numpad4::
Play:
Suspend, Permit
if (Recording or Playing)
  Gosub, Stop
ahk:=A_IsCompiled ? A_ScriptDir "\AutoHotkey.exe" : A_AhkPath
IfNotExist, %ahk%
{
  MsgBox, 4096, Error, Can't Find %ahk% !
  Exit
}
Run, %ahk% /r "%LogFile%"
SetTimer, CheckPlay, 500
Gosub, CheckPlay
return

CheckPlay:
Check_OK:=0
WinGet, list, List, %Play_Title%
Loop, % list
  if (list%A_Index%!=A_ScriptHwnd)
    Check_OK:=1
if Check_OK
  Playing:=1, ShowTip("Playing")
else if Playing
{
  SetTimer, CheckPlay, Off
  Playing:=0, ShowTip()
}
return


F5::
Edit:
Suspend, Permit
Gosub, Stop
Run, notepad.exe "%LogFile%"
return


; F6::
; Pause:
; Suspend, Permit
; if Recording
; {
;   Suspend
;   Pause, % A_IsSuspended ? "On":"Off", 1
;   isPaused:=A_IsSuspended, Log()
; }
; else if Playing
; {
;   isPaused:=!isPaused
;   WinGet, list, List, %Play_Title%
;   Loop, %list%
;     if WinExist("ahk_id " list%A_Index%)!=A_ScriptHwnd
;       PostMessage, 0x111, 65306
; }
; else return
; if isPaused
;   GuiControl,, Pause, [F6]<Pause>
; else
;   GuiControl,, Pause, % "[F6] Pause "
; return


;============ Functions =============


SetHotkey(f:=0) {
  ; These keys are already used as hotkeys
  global UsedKeys
  f:=f ? "On":"Off"
  Loop, 254
  {
    k:=GetKeyName(vk:=Format("vk{:X}", A_Index))
    if k not in ,Control,Alt,Shift,%UsedKeys%
      Hotkey, ~*%vk%, LogKey, %f% UseErrorLevel
  }
  For i,k in StrSplit("NumpadEnter|Home|End|PgUp"
    . "|PgDn|Left|Right|Up|Down|Delete|Insert", "|")
  {
    sc:=Format("sc{:03X}", GetKeySC(k))
    if k not in ,Control,Alt,Shift,%UsedKeys%
      Hotkey, ~*%sc%, LogKey, %f% UseErrorLevel
  }
  SetTimer, LogWindow, %f%
  if (f="On")
    Gosub, LogWindow
}

LogKey:
LogKey()
return

LogWindow:
LogWindow()
return

LogKey() {
  Critical
  k:=GetKeyName(vksc:=SubStr(A_ThisHotkey,3))
  k:=StrReplace(k,"Control","Ctrl"), r:=SubStr(k,2)
  if r in Alt,Ctrl,Shift,Win
    LogKey_Control(k)
  else if k in LButton,RButton,MButton
    LogKey_Mouse(k)
  else
  {
    if (k="NumpadLeft" or k="NumpadRight") and !GetKeyState(k,"P")
      return
    k:=StrLen(k)>1 ? "{" k "}" : k~="\w" ? k : "{" vksc "}"
    Log(k,1)
  }
}

LogKey_Control(key) {
  global LogArr, Coord
  k:=InStr(key,"Win") ? key : SubStr(key,2)
  if (k="Ctrl")
  {
    CoordMode, Mouse, %Coord%
    MouseGetPos, X, Y
  }
  Log("{" k " Down}",1)
  Critical, Off
  KeyWait, %key%
  Critical
  Log("{" k " Up}",1)
  if (k="Ctrl")
  {
    i:=LogArr.MaxIndex(), r:=LogArr[i]
    if InStr(r,"{Blind}{Ctrl Down}{Ctrl Up}")
      LogArr[i]:="MouseMove, " X ", " Y
  }
}

LogKey_Mouse(key) {
  global gui_id, LogArr, Coord
  k:=SubStr(key,1,1)
  CoordMode, Mouse, %Coord%
  MouseGetPos, X, Y, id
  if (id=gui_id)
    return
  Log("MouseClick, " k ", " X ", " Y ",,, D")
  CoordMode, Mouse, Screen
  MouseGetPos, X1, Y1
  t1:=A_TickCount
  Critical, Off
  KeyWait, %key%
  Critical
  t2:=A_TickCount
  if (t2-t1<=200)
    X2:=X1, Y2:=Y1
  else
    MouseGetPos, X2, Y2
  i:=LogArr.MaxIndex(), r:=LogArr[i]
  if InStr(r, ",,, D") and Abs(X2-X1)+Abs(Y2-Y1)<5
    LogArr[i]:=SubStr(r,1,-5), Log()
  else
    Log("MouseClick, " k ", " (X+X2-X1) ", " (Y+Y2-Y1) ",,, U")
}

LogWindow() {
  global oldid, LogArr
  static oldtitle
  id:=WinExist("A")
  WinGetTitle, title
  WinGetClass, class
  if (title="" and class="")
    return
  if (id=oldid and title=oldtitle)
    return
  oldid:=id, oldtitle:=title
  title:=SubStr(title,1,50)
  if (!A_IsUnicode)
  {
    GuiControl,, MyText, %title%
    GuiControlGet, s,, MyText
    if (s!=title)
      title:=SubStr(title,1,-1)
  }
  title.=class ? " ahk_class " class : ""
  title:=RegExReplace(Trim(title), "[``%;]", "``$0")
  s:="tt = " title "`nWinWait, %tt%"
    . "`nIfWinNotActive, %tt%,, WinActivate, %tt%"
  i:=LogArr.MaxIndex(), r:=LogArr[i]
  if InStr(r,"tt = ")=1
    LogArr[i]:=s, Log()
  else
    Log(s)
}

Log(str:="", Keyboard:=0) {
  global LogArr
  static LastTime
  t:=A_TickCount, Delay:=(LastTime ? t-LastTime:0), LastTime:=t
  IfEqual, str,, return
  i:=LogArr.MaxIndex(), r:=LogArr[i]
  if (Keyboard and InStr(r,"Send,") and Delay<1000)
  {
    LogArr[i]:=r . str
    return
  }
  if (Delay>200)
    LogArr.Push("Sleep, " (Delay//2))
  LogArr.Push(Keyboard ? "Send, {Blind}" str : str)
}

;============ The End ============

;


#If GetKeyState("ScrollLock", "T")
1::Numpad1 ; 1
2::Numpad2 ; 2
3::Numpad3 ; 3
4::Numpad4 ; 4
5::Numpad5 ; 5
6::Numpad6 ; 6
7::Numpad7 ; 7
8::Numpad8 ; 8
9::Numpad9 ; 9
0::Numpad0 ; 0
/::NumpadDiv ; /
*::NumpadMult ; *
+::NumpadAdd ; +
=::NumpadAdd ; =
-::NumpadSub ; -
ENTER::NumpadEnter ; Enter
.::NumpadDot ; .