	InitializeBar(b, w, h, x)
	{
		global
		CoordMode, Mouse, Screen
		Gui, Margin, 0, 0
		hpos := 1
		hwin := 1
		hflash := 1
		hclock := 1
		
		noWin := "no window selected"
		currentWin := noWin
		
		transColour = EEAA99
		barColour = 323232
		selecColour = 4A4A4A
		texColour = CDCDCD
		
		font = Haxrcorp 4088
		fontSize := 9
		
		updateRate := 50
		
		if (hpos = 1)
		{
			Gui pos:+LastFound +AlwaysOnTop -Caption +ToolWindow
			Gui, pos:Color, %barColour%
			Gui, pos:Font, s%fontSize% c%texColour%, %font%
			Gui, pos:Add, Text, vText x4 y1 h%h%, XXXXX, YYYYY
			Gui, pos:Show, x0 y0 h%h% NoActivate
		}
		
		if (hwin = 1)
		{
			Gui win:+LastFound +AlwaysOnTop -Caption +ToolWindow
			Gui, win:Color, %selecColour%
			Gui, win:Font, s%fontSize% c%texColour%, %font%
			size := (w - 54 - 80 - 40) / 2
			if (hpos = 0)
			{
				shift := 4
			} else {
				shift := 80
			}
			Gui, win:Add, Text, vText x4 y1 w%size%, %noWin%
			Gui, win:Show, x%shift% y0 w%size% h%h% NoActivate
		}
		
		if (hwin = 1)
		{
			Gui win2:+LastFound +AlwaysOnTop -Caption +ToolWindow
			Gui, win2:Color, %barColour%
			Gui, win2:Font, s%fontSize% c%texColour%, %font%
			if (hpos = 0)
			{
				shift := 4 + size
			} else {
				shift := 80 + size
			}
			Gui, win2:Add, Text, vText x4 y1 w%size%, %noWin%
			Gui, win2:Show, x%shift% y0 w%size% h%h% NoActivate
		}
		
		if (hflash = 1)
		{
			Gui fla:+LastFound +AlwaysOnTop -Caption +ToolWindow
			Gui, fla:Color, %selecColour%
			Gui, fla:Font, s%fontSize% c%texColour%, %font%
			x := shift + size
			Gui, fla:Add, Text, vText y1 h%h%, 0
			Gui, fla:Show, x%x% y0 h%h% NoActivate
		}
		
		if (hclock = 1) 
		{
			Gui clock:+LastFound +AlwaysOnTop -Caption +ToolWindow
			Gui, clock:Color, %barColour%
			Gui, clock:Font, s%fontSize% c%texColour%, %font%
			Gui, clock:Add, Text, vText x4 y1 h%h%, 00 00.00
			shift := w - 54
			Gui, clock:Show, x%shift% y0 h%h% NoActivate
		}
		
		Gui, bar:Color, %barColour%
		Gui bar:+LastFound -Caption +ToolWindow
		Gui, bar:Show, x0 y0 w%w% h%h% NoActivate
		
		SetTimer, Update, %updateRate%
		Gosub, Update
		Gosub, UpdateTitle
	return
	}

	Update:
	{
		if (hpos = 1)
		{
			MouseGetPos, MouseX, MouseY
			GuiControl, pos:, Text, X%MouseX%, Y%MouseY%
		}
		if (hclock = 1)
		{
			GuiControl, clock:, Text, %A_DD% %A_Hour%.%A_Min%
		}
		if (hflash = 1)
		{
			GuiControl, fla:, Text, %flashNum0%
		}
		Gosub, UpdateTitle
	return
	}
	
	UpdateTitle:
	{
		WinGetTitle, current, ahk_id %currentid%
		WinGetTitle, previous, ahk_id %previousid%
		GuiControl, win:, Text, %current%
		GuiControl, win2:, Text, %previous%
	return
	}