	;Autorun.
		AutoTrim, On
		SetTitleMatchMode,Slow
		CoordMode, Mouse, Screen
		DetectHiddenWindows, On
		null := ""
		full := "This string is full and should fix all the problems I am having"
		
		reload()
		arrGrid(1)
		arrGrid(2)
		arrGrid(3)

		Hwnd := WinExist(A_ScriptFullPath)

		DllCall( "RegisterShellHookWindow", UInt,Hwnd )

		MsgNum := DllCall( "RegisterWindowMessage", Str,"SHELLHOOK" )

		OnMessage( MsgNum, "ShellMessage" )
	return
	
	
	
	^NumpadHome::
	{
		idtemp := WinExist("A")
        move(idtemp, 1, 1)
	return
	}
	
	^NumpadUp::
	{
		idtemp := WinExist("A")
        move(idtemp, 1, 2)
	return
	}
	
	^NumpadPgUp::
	{
		idtemp := WinExist("A")
        move(idtemp, 1, 3)
	return
	}
	
	^NumpadLeft::
	{
		idtemp := WinExist("A")
        move(idtemp, 2, 1)
	return
	}

	^NumpadClear::
	{
		idtemp := WinExist("A")
        move(idtemp, 2, 2)
	return
	}
	
	^NumpadRight::
	{
		idtemp := WinExist("A")
        move(idtemp, 2, 3)
	return
	}

	^NumpadEnd::
	{
		idtemp := WinExist("A")
        move(idtemp, 3, 1)
	return
	}

	^NumpadDown::
	{
		idtemp := WinExist("A")
        move(idtemp, 3, 2)
	return
	}
	
	+NumpadPgDn::
	^NumpadPgDn::
	{
		idtemp := WinExist("A")
        move(idtemp, 3, 3, 0)
	return
	}
	
	+NumpadHome::
	{
		idtemp := WinExist("A")
        move(idtemp, 1, 1, 0)
	return
	}
	
	+NumpadUp::
	{
		idtemp := WinExist("A")
        move(idtemp, 1, 2, 0)
	return
	}
	
	+NumpadPgUp::
	{
		idtemp := WinExist("A")
        move(idtemp, 1, 3, 0)
	return
	}
	
	+NumpadLeft::
	{
		idtemp := WinExist("A")
        move(idtemp, 2, 1, 0)
	return
	}

	+NumpadClear::
	{
		idtemp := WinExist("A")
        move(idtemp, 2, 2, 0)
	return
	}
	
	+NumpadRight::
	{
		idtemp := WinExist("A")
        move(idtemp, 2, 3, 0)
	return
	}

	+NumpadEnd::
	{
		idtemp := WinExist("A")
        move(idtemp, 3, 1, 0)
	return
	}

	+NumpadDown::
	{
		idtemp := WinExist("A")
        move(idtemp, 3, 2, 0)
	return
	}
	
	
	
	^Numpad7::
	{
		MouseGetPos, mpos
		grid(mpos, 1, 1)
	return
	}
	
	^Numpad8::
	{
		MouseGetPos, mpos
		grid(mpos, 1, 2)
	return
	}
	
	^Numpad9::
	{
		MouseGetPos, mpos
		grid(mpos, 1, 3)
	return
	}
	
	^Numpad4::
	{
		MouseGetPos, mpos
		grid(mpos, 2, 1)
	return
	}
	
	^Numpad5::
	{
		MouseGetPos, mpos
		grid(mpos, 2, 2)
	return
	}
	
	^Numpad6::
	{
		MouseGetPos, mpos
		grid(mpos, 2, 3)
	return
	}
	
	^Numpad1::
	{
		MouseGetPos, mpos
		grid(mpos, 3, 1)
	return
	}
	
	^Numpad2::
	{
		MouseGetPos, mpos
		grid(mpos, 3, 2)
	return
	}
	
	^Numpad3::
	{
		MouseGetPos, mpos
		grid(mpos, 3, 3)
	return
	}
	
	
	
	!^NumpadHome::
	{
		idtemp := WinExist("A")
		screenFill(2, idtemp)
	return
	}
	
	!^NumpadUp::
	{
		idtemp := WinExist("A")
		screenFill(1, idtemp)
	return
	}
	
	!^NumpadPgUp::
	{
		idtemp := WinExist("A")
		screenFill(3, idtemp)
	return
	}
	
	
	
	^Up::
	{
		idtemp := WinExist("A")
		shift(idtemp, "u")
	return
	}
	
	^Down::
	{
		idtemp := WinExist("A")
		shift(idtemp, "d")
	return
	}
	
	^Left::
	{
		idtemp := WinExist("A")
		shift(idtemp, "l")
	return
	}
	
	^Right::
	{
		idtemp := WinExist("A")
		shift(idtemp, "r")
	return
	}
	
	
	
	!^NumpadClear::
	{
		idtemp := WinExist("A")
		titleBeGone(idtemp)
	return
	}
	
	!^F::
	~!F4::
	{
		idtemp := WinExist("A")
		remove(idtemp)
	return
	}
	
	!^R::
	{
		reload()
	return
	}
	
	!^W::
	{
		remove(a, 1)
	return
	}
	
	
	
	!^Up::
	{
		idtemp := WinExist("A")
		shiftBorder(idtemp, "u")
	return
	}
	
	!^Down::
	{
		idtemp := WinExist("A")
		shiftBorder(idtemp, "d")
	return
	}
	
	!^Left::
	{
		idtemp := WinExist("A")
		shiftBorder(idtemp, "l")
	return
	}
	
	!^Right::
	{
		idtemp := WinExist("A")
		shiftBorder(idtemp, "r")
	return
	}
	
	
	
	^NumpadAdd::
	{
		sound("u")
	return
	}
	
	^NumpadSub::
	{	
		sound("d")
	return
	}
	
	^NumpadEnter::
	{
		sound("m")
	return
	}
	
	
	
	#Include Methods.ahk