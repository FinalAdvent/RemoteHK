#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#singleinstance, force
Version := 0.03

; Inputs := "Command, LockMouse"
; Inputs := "Command, Message, Test LMAO"
; Inputs := "Function, Beep, , "

!f::
InputBox, Inputs
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
	If (InputArray0 = 2)
		%InputArray2%()
	Else
	{
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
	}
	Return 
}



!ESC::Reload



Beep(Fq := 523, Dur := 100)
{
	SoundBeep, %Fq%, %Dur%
	Return
}



Update(Ver = Version)
{
	Run, RCU.exe
	Sleep 5000
	Reload
}
