	InitializeBar(mon, w, h, x)
	{
		global
		CoordMode, Mouse, Screen
		Gui, Margin, 0, 0

		hpos := 1
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
		
		shift := 84
		Loop, 9
		{
			Gui, bar:Add, Text, vItem%A_Index% Center, %noWin%
			GuiControl, Hide, Item%A_Index%
		}
		
		if (hclock = 1) 
		{
			shift := w - 44 - 68 - 10 + 80
			Gui, bar:Add, Text, vClock x%shift% y1 h%h%, 00 - 00.00
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
			GuiControl, bar:, Clock, %A_DD% - %A_Hour%.%A_Min%
		}
		if (hflash = 1)
		{
			GuiControl, bar:, flash, %numwin1%
		}
		Gosub, UpdateTitle
	return
	}
	
	UpdateTitle:
	{
		DetectHiddenWindows, Off
		WinGet, List, List
		numwin1 := 0
		Loop, %List%
		{
			curwin := List%A_Index%
			WinGetClass, class, ahk_id %curwin%
			WinGetPos, xtemp,,,, ahk_id %curwin%
			WinGetTitle, title, ahk_id %curwin%
			if (xtemp >= Mon1Left && xtemp < Mon1Right && exclusion(class) = 1 && title != "main.ahk")
			{
				numwin1 += 1
				numwin1_%A_Index% := curwin
			}
		}
		shift := 80
		size := (Mon1Width - 44 - shift) / numwin1
		Loop, 9
		{
			GuiControl, bar:, Item%A_Index%, %noWin%
			GuiControl, Hide, Item%A_Index%
		}
		Loop, %numwin1%
		{
			Gui, Submit, NoHide
			curwin := numwin1_%A_Index%
			WinGetTitle, Temp, ahk_id %curwin%
			GuiControl, bar:Move, Item%A_Index%, x%shift% y1 w%size%
			if(Item%A_Index% != Temp)
			{
				GuiControl, bar:, Item%A_Index%, %temp% - %curwin%
			}
			GuiControl, bar:Show, Item%A_Index%,
			shift := shift + size
		}
		DetectHiddenWindows, On
	return
	}