; ########### init program ###########

#SingleInstance, force
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