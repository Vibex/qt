	InitializeBar(mon, w, h, x)
	{
		global
		CoordMode, Mouse, Screen
		Gui, Margin, 0, 0

		hpos := 1
		hwin := 1
		hflash := 1
		hclock := 1
		
		configB := "Config\Bar\configBar.txt"
		FileReadLine, updateRate, %configB%, 4
		FileReadLine, barColour, %configB%, 7
		FileReadLine, selecColour, %configB%, 10
		FileReadLine, texColour, %configB%, 13
		FileReadLine, font, %configB%, 16
		FileReadLine, fontsize, %configB%, 19
		
		noWin := "no window selected"
		currentWin := noWin
		
		Gui, bar:Color, %barColour%
		Gui, bar:+LastFound -Caption +ToolWindow
		Gui, bar:Font, s%fontSize% c%texColour%, %font%
		
		if (hpos = 1)
		{
			Gui, bar:Add, Text, vPos x4 y1 h%h%, XXXXX, YYYYY
		}
		
		numop := 9
		
		if (hwin = 1)
		{
			size := (w - 44 - 84 - 10) / numop
			shift := 84
			Loop, %numop%
			{
				Gui, bar:Add, Text, vItem%A_Index% x%shift% y1 w%size% Center, %noWin%
				shift := shift + size
			}
		}
		
		if (hflash = 1)
		{
			Gui, bar:Add, Text, vflash x%shift% y1 h%h% Center, 0
		}
		
		if (hclock = 1) 
		{
			shift := shift + 10
			Gui, bar:Add, Text, vClock x%shift% y1 h%h%, 00 00.00
		}
		
		SetTimer, Update, %updateRate%
		Gosub, Update
		Gui, bar:Show, x0 y0 w%w% h%h% NoActivate
	return
	}

	Update:
	{
		if (hpos = 1)
		{
			MouseGetPos, MouseX, MouseY
			GuiControl, bar:, Pos, X%MouseX%, Y%MouseY%
		}
		if (hclock = 1)
		{
			GuiControl, bar:, Clock, %A_DD% %A_Hour%.%A_Min%
		}
		if (hflash = 1)
		{
			GuiControl, bar:, flash, %flashNum0%
		}
		Gosub, UpdateTitle
	return
	}
	
	UpdateTitle:
	{
		WinGetTitle, current, ahk_id %currentid%
		WinGetTitle, previous, ahk_id %previousid%
		GuiControl, bar:, Item1, %current%
		GuiControl, bar:, Item2, %previous%
	return
	}