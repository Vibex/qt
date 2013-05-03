	InitializeBar(b, w, h, x)
	{
		global
		CoordMode, Mouse, Screen
		Gui, Margin, 0, 0
		hpos := 1
		hwin := 1
		hclock := 1
		
		transColour = EEAA99
		barColour = 323232
		selecColour = 4A4A4A
		texColour = CDCDCD
		
		if (hpos = 1)
		{
			Gui pos%bar%:+LastFound +AlwaysOnTop -Caption +ToolWindow
			Gui, pos%bar%:Color, %barColour%
			Gui, pos%bar%:Font, s9 c%texColour%, Haxrcorp 4088
			Gui, pos%bar%:Add, Text, vText%bar% x4 y1 h15, XXXXX, YYYYY
			Gui, pos%bar%:Show, x0 y0 h15 NoActivate
		}
		
		if (hwin = 1)
		{
			Gui win%bar%:+LastFound +AlwaysOnTop -Caption +ToolWindow
			Gui, win%bar%:Color, %selecColour%
			Gui, win%bar%:Font, s9 c%texColour%, Haxrcorp 4088
			size := 500
			if (hpos = 0)
			{
				shift := 4
			} else {
				shift := 81
			}
			Gui, win%bar%:Add, Text, vText%bar% x4 y1 w%size%, no window selected
			Gui, win%bar%:Show, x%shift% y0 w%size% h15 NoActivate
		}
		
		if (hclock = 1) 
		{
			Gui clock%bar%:+LastFound +AlwaysOnTop -Caption +ToolWindow
			Gui, clock%bar%:Color, %barColour%
			Gui, clock%bar%:Font, s9 c%texColour%, Haxrcorp 4088
			Gui, clock%bar%:Add, Text, vText%bar% x4 y1 h15, 00  00.00
			shift := 1920 - 54
			Gui, clock%bar%:Show, x%shift% y0 h15 NoActivate
		}
		
		Gui, bar:Color, %barColour%
		Gui bar:+LastFound -Caption +ToolWindow
		Gui, bar:Show, x0 y0 w1920 h15 NoActivate
		
		SetTimer, Update, 50
		Gosub, Update
	return
	}

	Update:
	{
		if (hpos = 1)
		{
			MouseGetPos, MouseX, MouseY
			GuiControl, pos%bar%:, Text, X%MouseX%, Y%MouseY%
		}
		if (hwin = 1)
		{
			WinGetTitle, currentWin, A
			GuiControl, win%bar%:, Text, %currentWin%
		}
		if (hclock = 1)
		{
			GuiControl, clock%bar%:, Text, %A_DD%  %A_Hour%.%A_Min%
		}
	return
	}