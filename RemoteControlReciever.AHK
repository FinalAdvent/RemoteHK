#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#singleinstance, force

;Inputs := "Command, LockMouse"
Inputs := "Command, Message, Fuck"
;Inputs := "Function, Beep, , "

f::
StringSplit, InputArray, Inputs , `,,%A_Space%
If InputArray1 = Command
	Goto %InputArray2%
If InputArray1 = Function
{
	If IsFunc(InputArray2) 
		Goto %InputArray1%
	Else
		MsgBox, No such Function exists.
}
Return

LockMouse:
{
	MouseLock := !MouseLock
	;MsgBox, %MouseLock% 
	If (MouseLock = 1)
		BlockInput, On
	Else
		BlockInput, Off
	Return
}

Message:
{
	MsgBox, % InputArray3
	Return
}

Function:
{
	;Msgbox,%InputArray0%
	If (InputArray0 = 3)
		%InputArray2%(InputArray3)
	Else
	{
		If (InputArray0 = 4)
			%InputArray2%(InputArray3,InputArray4)
		Else
		{
			If (InputArray0 = 5)
				%InputArray2%(InputArray3,InputArray4,InputArray5)
			Else
			{
				If (InputArray0 = 6)
					%InputArray2%(InputArray3,InputArray4,InputArray5,InputArray6)
				Else
				{
					If (InputArray0 = 7)
						%InputArray2%(InputArray3,InputArray4,InputArray5,InputArray6,InputArray7)
					Else
					{
						If (InputArray0 = 8)
							%InputArray2%(InputArray3,InputArray4,InputArray5,InputArray6,InputArray7,InputArray8)
						Else
						{
							If (InputArray0 = 9)
								%InputArray2%(InputArray3,InputArray4,InputArray5,InputArray6,InputArray7,InputArray8,InputArray9)
							Else
								Msgbox, Nope
						}	
					}
				}
			}
		}
	}	
	Return 
}

!ESC::Reload


Beep(Fq, Dur)
{
SoundBeep, %Fq%, %Dur%
Return
}
