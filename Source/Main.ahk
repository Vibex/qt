	;Autorun
		#SingleInstance Force
		#MaxThreads 8
		#MaxHotkeysPerInterval 100
		#WinActivateForce
		AutoTrim, On
		SetTitleMatchMode,Slow
		CoordMode, Mouse, Screen
		DetectHiddenWindows, On
		null := ""
		full := "This string is full and should fix all the problems I am having"
		
		reload()
		SetBatchLines, %bspeed%
		SetWinDelay, %wspeed%
		SetKeyDelay, %kspeed%
		SetControlDelay, %cspeed%
		
		remove(null, 1)
		
		if (baryeah = 1)
		{
			barheight := 15
			InitializeBar(1, Mon1Width, barheight, Mon1Left)
		}
		
		previousid := null
		currentid := WinExist("A")
		
		flashNum0 := 0
		
		if (debug = 1)
		{
			createDebug()
		}
		
		if (winHook = 1)
		{
			Hwnd := WinExist(A_ScriptFullPath)
			DllCall( "RegisterShellHookWindow", UInt,Hwnd )
			MsgNum := DllCall( "RegisterWindowMessage", Str,"SHELLHOOK" )
			OnMessage( MsgNum, "ShellMessage" )
		}
	return
	
	
	
	#NumpadHome::
	{
		idtemp := WinExist("A")
        move(idtemp, 1, 1)
	return
	}
	
	#NumpadUp::
	{
		idtemp := WinExist("A")
        move(idtemp, 1, 2)
	return
	}
	
	#NumpadPgUp::
	{
		idtemp := WinExist("A")
        move(idtemp, 1, 3)
	return
	}
	
	#NumpadLeft::
	{
		idtemp := WinExist("A")
        move(idtemp, 2, 1)
	return
	}

	#NumpadClear::
	{
		idtemp := WinExist("A")
        move(idtemp, 2, 2)
	return
	}
	
	#NumpadRight::
	{
		idtemp := WinExist("A")
        move(idtemp, 2, 3)
	return
	}

	#NumpadEnd::
	{
		idtemp := WinExist("A")
        move(idtemp, 3, 1)
	return
	}

	#NumpadDown::
	{
		idtemp := WinExist("A")
        move(idtemp, 3, 2)
	return
	}
	
	#NumpadPgDn::
	{
		idtemp := WinExist("A")
        move(idtemp, 3, 3)
	return
	}
	
	
	
	#Numpad7::
	{
		MouseGetPos, mpos
		grid(mpos, 1, 1)
	return
	}
	
	#Numpad8::
	{
		MouseGetPos, mpos
		grid(mpos, 1, 2)
	return
	}
	
	#Numpad9::
	{
		MouseGetPos, mpos
		grid(mpos, 1, 3)
	return
	}
	
	#Numpad4::
	{
		MouseGetPos, mpos
		grid(mpos, 2, 1)
	return
	}
	
	#Numpad5::
	{
		MouseGetPos, mpos
		grid(mpos, 2, 2)
	return
	}
	
	#Numpad6::
	{
		MouseGetPos, mpos
		grid(mpos, 2, 3)
	return
	}
	
	#Numpad1::
	{
		MouseGetPos, mpos
		grid(mpos, 3, 1)
	return
	}
	
	#Numpad2::
	{
		MouseGetPos, mpos
		grid(mpos, 3, 2)
	return
	}
	
	#Numpad3::
	{
		MouseGetPos, mpos
		grid(mpos, 3, 3)
	return
	}
	
	
	
	#^NumpadHome::
	{
		idtemp := WinExist("A")
		screenFill(2, idtemp)
	return
	}
	
	#^NumpadUp::
	{
		idtemp := WinExist("A")
		screenFill(1, idtemp)
	return
	}
	
	#^NumpadPgUp::
	{
		idtemp := WinExist("A")
		screenFill(3, idtemp)
	return
	}
	
	
	
	#^NumpadEnd::
	{
		idtemp := WinExist("A")
		center(2, idtemp)
	return
	}
	
	#^NumpadDown::
	{
		idtemp := WinExist("A")
		center(1, idtemp)
	return
	}
	
	#^NumpadPgDn::
	{
		idtemp := WinExist("A")
		center(3, idtemp)
	return
	}
	
	
	
	#^NumpadClear::
	{
		idtemp := WinExist("A")
		titleBeGone(idtemp)
	return
	}
	
	
	
	#F::
	~!F4::
	{
		idtemp := WinExist("A")
		remove(idtemp)
	return
	}
	
	#R::
	{
		Reload
		Sleep 1000
	return
	}
	
	#W::
	{
		remove(a, 1)
	return
	}
	
	#T::
	{
		idtemp := WinExist("A")
		WinGetTitle, title, ahk_id %idtemp%
		InputBox, newName, Rename "%title%" - qt.pi, Rename the current window.`n(Curently custom fonts are not available in AHK input boxes. As soon as this is available`, I will implement it. Otherwise I will write a GUI to do this more nicely.),,,,,,,, %title%
		WinSetTitle, ahk_id %idtemp%,, %newName%
	return
	}
	
	#O::
	{
		idtemp := WinExist("A")
		WinSet, AlwaysOnTop,, ahk_id %idtemp%
	return
	}
	
	
	
	#^Up::
	{
		idtemp := WinExist("A")
		shiftBorder(idtemp, "u")
	return
	}
	
	#^Down::
	{
		idtemp := WinExist("A")
		shiftBorder(idtemp, "d")
	return
	}
	
	#^Left::
	{
		idtemp := WinExist("A")
		shiftBorder(idtemp, "l")
	return
	}
	
	#^Right::
	{
		idtemp := WinExist("A")
		shiftBorder(idtemp, "r")
	return
	}
	
	
	
	#NumpadAdd::
	{
		sound("u")
	return
	}
	
	#NumpadSub::
	{	
		sound("d")
	return
	}
	
	#NumpadEnter::
	{
		sound("m")
	return
	}
	
	
	
	#WheelUp::
	{
		idtemp := WinExist("A")
		trans(idtemp, "u")
	return
	}
	
	#WheelDown::
	{
		idtemp := WinExist("A")
		trans(idtemp, "d")
	return
	}
	
	
	
	;This script is a modified version of http://www.autohotkey.com/docs/scripts/EasyWindowDrag_%28KDE%29.htm.
	#LButton::
	{
		SetWinDelay, -1
		MouseGetPos,KDE_X1,KDE_Y1,KDE_id
		WinActivate, ahk_id %KDE_id%
		WinGetPos,KDE_WinXStart,KDE_WinYStart,,,ahk_id %KDE_id%
		
		KDE_WinX1 := KDE_WinXStart
		KDE_WinY1 := KDE_WinYStart
		Loop
		{
			GetKeyState,KDE_Button,LButton,P
			If KDE_Button = U
			{
			break
			}
			GetKeyState, KDE_EscapeState, Escape, P
			if KDE_EscapeState = D
			{
				WinMove, ahk_id %KDE_id%,, %KDE_WinXStart%, %KDE_WinYStart%
			break
			}
			MouseGetPos,KDE_X2,KDE_Y2
			KDE_X2 -= KDE_X1
			KDE_Y2 -= KDE_Y1
			KDE_WinX2 := (KDE_WinX1 + KDE_X2)
			KDE_WinY2 := (KDE_WinY1 + KDE_Y2)
			WinMove,ahk_id %KDE_id%,,%KDE_WinX2%,%KDE_WinY2%
		}
	return
	}
	
	#RButton::
	{
		SetWinDelay, -1
		MouseGetPos,KDE_X1,KDE_Y1,KDE_id
		WinActivate, ahk_id %KDE_id%
		WinGetPos,KDE_WinXStart,KDE_WinYStart,KDE_WinWStart,KDE_WinHStart,ahk_id %KDE_id%
		KDE_WinX1 := KDE_WinXStart
		KDE_WinY1 := KDE_WinYStart
		KDE_WinW := KDE_WinWStart
		KDE_WinH := KDE_WinHStart
		If (KDE_X1 < KDE_WinX1 + KDE_WinW / 2)
		{
			KDE_WinLeft := 1
		}
		Else
		{
			KDE_WinLeft := -1
		}
		If (KDE_Y1 < KDE_WinY1 + KDE_WinH / 2)
		{
			KDE_WinUp := 1
		}
		Else
		{
			KDE_WinUp := -1
		}
		mon := 0
		Loop, 3
		{
			if (Mon%A_Index%_center = KDE_id)
			{
				mon := A_Index
			break
			}
		}
		Loop
		{
			GetKeyState,KDE_Button,RButton,P ; Break if button has been released.
			If KDE_Button = U
			{
				if (mon != 0)
				{
					center(mon, KDE_id)
				}
			break
			}
			GetKeyState, KDE_EscapeState, Escape, P
			if KDE_EscapeState = D
			{
				WinMove, ahk_id %KDE_id%,, %KDE_WinXStart%, %KDE_WinYStart%, %KDE_WinWStart%, %KDE_WinHStart%
			break
			}
			MouseGetPos,KDE_X2,KDE_Y2
			WinGetPos,KDE_WinX1,KDE_WinY1,KDE_WinW,KDE_WinH,ahk_id %KDE_id%
			KDE_X2 -= KDE_X1
			KDE_Y2 -= KDE_Y1
			WinMove,ahk_id %KDE_id%,, KDE_WinX1 + (KDE_WinLeft+1)/2*KDE_X2 , KDE_WinY1 +  (KDE_WinUp+1)/2*KDE_Y2 , KDE_WinW - KDE_WinLeft *KDE_X2 , KDE_WinH - KDE_WinUp *KDE_Y2
			KDE_X1 := (KDE_X2 + KDE_X1)
			KDE_Y1 := (KDE_Y2 + KDE_Y1)
		}
	return
	}
	
	#MButton::
	{
		SetWinDelay, -1
		MouseGetPos,,,KDE_id
		WinActivate, ahk_id %KDE_id%
		WinGetPos,KDE_WinXStart,KDE_WinYStart,KDE_WinWStart,KDE_WinHStart,ahk_id %KDE_id%
		Loop
		{
			GetKeyState, KDE_Button, MButton, P
			If KDE_Button = U
			{
			break
			}
			GetKeyState, KDE_EscapeState, Escape, P
			if KDE_EscapeState = D
			{
				WinMove, ahk_id %KDE_id%,, %KDE_WinXStart%, %KDE_WinYStart%, %KDE_WinWStart%, %KDE_WinHStart%
			break
			}
			MouseGetPos, mousepos
			if (mousepos < 0 && dis2 = 1)
			{
				newmon := 2
			} else if (mousepos >= Mon1Right && dis3 = 1)
			{
				newmon := 3
			} else {
				newmon := 1
			}
			screenFill(newmon, KDE_id)
		}
	return
	}
	
	
	#Include Methods.ahk
	#Include Bar.ahk
	#Include Debug.ahk