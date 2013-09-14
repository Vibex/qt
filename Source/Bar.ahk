	InitializeBar(mon, w, h, x, y)
	{
		global
		local work
		
		Gui, Margin, 0, 0
		
		if (barColour != "auto")
		{
			Gui, bar%mon%:Color, %barColour%
		}
		Gui, bar%mon%:+LastFound -Caption +ToolWindow
		Gui, bar%mon%:Font, s%fontSize% c%texColour%, %font%
		
		makeBar(mon, w, h, x, y)
		
		Gosub, UpdateClock
		Gui, bar%mon%:Show, x%x% y%y% w%w% h%h%
		barid%mon% := WinExist("A")
	return
	}
 
	updateTitle(mon)
	{
		global
		local work
		
		GuiControlGet, Title%mon%, bar%mon%:
		work := workspace%mon%
		if (Title%mon% != workname%mon%%work%)
		{
			GuiControl, bar%mon%:, Title%mon%, % workname%mon%%work%
		}
	return
	}
	
	UpdateClock:
	{
		clockOn := 1
		GuiControlGet, Clock1, bar1:
		GuiControlGet, Date1, bar1:
		if (Clock1 != "%A_Hour%.%A_Min%")
		{
			GuiControl, bar1:, Clock1, %A_Hour%.%A_Min%
			GuiControl, bar2:, Clock2, %A_Hour%.%A_Min%
			GuiControl, bar3:, Clock3, %A_Hour%.%A_Min%
		}
		if (Date1 != "%A_DDDD%, %A_MMMM% %A_DD%")
		{
			GuiControl, bar1:, Date1, %A_DDD%, %A_MMM% %A_DD%
			GuiControl, bar2:, Date2, %A_DDD%, %A_MMM% %A_DD%
			GuiControl, bar3:, Date3, %A_DDD%, %A_MMM% %A_DD%
		}
	return
	}
	
	activeWindow()
	{
		global
		temp:= WinExist("A")
    return (temp = barid1)
	}
	
	visibility(hide = 0, switch = 1)
	{
		global
		local visible
		
		GuiControlGet, visible, bar1:Visible, Run
		if (visible = 1 || hide = 1)
		{
			GuiControl, bar1:, Run,
			GuiControl, bar1:Hide, Run
			GuiControl, bar1:Hide, Text
			GuiControl, bar1:Show, Title1
			GuiControl, bar1:Show, Date1
			GuiControl, bar1:Show, Clock1
			if (switch = 1)
			{
				WinActivate, ahk_id %previd%
			}
		} else {
			previd := WinExist("A")
			GuiControl, bar1:Hide, Title1
			GuiControl, bar1:Hide, Date1
			GuiControl, bar1:Hide, Clock1
			GuiControl, bar1:Show, Run
			GuiControl, bar1:Show, Text
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
			} else if (arrtemp1 = command . "animebyt" || arrtemp1 = command . "a")
			{
				StringReplace, part2, part2, %A_Space%, +, 1
				isRun := "https://animebytes.tv/torrents.php?searchstr=" . part2
			} else if (arrtemp1 = command . "piratebay" || arrtemp1 = command . "p")
			{
				isRun := "http://thepiratebay.sx/search/" . part2 . "/0/99/0"
			} else if (arrtemp1 = command . "logoff")
			{
				if (part2 = "-f")
				{
					Shutdown, 4
				} else {
					Shutdown, 0
				}
			} else if (arrtemp1 = command . "shutdown")
			{
				if (part2 = "-f")
				{
					Shutdown, 5
				} else {
					Shutdown, 1
				}
			} else if (arrtemp1 = command . "reboot" || arrtemp1 = command . "restart")
			{
				if (part2 = "-f")
				{
					Shutdown, 6
				} else {
					Shutdown, 2
				}
			} else if (arrtemp1 = command . "hibernate")
			{
				if (part2 = "-f")
				{
					DllCall("PowrProf\SetSuspendState", "int", 1, "int", 1, "int", 0)
				} else {
					DllCall("PowrProf\SetSuspendState", "int", 1, "int", 0, "int", 0)
				}
			} else if (arrtemp1 = command . "suspend" || arrtemp1 = command . "sleep")
			{
				if (part2 = "-f")
				{
					DllCall("PowrProf\SetSuspendState", "int", 0, "int", 1, "int", 0)
				} else {
					DllCall("PowrProf\SetSuspendState", "int", 0, "int", 0, "int", 0)
				}
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
	
	makeBar(mon, w, h, x, y)
	{
		global
		local active, centerborder1, centerborder2, center, left, right, leftlen, rightlen, center, centerlen, shift, borderoff, tempheight
		
		active := barlayout%mon%
		left_%mon% := 0
		right_%mon% := 0
		center_%mon% := 0
		centerborder1 := InStr(active, "[")
		centerborder2 := InStr(active, "]")
		StringMid, left, active, centerborder1,, L
		StringMid, right, active, centerborder2
		StringLen, leftlen, left
		StringLen, rightlen, right
		StringTrimLeft, center, active, %leftlen%
		StringTrimRight, center, center, %rightlen%
		StringLen, centerlen, center
		
		StringSplit, left, left, %A_Space%
		determine(mon, w, h, x, y, "left", left0)
		
		StringSplit, right, right, %A_Space%
		determine(mon, w, h, x, y, "right", right0)
		
		StringSplit, center, center, %A_Space%
		determine(mon, w, h, x, y, "center", center0)
		
		if (mon = 1)
		{
			border := 2
			shift := Mon1Width - 31 + border
			borderoff := -1 * border
			tempheight := barheight1 + (2 * border)
			Gui, bar1:Add, Text, vText Hidden x6 y%downShift% w26 h%barheight1%, Run:
			Gui, bar1:Add, Edit, vRun Hidden Limit x31 y%borderoff% h%tempheight% w%shift%
		}
	return
	}
	
	determine(mon, w, h, x, y, pos, repeat)
	{
		global
		local testcal, testwork, testclock
		
		Loop, %repeat%
		{
			testclock := InStr(%pos%%A_Index%, "clock(")
			testcal := InStr(%pos%%A_Index%, "cal(")
			testwork := InStr(%pos%%A_Index%, "work(")
			
			if (testclock != 0)
			{
				clock(mon, w, h, x, y, pos)
			} else if (testcal != 0)
			{
				cal(mon, w, h, x, y, pos)
			} else if (testwork != 0)
			{
				work(mon, w, h, x, y, pos)
			}
		}
	return
	}
	
	clock(mon, w, h, x, y, pos)
	{
		global
		local clockSize, temp
		
		if (pos != "center")
		{
			clockSize := Fnt_GetStringWidth(font, "00.00")
			if (pos = "left")
			{
				temp := %pos%_%mon%
			} else if (pos = "right")
			{
				temp := w - %pos%_%mon% - clockSize
			}
		} else {
			clockSize := (w - left_%mon% - right_%mon%) / center0
			temp := left_%mon% + center_%mon%
		}
		Gui, bar%mon%:Add, Text, vClock%mon% x%temp% y%downShift% h%h% w%clockSize% Center, 00.00
		%pos%_%mon% += clockSize
		if (clockOn = 0)
		{
			SetTimer, UpdateClock, %updaterate%
			Gosub, UpdateClock
		}
	return
	}
	
	cal(mon, w, h, x, y, pos)
	{
		global
		local dateSize, temp
		
		if (pos != "center")
		{
			dateSize := Fnt_GetStringWidth(font, "000, 000 00")
			if (pos = "left")
			{
				temp := %pos%_%mon%
			} else if (pos = "right")
			{
				temp := w - %pos%_%mon% - dateSize
			}
		} else {
			dateSize := (w - left_%mon% - right_%mon%) / center0
			temp := left_%mon% + center_%mon%
		}
		Gui, bar%mon%:Add, Text, vDate%mon% x%temp% y%downShift% h%h% w%dateSize% Center, 000, 000 00
		%pos%_%mon% += dateSize
		if (clockOn = 0)
		{
			SetTimer, UpdateClock, %updaterate%
			Gosub, UpdateClock
		}
	return
	}
	
	work(mon, w, h, x, y, pos)
	{
		global
		local workSize, temp, work
		
		work := workspace%mon%
		if (pos != "center")
		{
			workSize := Fnt_GetStringWidth(font, "00000000")
			if (pos = "left")
			{
				temp := %pos%_%mon%
			} else if (pos = "right")
			{
				temp := w - %pos%_%mon% - workSize
			}
		} else {
			workSize := (w - left_%mon% - right_%mon%) / center0
			temp := left_%mon% + center_%mon%
		}
		Gui, bar%mon%:Add, Text, vTitle%mon% x%temp% y%downShift% w%workSize% h%h% Center, % workname%mon%%work%
		%pos%_%mon% += workSize
	return
	}
	