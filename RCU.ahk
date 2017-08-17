#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

UrlDownloadToFile, https://raw.githubusercontent.com/FinalAdvent/RemoteHK/master/RemoteControlReceiver.AHK , Updated.AHK
Sleep 500
FileCopy, RCR.AHK, RCR.OLD
Sleep 200
FileDelete,  RCR.AHK
Sleep 200
FileCopy, Updated.AHK, RCR.AHK
Sleep 200
FileDelete,  Updated.AHK
ExitApp 