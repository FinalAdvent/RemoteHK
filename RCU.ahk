#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
!1::
Gui, New
Gui Add, Button, y40 x125 w50 h25 gUpdate vPull, Pull
Gui Add, Button, x20 y40 w50 h25 vPush, Push
Gui Add, Button, x230 y40 w50 h25 Default gCancel vCamcel, Cancel 
Gui Add, Text, y10 x0 W300 Center, Push or pull from GitHub.
Gui, Add, StatusBar, vStat
Gui, Show, W300 H100
Return

!2::
Reload


Update:
{
GuiControl, Disable, Pull
GuiControl, Disable, Push
GuiControl, Disable, Cancel
GuiControl, , Stat, Pulling from GitHub.
UrlDownloadToFile, https://raw.githubusercontent.com/FinalAdvent/RemoteHK/master/RCR.ahk , Updated.ahk
Sleep 500
FileCopy, RCR.ahk, RCR.OLD
Sleep 200
FileDelete,  RCR.ahk
Sleep 200
FileCopy, Updated.ahk, RCR.ahk
Sleep 200
FileDelete,  Updated.ahk
GuiControl, , Stat, Done!
GuiControl, Disable0, Pull
GuiControl, Disable0, Push
GuiControl, Disable0, Cancel
Return
}


Cancel:
Gui destroy
Return 