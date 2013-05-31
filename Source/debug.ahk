	createDebug()
	
	createDebug()
	{
		global
		Gui, Margin, 0, 0
		demon := 1
		Gui, +Resize
		Gui, Add, Edit, vMainDebug WantTab W200 H200 X0 Y0, 
		Gui, Show,, de.pi
		gid:= WinExist("A")
		titleBeGone(gid)
		center(1, gid)
		GoSub, UpdateDebug
		SetTimer, UpdateDebug, 1000
	return
	}

	GuiSize:
	{
		if ErrorLevel = 1
		{
		return
		}
		NewWidth := A_GuiWidth
		NewHeight := A_GuiHeight
		GuiControl, Move, MainDebug, W%NewWidth% H%NewHeight%
	return
	}
	
	GuiClose:
	{
		ExitApp
	}
	
	UpdateDebug:
	{
		Gui, Submit, NoHide
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
				Loop, 3
				{
					if (mon%A_Index%_%X%_%Y% != null)
					{
						test := InStr(mon%A_Index%_%X%_%Y%, full)
						if (test != 0)
						{
							temp%A_Index%%x%_%Y% := "F"
						} else {
							temp%A_Index%%x%_%Y% := 1
						}
					} else if (x <= row%A_Index% && y <= col%A_Index%)
					{
						temp%A_Index%%x%_%Y% := 0
					}
					temptotal%A_Index% := temptotal%A_Index% . temp%A_Index%%X%_%Y%
				}
			}
			Loop, 3
			{
				if (x <= row%A_Index%)
				{
					temptotal%A_Index% := temptotal%A_Index% . "`n"
				}
			}
		}
		merge := temptotal1 . "`n" . temptotal2 . "`n" . temptotal3
		if (MainDebug != merge)
		{
			GuiControl,, MainDebug, %merge%
		}
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