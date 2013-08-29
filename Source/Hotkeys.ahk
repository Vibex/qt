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
		screenFill(2)
	return
	}
	
	#NumpadDiv::
	{
		screenFill(1)
	return
	}
	
	#NumpadMult::
	{
		screenFill(3)
	return
	}
	
	
	
	#^NumpadHome::
	{
		halfSide("l")
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
		halfSide("r")
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
		idtemp := WinExist("A")
		WinSet, AlwaysOnTop,, ahk_id %idtemp%
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
	
	#1::
	{
		workspaceSwitch(1)
	return
	}
	
	#2::
	{
		workspaceSwitch(2)
	return
	}
	
	#3::
	{
		workspaceSwitch(3)
	return
	}
	
	#ScrollLock::
	{
		confine()
	return
	}
	
	
	
	#T::
	{
		mode(1)
	return
	}
	
	#M::
	{
		mode(2)
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
		trans(null, "u")
	return
	}
	
	#^WheelDown::
	{
		trans(null, "d")
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