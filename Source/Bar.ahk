	InitializeBar(mon, w, h, x, y)
	{
		global
		CoordMode, Mouse, Screen
		Gui, Margin, 0, 0
		
		configB := "Config\Bar\configBar.txt"
		FileReadLine, updateRate, %configB%, 4
		FileReadLine, updateRate2, %configB%, 7
		FileReadLine, font, %configB%, 10
		FileReadLine, fontsize, %configB%, 13
		FileReadLine, texColour, %configB%, 16
		FileReadLine, barColour, %configB%, 19
		FileReadLine, command, %configB%, 22
		FileReadLine, defsearch, %configB%, 25
		FileReadLine, progloc, %configB%, 28
		FileReadLine, otherexe, %configB%, 31
		if (otherexe != null)
		{
			StringSplit, otherexe, otherexe, `,
		} else {
			otherexe0 := 1
			otherexe1 := null	
		}
		
		Gui, bar%mon%:Color, %barColour%
		Gui, bar%mon%:+LastFound -Caption +ToolWindow
		Gui, bar%mon%:Font, s%fontSize% c%texColour%, %font%
		
		shift := w - 52
		Gui, bar%mon%:Add, Text, vTitle%mon% x0 y1 w%shift% h%h% Center, no window selected
		
		Gui, bar%mon%:Add, Text, vClock%mon% x%shift% y1 h%h%, 00 - 00.00
		
		if (mon = 1)
		{
			Gui, bar1:Add, Text, vText Hidden, Run:
			Gui, bar1:Add, Edit, vRun Limit Hidden
		}
		
		SetTimer, Update%mon%, %updateRate%
		Gosub, Update%mon%
		if (clockOn = 0)
		{
			SetTimer, UpdateClock, %updaterate2%
		}
		Gosub, UpdateClock
		Gui, bar%mon%:Show, x%x% y%y% w%w% h%h%
		barid%mon% := WinExist("A")
	return
	}
 
	Update1:
	{
		GuiControlGet, Title1, bar1:
		WinGetTitle, temp, ahk_id %curid1%
		if (Title1 != temp)
		{
			GuiControl, bar1:, Title1, %temp%
		}
	return
	}
	
	Update2:
	{
		GuiControlGet, Title2, bar2:
		WinGetTitle, temp, ahk_id %curid2%
		if (Title2 != temp)
		{
			GuiControl, bar2:, Title2, %temp%
		}
	return
	}
	
	Update3:
	{
		GuiControlGet, Title3, bar3:
		WinGetTitle, temp, ahk_id %curid3%
		if (Title3 != temp)
		{
			GuiControl, bar3:, Title3, %temp%
		}
	return
	}
	
	UpdateClock:
	{
		clockOn := 1
		GuiControlGet, Clock1, bar1:
		if (Clock1 != "%A_DD% - %A_Hour%.%A_Min%")
		{
			GuiControl, bar1:, Clock1, %A_DD% - %A_Hour%.%A_Min%
			GuiControl, bar2:, Clock2, %A_DD% - %A_Hour%.%A_Min%
			GuiControl, bar3:, Clock3, %A_DD% - %A_Hour%.%A_Min%
		}
	return
	}
	
	activeWindow()
	{
		global
		temp:= WinExist("A")
    return (temp = barid1)
	}
	
	visibility()
	{
		global
		itemborder := 2
		temp1 := itemborder * -1
		temp2 := barheight + (itemborder * 2)
		GuiControlGet, visible, bar1:Visible, Run
		if (visible = 1)
		{
			GuiControl, bar1:, Run,
			GuiControl, bar1:Hide, Run
			GuiControl, bar1:Hide, Text
			GuiControl, bar1:Show, Title1
		} else {
			GuiControl, bar1:Hide, Title1
			GuiControl, bar1:Show, Run
			GuiControl, bar1:Show, Text
			shift := Mon1Width - 54 - 24
			GuiControl, bar1:Move, Run, x24 y%temp1% w%shift% h%temp2%
			GuiControl, bar1:Move, Text, x4 y1 w18 h15 
			GuiControl, bar1:Focus, Run
			WinActivate, ahk_id %barid1%
		}
	return
	}
	
	defaultSearch(mode = 2)
	{
		global
		StringMid, part2, Run, %mode%
		StringReplace, part2, part2, %A_Space%, +, 1
		if (defsearch = 0)
		{
			if (mode = 2)
			{
				MsgBox, Command not recognized and no default search set.
			} else {
				MsgBox, File not found and no default search set.
			}
		} else if (defsearch = 1)
		{
			isRun := "https://www.google.com/search?q=" . part2
		} else if (defsearch = 2)
		{
			isRun := "https://duckduckgo.com/?q=" . part2
		} else {
			isRun := defsearch . part2
		}
	return
	}
	
	#Space::
	{
		visibility()
	return
	}
	
	#If activeWindow()
	Enter::
	{
		Gui, Submit, NoHide
		GuiControlGet, Run, bar1:
		if (Run = null)
		{
		return
		}
		StringSplit, arrtemp, Run , %A_Space%
		part2 := arrtemp2
		Loop, %arrtemp0%
		{
			x := A_Index + 2 
			if (A_Index + 2 > arrtemp0)
			{
			break
			}
			get := arrtemp%x%
			part2 := part2 . " " . get
		}
		isRun := null
		isOther := null
		StringMid, isCommand, arrtemp1, 1, 1
		if (isCommand = command)
		{
			if (arrtemp1 = command . "qt.pi")
			{
				isRun := "https://github.com/Vibex/qt.pi"
			} else if (arrtemp1 = command . "google" || arrtemp1 = command . "g")
			{
				StringReplace, part2, part2, %A_Space%, +, 1
				isRun := "https://www.google.com/search?q=" . part2
			} else if (arrtemp1 = command . "duckduckgo" || arrtemp1 = command . "d")
			{
				StringReplace, part2, part2, %A_Space%, +, 1
				isRun := "https://duckduckgo.com/?q=" . part2
			} else if (arrtemp1 = command . "hummingbird" || arrtemp1 = command . "h")
			{
				StringReplace, part2, part2, %A_Space%, +, 1
				isRun := "http://hummingbird.me/search?query=" . part2
			} else if (arrtemp1 = command . "wikipedia" || arrtemp1 = command . "wiki" || arrtemp1 = command . "w")
			{
				StringReplace, part2, part2, %A_Space%, +, 1
				isRun := "https://en.wikipedia.org/w/index.php?title=Special%3ASearch&profile=default&search=" . part2 . "&fulltext=Search"
			} else if (arrtemp1 = command . "nyaa" || arrtemp1 = command . "n")
			{
				StringReplace, part2, part2, %A_Space%, +, 1
				isRun := "http://www.nyaa.eu/?page=search&cats=0_0&filter=0&term=" . part2
			} else if (arrtemp1 = command . "piratebay" || arrtemp1 = command . "p")
			{
				isRun := "http://thepiratebay.sx/search/" . part2 . "/0/99/0"
			} else {
				defaultSearch()
			}
		} else {
			temp1 := progloc . run . ".lnk"
			temp2 := progloc . run . ".exe"
			IfExist, %temp1%
			{
				isRun := temp1
			} else IfExist, %temp2%
			{
				isRun := temp2
			} else {
				Loop, %otherexe0%
				{
					temp := progloc . run . otherexe%A_Index%
					IfExist, %temp%
					{
						isRun := temp
					break
					}
				}
			}
			if (isRun = null)
			{
				defaultSearch(1)
			}
		}
		if (isRun != null)
		{
			run, %isRun%
		}
		visibility()
	return
	}