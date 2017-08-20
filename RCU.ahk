#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#NoTrayIcon


Gui, New
Gui Add, Button, y40 x125 w50 h25 gPull vPull, Pull
Gui Add, Button, x20 y40 w50 h25 gPush vPush, Push
Gui Add, Button, x230 y40 w50 h25 Default gCancel vCamcel, Cancel 
Gui Add, Text, y10 x0 W300 Center, Push or pull from GitHub.
Gui, Add, StatusBar, vStat
Gui, Show, W300 H100
Return

Push:
{
	GuiControl, Disable, Pull
	GuiControl, Disable, Push
	GuiControl, Disable, Cancel
	Run, cmd /q /c cd C:\Users\mjdeb\OneDrive\AutoHotKey\RemoteHK & git add RCU.ahk & git commit -m "automatic update from RCU.ahk" & git push
	GuiControl, Disable0, Pull
	GuiControl, Disable0, Push
	GuiControl, Disable0, Cancel
	Return
}

Pull:
{
	GuiControl, Disable, Pull
	GuiControl, Disable, Push
	GuiControl, Disable, Cancel
	GuiControl, , Stat, Pulling from GitHub.
	; UrlDownloadToFile, https://raw.githubusercontent.com/FinalAdvent/RemoteHK/master/RCR.ahk , Updated.ahk
	Sleep Rand(100,500)
	GuiControl, , Stat, Removing old versions.
	; FileDelete,  RCR.ahk
	Sleep Rand(100,500)
	GuiControl, , Stat, Installing new version.
	; FileCopy, Updated.ahk, RCR.ahk
	Sleep Rand(100,500)
	GuiControl, , Stat, Cleaning up.
	; FileDelete,  Updated.ahk
	Sleep Rand(100,500)
	GuiControl, , Stat, Done!
	GuiControl, Disable0, Pull
	GuiControl, Disable0, Push
	GuiControl, Disable0, Cancel
	Return 
}

Cancel:
{
	ExitApp
	Return 
}




!Esc::
Reload

Rand(Min,Max)
{
	Random, Rand, Min, Max
	Return Rand
}