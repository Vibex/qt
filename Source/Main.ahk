	;Autorun
		#SingleInstance Force
		#MaxThreads 8
		#MaxHotkeysPerInterval 100
		#WinActivateForce
		AutoTrim, On
		SetTitleMatchMode, Fast
		SetTitleMatchMode, 3
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
		workspace1 := 1
		workspace2 := 1
		workspace3 := 1
		
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
			hWnd := WinExist()
			DllCall( "RegisterShellHookWindow", UInt,hWnd )
			MsgNum := DllCall( "RegisterWindowMessage", Str,"SHELLHOOK" )
			OnMessage( MsgNum, "ShellMessage" )
		}
	return
	
	
	#Include Hotkeys.ahk
	#Include Methods.ahk
	#Include MoveMethods.ahk
	#Include Bar.ahk
	#Include Debug.ahk