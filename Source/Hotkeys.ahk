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
	
	
	
	#^NumpadHome::
	{
		centerPanel("l")
	return
	}
	
	#^NumpadUp::
	{
		idtemp := WinExist("A")
		center(0, idtemp)
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
		mini()
	return
	}
	
	#W::
	{
		remove(a, 1)
	return
	}
	
	#Tab::
	{
		workspaceSwitch()
	return
	}
	
	
	
	#`::
	{
		debug()
	return
	}

	
	
	#F1::
	{
		functionKey(1)
	return
	}
	
	#F2::
	{
		functionKey(2)
	return
	}
	
	;#F3::
	;{
		functionKey(3)
	;return
	;}
	
	#F4::
	{
		functionKey(4)
	return
	}
	
	!F4::
	{
		functionKey("A4")
	return
	}
	
	#F5::
	{
		functionKey(5)
	return
	}
	
	#F8::
	{
		functionKey(8)
	return
	}
	
	#F9::
	{
		functionKey(9)
	return
	}
	
	#F11::
	{
		functionKey(11)
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
	
	
	
	#LButton::
	{
		LDrag()
	return
	}
	
	#RButton::
	{
		RDrag()
	return
	}
	
	#MButton::
	{
		mini()
	return
	}