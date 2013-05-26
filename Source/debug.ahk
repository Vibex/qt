	createDebug()
	
	createDebug()
	{
		global
		demon := 1
		Gui, +Resize
		Gui, Add, Edit, vMainDebug WantTab W200 H200, 
		Gui, Show,, de.pi
		gid:= WinExist("A")
		titleBeGone(gid)
		move(gid, 3, 3)
		GoSub, UpdateDebug
		SetTimer, UpdateDebug, 500
	return
	}

	GuiSize:
	{
		if ErrorLevel = 1
		{
		return
		}
		NewWidth := A_GuiWidth - 20
		NewHeight := A_GuiHeight - 20
		GuiControl, Move, MainDebug, W%NewWidth% H%NewHeight%
	return
	}
	
	GuiClose:
	{
		ExitApp
	}
	
	UpdateDebug:
	{
		temptotal1 := "1`n"
		temptotal2 := "2`n"
		temptotal3 := "3`n"
		X := 0
		Loop, 3
		{
			X += 1
			Y := 0
			Loop, 3
			{
				Y += 1
				if (mon1_%X%_%Y% != null)
				{
					temp1%x%_%Y% := 1
				} else {
				
					temp1%x%_%Y% := 0
				}
				temptotal1 := temptotal1 . temp1%X%_%Y%
				if (mon2_%X%_%Y% != null)
				{
					temp2%x%_%Y% := 1
				} else {
					temp2%x%_%Y% := 0
				}
				temptotal2 := temptotal2 . temp2%X%_%Y%
				if (mon3_%X%_%Y% != null)
				{
					temp3%x%_%Y% := 1
				} else {
					temp3%x%_%Y% := 0
				}
				temptotal3 := temptotal3 . temp3%X%_%Y%
			}
			temptotal1 := temptotal1 . "`n"
			temptotal2 := temptotal2 . "`n"
			temptotal3 := temptotal3 . "`n"
		}
		GuiControl,, MainDebug, %temptotal1%`n%temptotal2%`n%temptotal3%
	return
	}
	
	demon(new)
	{
		global demon
		demon := new
	return
	}
	
	#If activeWindow()
	^1::
	{
		demon(1)
	return
	}
	
	#If activeWindow()
	^2::
	{
		demon(2)
	return
	}
	
	#If activeWindow()
	^3::
	{
		demon(3)
	return
	}
	
	#If activeWindow()
	^W::
	{
		remove(null, 1)
	return
	}
	
	activeWindow()
	{
		global
		temp:= WinExist("A")
	return (temp = gid)
	}