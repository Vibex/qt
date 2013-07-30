	#U::
	{
        move(null, 1, 1)
	return
	}
	
	#I::
	{
        move(null, 1, 2)
	return
	}
	
	#O::
	{
        move(null, 1, 3)
	return
	}
	
	#K::
	{
        move(null, 2, 1)
	return
	}

	#L::
	{
        move(null, 2, 2)
	return
	}
	
	#;::
	{
        move(null, 2, 3)
	return
	}

	#,::
	{
        move(null, 3, 1)
	return
	}

	#.::
	{
        move(null, 3, 2)
	return
	}
	
	#/::
	{
        move(null, 3, 3)
	return
	}
	
	
	
	#8::
	{
		idtemp := WinExist("A")
		screenFill(2, idtemp)
	return
	}
	
	#9::
	{
		idtemp := WinExist("A")
		screenFill(1, idtemp)
	return
	}
	
	#0::
	{
		idtemp := WinExist("A")
		screenFill(3, idtemp)
	return
	}
	
	
	
	#^I::
	{
		centerPanel("l")
	return
	}
	
	#^O::
	{
		idtemp := WinExist("A")
		center(0, idtemp)
	return
	}
	
	#^P::
	{
		centerPanel("r")
	return
	}
	
	
	
	#^L::
	{
		idtemp := WinExist("A")
		titleBeGone(idtemp)
	return
	}
	
	
	
	#T::
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