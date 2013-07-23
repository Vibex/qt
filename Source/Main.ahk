	;Autorun
		#SingleInstance Force
		#MaxThreads 8
		#MaxHotkeysPerInterval 100
		#WinActivateForce
		AutoTrim, On
		SetTitleMatchMode,Slow
		CoordMode, Mouse, Screen
		DetectHiddenWindows, On
		OnExit, DeathToTheScript
		null := ""
		full := "This string is full and should fix all the problems I am having"
		
		boundary := 20
		reload()
		SetBatchLines, %bspeed%
		SetWinDelay, %wspeed%
		SetKeyDelay, %kspeed%
		SetControlDelay, %cspeed%
		
		remove(null, 1)
		Confine := 0
		
		gidDEBUG := null
		
		if (baryeah = 1)
		{
			barheight := 15
			clockOn := 0
			InitializeBar(1, Mon1Width, barheight, Mon1Left, Mon1Top)
			if (dis2 = 1)
			{
				InitializeBar(2, Mon2Width, barheight, Mon2Left, Mon2Top)
			}
			if (dis3 = 1)
			{
				InitializeBar(3, Mon3Width, barheight, Mon3Left, Mon3Top)
			}
		}
		
		previousid := null
		currentid := WinExist("A")
		
		WinGet, winarr ,List
		Loop, %winarr%
		{
			idtemp := winarr%A_Index%
			WinGetClass, class, ahk_id %idtemp%
			if (exclusion(class) = 1)
			{
				if (titlebaraway = 1)
				{
					titleBeGone(idtemp, 2)
				}
				if (nonactivetrans = 255)
				{
					trans(idtemp, nonactivetrans)
				}
			}
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
        move(null, 1, 1)
	return
	}
	
	#NumpadUp::
	{
        move(null, 1, 2)
	return
	}
	
	#NumpadPgUp::
	{
        move(null, 1, 3)
	return
	}
	
	#NumpadLeft::
	{
        move(null, 2, 1)
	return
	}

	#NumpadClear::
	{
        move(null, 2, 2)
	return
	}
	
	#NumpadRight::
	{
        move(null, 2, 3)
	return
	}

	#NumpadEnd::
	{
        move(null, 3, 1)
	return
	}

	#NumpadDown::
	{
        move(null, 3, 2)
	return
	}
	
	#NumpadPgDn::
	{
        move(null, 3, 3)
	return
	}
	
	
	
	#NumLock::
	{
		idtemp := WinExist("A")
		screenFill(2, idtemp)
	return
	}
	
	#NumpadDiv::
	{
		idtemp := WinExist("A")
		screenFill(1, idtemp)
	return
	}
	
	#NumpadMult::
	{
		idtemp := WinExist("A")
		screenFill(3, idtemp)
	return
	}
	
	
	
	#^NumLock::
	{
		idtemp := WinExist("A")
		center(2, idtemp)
	return
	}
	
	#^NumpadDiv::
	{
		idtemp := WinExist("A")
		center(1, idtemp)
	return
	}
	
	#^NumpadMult::
	{
		idtemp := WinExist("A")
		center(3, idtemp)
	return
	}
	
	
	
	#^NumpadHome::
	{
		centerPanel("l")
	return
	}
	
	#^NumpadPgUp::
	{
		centerPanel("r")
	return
	}
	
	
	
	#^NumpadClear::
	{
		idtemp := WinExist("A")
		titleBeGone(idtemp)
	return
	}
	
	
	
	#O::
	{
		;Toggle the always on yop state.
		idtemp := WinExist("A")
		WinSet, AlwaysOnTop,, ahk_id %idtemp%
	return
	}
	
	#M::
	{
		;Minimize the current window
		idtemp := WinExist("A")
		WinMinimize, ahk_id %idtemp%
	return
	}
	
	#W::
	{
		remove(a, 1)
	return
	}
	
	
	
	#`::
	{
		WinGetPos, xtemp,,,, ahk_id %gidDEBUG%
		if (gidDEBUG = null)
		{
			createDebug()
		} else if (dis3 = 1)
		{
			if (xtemp > Mon3Right)
			{
				center(1, gidDEBUG)
			} else {
				x := Mon3Right + 100
				WinMove, ahk_id %gidDEBUG%,, %x%
			}
		} else {
			if (xtemp > Mon1Right)
			{
				center(1, gidDEBUG)
			} else {
				x := Mon1Right + 100
				WinMove, ahk_id %gidDEBUG%,, %x%
			}
		}
	return
	}

	
	
	#F1::
	{
		IfExist, README.exe
		{
			Run, README.exe
		} else IfExist, README.ahk
		{
			IfExist, README.txt
			{
				Run, README.ahk
			} else {
				Run, explore %A_WorkingDir%
			}
		} else {
			Run, explore %A_WorkingDir%
		}
	return
	}
	
	#F2::
	{
		;Change the window title.
		idtemp := WinExist("A")
		WinGetTitle, title, ahk_id %idtemp%
		InputBox, newName, Rename "%title%" - qt.pi, Rename the current window.`n(Curently custom fonts are not available in AHK input boxes. As soon as this is available`, I will implement it. Otherwise I will write a GUI to do this more nicely.),,,,,,,, %title%
		WinSetTitle, ahk_id %idtemp%,, %newName%
	return
	}
	
	;#F3::
	;{
		;Will launch in the in-bar search function
	;return
	;}
	
	#F4::
	{
		ExitApp
	return
	}
	
	!F4::
	{
		idtemp := WinExist("A")
		if (idtemp != gidDEBUG)
		{
			remove(idtemp)
			WinKill, ahk_id %idtemp%
		} else {
			MsgBox, Please use Win + `` to hide the debug window.
		}
	return
	}
	
	#F5::
	{
		Reload
		Sleep 1000
	return
	}
	
	#F8::
	{
		;Minimize all windows
		DetectHiddenWindows, Off
		WinGet, winarr ,List
		Loop, %winarr%
		{
			idtemp := winarr%A_Index%
			WinGetClass, class, ahk_id %idtemp%
			if (exclusion(class) = 1)
			{
				WinMinimize, ahk_id %idtemp%
			}
		}
	return
	}
	
	#F9::
	{
		;Restore all windows
		DetectHiddenWindows, Off
		WinGet, winarr ,List
		Loop, %winarr%
		{
			idtemp := winarr%A_Index%
			WinRestore, ahk_id %idtemp%
		}
	return
	}
	
	#F11::
	{
		;Toggle the fullscreen state
		idtemp := WinExist("A")
		WinGetPos, xtemp, ytemp, wtemp, htemp, ahk_id %idtemp%
		if (xtemp >= Mon1Left && xtemp < Mon1Right)
		{
			mon := 1
		} else if (xtemp < Mon1Left && dis2 = 1)
		{
			mon := 2
		} else if (xtemp >= Mon1Right && dis3 = 1)
		{
			mon := 3
		}
		if (mon != 0)
		{
			remove(idtemp)
			if (xtemp = Mon%mon%Left && ytemp = Mon%mon%Top && wtemp = Mon%mon%Width && htemp = Mon%mon%Height)
			{
				if (titlebaraway = 0)
				{
					titlebegone(idtemp, 3)
				}
				screenFill(mon, idtemp)
			} else {
				titlebegone(idtemp, 2, null)
				id := mon%mon%_Full
				WinSet, Style, +0x40000, ahk_id %id%
				WinSet, Style, -0x40000, ahk_id %idtemp%
				Mon%mon%_Full := idtemp
				WinMove, ahk_id %idtemp%,, (Mon%mon%Left), (Mon%mon%Top), (Mon%mon%Width), (Mon%mon%Height)
			}
		}
	return
	}
	
	
	
	#^Up::
	{
		shiftBorder("u")
	return
	}
	
	#^Down::
	{
		shiftBorder("d")
	return
	}
	
	#^Left::
	{
		shiftBorder("l")
	return
	}
	
	#^Right::
	{
		shiftBorder("r")
	return
	}
	
	
	
	#NumpadAdd::
	{
		sound("u")
	return
	}
	
	#NumpadEnter::
	{
		sound("d")
	return
	}
	
	#NumpadSub::
	{	
		sound("m")
	return
	}
	
	
	
	#Insert::
	{
		Send {Media_Play_Pause}
	return
	}
	
	#Home::
	{
		Send {Media_Prev}
	return
	}
	
	#PgUp::
	{
		Send {Media_Next}
	return
	}
	
	
	
	
	#^WheelUp::
	{
		idtemp := WinExist("A")
		trans(idtemp, "u")
	return
	}
	
	#^WheelDown::
	{
		idtemp := WinExist("A")
		trans(idtemp, "d")
	return
	}
	
	
	;Simple script, though I would still like to give credit, the below two commands are from http://pixelfuckers.org/submissions/2182
	~LButton & WheelUp::AltTab
	~LButton & WheelDown::ShiftAltTab
	
	
	
	;This script is a modified version of http://www.autohotkey.com/docs/scripts/EasyWindowDrag_%28KDE%29.htm.
	#LButton::
	{
		;Drag window.
		SetWinDelay, -1
		SetBatchLines, -1
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
				remove(KDE_id)
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
		;Resize window.
		SetWinDelay, -1
		SetBatchLines, -1
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
				remove(KDE_id)
			break
			}
			GetKeyState, KDE_EscapeState, Escape, P
			if KDE_EscapeState = D
			{
				WinSetTitle, ahk_id %KDE_id%,, %title%
				WinMove, ahk_id %KDE_id%,, %KDE_WinXStart%, %KDE_WinYStart%, %KDE_WinWStart%, %KDE_WinHStart%
			break
			}
			MouseGetPos,KDE_X2,KDE_Y2
			WinGetPos,KDE_WinX1,KDE_WinY1,KDE_WinW,KDE_WinH,ahk_id %KDE_id%
			KDE_X2 -= KDE_X1
			KDE_Y2 -= KDE_Y1
			WinMove,ahk_id %KDE_id%,, KDE_WinX1 + (KDE_WinLeft+1)/2*KDE_X2 , KDE_WinY1 +  (KDE_WinUp+1)/2*KDE_Y2 , KDE_WinW - KDE_WinLeft *KDE_X2, KDE_WinH - KDE_WinUp *KDE_Y2
			KDE_X1 := (KDE_X2 + KDE_X1)
			KDE_Y1 := (KDE_Y2 + KDE_Y1)
		}
	return
	}
	
	#MButton::
	{
		;Minimize the clicked on window.
		MouseGetPos,,, idtemp
		WinMinimize, ahk_id %idtemp%
	return
	}
	
	
	
	DeathToTheScript:
	{
		SetBatchLines, -1
		DetectHiddenWindows, Off
		if(A_ExitReason != "Shutdown" && A_ExitReason != "Logoff" && A_ExitReason != "reload")
		{
			WinGet, winarr ,List
			Loop, %winarr%
			{
				idtemp := winarr%A_Index%
				WinGetClass, class, ahk_id %idtemp%
				if (exclusion(class) = 1)
				{
					titleBeGone(idtemp, 3)
				}
				trans(idtemp, 255)
			}
		}
	ExitApp
	Sleep 1000
	}
	
	
	
	#Include Methods.ahk
	#Include Bar.ahk
	#Include Debug.ahk