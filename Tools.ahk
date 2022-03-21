; ########### init program ###########
;
; AutoHotkey Version: 0.1
; Language:       Russia
; Platform:       Windows 7/8/8.1 32/64bit
; Author:         KilleryStark 	krutikovily@gmail.com
{
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Persistent
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
CoordMode, ToolTip, Screen 

;-------------Remove .ahk and .exe from filename to get name for INI file
ScriptName := A_ScriptName
StringReplace, ScriptName, ScriptName, .ahk,, All
StringReplace, ScriptName, ScriptName, .exe,, All
}
Menu, Tray, NoStandard 
Menu, Tray, Add, Exit, Exit
Menu, Tray, Default, Exit

if FileExist(A_ScriptDir . "\icon.ico")
	Menu, Tray, Icon, %A_ScriptDir%\icon.ico
if not A_IsAdmin ; Checks if script is being run as an administrator, if not it wil prompt for it.
{
    Run *RunAs "%A_ScriptFullPath%"
    ExitApp
}

diam = 25 ; Maximum canvas size of X-Y values for crosshair

Max = 255 ; Used to set max color value for slider
a1=BE        ; Red value
a2=00        ; Green value
a3=FF        ; Blue value


crosshair1 = 11-0 10-10 15-15 14-14

;--------------------Load the saved values.
IfExist %ScriptName%.ini
{
	IniRead,activecrosshair, %ScriptName%.ini, Crochair tol,activecrosshair
}

;--------------------Set the new values.
IfnotExist %ScriptName%.ini
{
	activecrosshair = crosshair1
    IniWrite, %activecrosshair%, %ScriptName%.ini, Crochair tol,activecrosshair
}
;------------------------------------------



activecrosshair := %activecrosshair% ; Default crosshair

invisible = 0
menutoggle = 1 ; Initialize menu to OFF
previewactive1 = 1 ; Default cursor is selected in F10 Menu
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
	
	loop, 1
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
	loop, 10
	{
		if A_Index = %A_GuiControl%
		{
			previewactive%A_GuiControl% = 1
			Gui, crosshairpreview%A_GuiControl%:New, +AlwaysOnTop +E0x08000000 -Caption
			Gui crosshairpreview%A_GuiControl%:Add,Progress,x-2 y-2 w35 h35 cFuchsia vPreview%A_GuiControl% -border,100
			Gui, crosshairpreview%A_GuiControl%:+Ownercolorslider
			Gui, crosshairpreview%A_GuiControl%:Show,x%selectionCrosshairXpos% y%selectionCrosshairYpos% w35 h35
			WinSet, Region, %crosshairActiveNum%, A
			Gui, +E0x80020
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
	

save:
Gui, crosshair:Submit, Nohide
n := Round(max/50,0)
if aa between 1 and 50
{
    a1 := Color(max)
    ab := aa*n
    a2 := Color(ab)
    a3 := Color(0)
}
if aa between 51 and 100
{
    a2 := Color(max)
    ab := (max-aa)*n
    a1 := Color(ab)
    a3 := Color(0)
}
if aa between 101 and 150
{
    a2 := Color(max)
    ab := (aa-100)*n
    a3 := Color(ab)
    a1 := Color(0)
}
if aa between 151 and 200
{
    a3 := Color(max)
    ab := (max-(aa-150))*n
    a2 := Color(ab)
    a1 := Color(0)
}
if aa between 201 and 250
{
    a3 := Color(max)
    ab := (aa-200)*n
    a1 := Color(ab)
    a2 := Color(0)
}
if aa between 251 and 300
{
    a1 := Color(max)
    ab := (max-(aa-250))*n
    a3 := Color(ab)
    a2 := Color(0)
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