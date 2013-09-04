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
		
		qtVersion := "0.7.2"
		
		reload()
		SetBatchLines, %bspeed%
		SetWinDelay, %wspeed%
		SetKeyDelay, %kspeed%
		SetControlDelay, %cspeed%
		
		remove(null, 1)
		
		workspace1 := 1
		workspace2 := 1
		workspace3 := 1
		
		mon1_mode := 1
		mon2_mode := 1
		mon3_mode := 1
		
		confine := 0
		confineid := null
		
		clockOn := -1
		previd := null
		
		gidDEBUG := null
		
		if (baryeah = 1)
		{
			clockOn := 0
			InitializeBar(1, Mon1Width, barheight1, Mon1Left, Mon1Top)
			if (dis2 = 1)
			{
				InitializeBar(2, Mon2Width, barheight2, Mon2Left, Mon2Top)
			}
			if (dis3 = 1)
			{
				InitializeBar(3, Mon3Width, barheight3, Mon3Left, Mon3Top)
			}
		}
		
		previousid := null
		currentid := WinExist("A")
		
		allWindowEffect()
		
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
	#Include Fnt.ahk