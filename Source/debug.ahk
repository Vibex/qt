	createDebug()
	{
		global
		Gui, Margin, 0, 0
		demon := 1
		Gui, +Resize
		Gui, Add, Edit, vMainDebug WantTab W200 H200 X0 Y0, 
		Gui, Show,, %qtVersion% - qt.pi
		gidDEBUG:= WinExist("A")
		titleBeGone(gidDEBUG)
		center(1, gidDEBUG)
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
					work := workspace%A_Index%
					if (mon%A_Index%_%work%_%X%_%Y% != null)
					{
						test := InStr(mon%A_Index%_%work%_%X%_%Y%, full)
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
		merge := qtVersion . "`n`n" . temptotal1 . "`n" . temptotal2 . "`n" . temptotal3
		if (MainDebug != merge)
		{
			GuiControl,, MainDebug, %merge%
		}
	return
	}