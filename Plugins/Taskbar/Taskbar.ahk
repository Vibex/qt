initializeBar(mon, w, h, x, y){
	global
	
	Gui, Margin, 0, 0
	if(taskColour != "auto"){
		Gui, bar%mon%:Color, %taskColour%, %taskColour%
	}
	Gui, bar%mon%:+LastFound -Caption +ToolWindow
	Gui, bar%mon%:Font, s%fontSize% c%fontColour%, %font%
	
	makeBar(mon, w, h, x, y)
	Gosub, UpdateClock
	Gui, bar%mon%:Show, x%x% y%y% w%w% h%h%
	barid%mon% := WinExist("A")
	return
}

#Space::
{
	visibility()
	return
}

^#Space::
{
	visibility(0, 1, 1)
	return
}

visibility(hide = 0, switch = 1, clip := 0){
	global
	local visible
	
	GuiControlGet, visible, bar1:Visible, Run
	if(visible = 1 || hide = 1){
		GuiControl, bar1:, Run,
		GuiControl, bar1:Hide, Run
		GuiControl, bar1:Hide, Text
		GuiControl, bar1:Show, Work1
		GuiControl, bar1:Show, Date1
		GuiControl, bar1:Show, Clock1
		GuiControl, bar1:Show, Text1
		if(switch = 1){
			WinActivate, ahk_id %previd%
		}
	} else {
		previd := WinExist("A")
		GuiControl, bar1:Hide, Work1
		GuiControl, bar1:Hide, Date1
		GuiControl, bar1:Hide, Clock1
		GuiControl, bar1:Hide, Text1
		GuiControl, bar1:Show, Run
		if(clip = 1){
			GuiControl, bar1:, Run, %clipboard%
		}
		GuiControl, bar1:Show, Text
		GuiControl, bar1:Focus, Run
		WinActivate, ahk_id %barid1%
	}
	return
}

barActive(){
	global
	temp:= WinExist("A")
    return (temp = barid1)
}

#If barActive()
Enter::
{
	Gui, Submit, NoHide
	GuiControlGet, Run, bar1:
	if(Run = null){
		return
	}
	StringSplit, arrtemp, Run , %A_Space%
	part2 := arrtemp2
	Loop, %arrtemp0%
	{
		x := A_Index + 2 
		if(A_Index + 2 > arrtemp0){
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
		if(arrtemp1 = command . "qt.pi"){
			isRun := "https://github.com/Vibex/qt.pi"
		} else if(arrtemp1 = command . "google" || arrtemp1 = command . "g"){
			StringReplace, part2, part2, %A_Space%, +, 1
			isRun := "https://www.google.com/search?q=" . part2
		} else if(arrtemp1 = command . "duckduckgo" || arrtemp1 = command . "d"){
			StringReplace, part2, part2, %A_Space%, +, 1
			isRun := "https://duckduckgo.com/?q=" . part2
		} else if(arrtemp1 = command . "hummingbird" || arrtemp1 = command . "h"){
			StringReplace, part2, part2, %A_Space%, +, 1
			isRun := "http://hummingbird.me/search?query=" . part2
		} else if(arrtemp1 = command . "wikipedia" || arrtemp1 = command . "wiki" || arrtemp1 = command . "w"){
			StringReplace, part2, part2, %A_Space%, +, 1
			isRun := "https://en.wikipedia.org/w/index.php?title=Special%3ASearch&profile=default&search=" . part2 . "&fulltext=Search"
		} else if(arrtemp1 = command . "nyaa" || arrtemp1 = command . "n"){
			StringReplace, part2, part2, %A_Space%, +, 1
			isRun := "http://www.nyaa.eu/?page=search&cats=0_0&filter=0&term=" . part2
		} else if(arrtemp1 = command . "animebyt" || arrtemp1 = command . "a"){
			StringReplace, part2, part2, %A_Space%, +, 1
			isRun := "https://animebytes.tv/torrents.php?searchstr=" . part2
		} else if(arrtemp1 = command . "piratebay" || arrtemp1 = command . "p"){
			isRun := "http://thepiratebay.sx/search/" . part2 . "/0/99/0"
		} else if(arrtemp1 = command . "logoff"){
			if(part2 = "-f"){
				Shutdown, 4
			} else {
				Shutdown, 0
			}
		} else if(arrtemp1 = command . "shutdown"){
			if(part2 = "-f"){
				Shutdown, 5
			} else {
				Shutdown, 1
			}
		} else if(arrtemp1 = command . "reboot" || arrtemp1 = command . "restart"){
			if(part2 = "-f"){
				Shutdown, 6
			} else {
				Shutdown, 2
			}
		} else if(arrtemp1 = command . "hibernate"){
			if(part2 = "-f"){
				DllCall("PowrProf\SetSuspendState", "int", 1, "int", 1, "int", 0)
			} else {
				DllCall("PowrProf\SetSuspendState", "int", 1, "int", 0, "int", 0)
			}
		} else if(arrtemp1 = command . "suspend" || arrtemp1 = command . "sleep"){
			if(part2 = "-f"){
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
		if(isRun = null){
			defaultSearch()
		}
	}
	if(isRun != null){
		run, %isRun%
	}
	visibility()
	return
}

defaultSearch(){
	global
	StringMid, part2, Run, %mode%
	StringReplace, part2, part2, %A_Space%, +, 1
	if(defsearch = 2){
		isRun := "https://duckduckgo.com/?q=" . part2
	} else {
		isRun := "https://www.google.com/search?q=" . part2
	}
	return
}

makeBar(mon, w, h, x, y){
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
	
	StringSplit, left, left, &
	determine(mon, w, h, x, y, "left", left0)
	
	StringSplit, right, right, &
	determine(mon, w, h, x, y, "right", right0)
	
	StringSplit, center, center, &
	determine(mon, w, h, x, y, "center", center0)
	
	if(mon = 1){
		border := 2
		shift := w - 31 + border
		borderoff := -1 * border
		tempheight := barheight + (2 * border)
		Gui, bar1:Add, Text, vText Hidden x6 y%downShift% w26 h%barheight%, Run:
		Gui, bar1:Add, Edit, vRun Hidden Limit x31 y%borderoff% h%tempheight% w%shift%
	}
	return
}

determine(mon, w, h, x, y, pos, repeat){
	global
	local temp, place, cmd
	
	Loop, %repeat%
	{
		temp := %pos%%A_Index%
		place := InStr(temp, "(")
		
		if(place != 0){
			place -= 1
			StringLeft, cmd, temp, %place%
			StringReplace, temp, temp, %cmd%(
			StringReplace, temp, temp, )
			%cmd%(mon, w, h, x, y, pos, temp)
		}
	}
	return
}


;Taskbar Items --------------------------------------------------------------------------------------------------------------------------------------------


clockT(mon, w, h, x, y, pos, input){
	global
	local size, temp
	
	if(pos != "center"){
		size := Fnt_GetStringWidth(font, "00.00")
		if(pos = "left"){
			temp := %pos%_%mon%
		} else if(pos = "right"){
			temp := w - %pos%_%mon% - size
		}
	} else {
		size := (w - left_%mon% - right_%mon%) / center0
		temp := left_%mon% + center_%mon%
	}
	Gui, bar%mon%:Add, Text, vClock%mon% x%temp% y%downShift% h%h% w%size% Center, 00.00
	%pos%_%mon% += size
	if(clockOn = 0){
		SetTimer, UpdateClock, %updateRate%
		Gosub, UpdateClock
	}
	return
}

calT(mon, w, h, x, y, pos, input){
	global
	local size, temp
	
	if(pos != "center"){
		size := Fnt_GetStringWidth(font, "000, 000 00")
		if(pos = "left"){
			temp := %pos%_%mon%
		} else if(pos = "right"){
			temp := w - %pos%_%mon% - size
		}
	} else {
		size := (w - left_%mon% - right_%mon%) / center0
		temp := left_%mon% + center_%mon%
	}
	Gui, bar%mon%:Add, Text, vDate%mon% x%temp% y%downShift% h%h% w%size% Center, 000, 000 00
	%pos%_%mon% += size
	if(clockOn = 0){
		SetTimer, UpdateClock, %updateRate%
		Gosub, UpdateClock
	}
	return
}

UpdateClock:
{
	clockOn := 1
	GuiControlGet, clock, bar1:, Clock1, Text
	GuiControlGet, date, bar1:, Date1, Text
	Loop, %monNum%
	{
		if(clock != A_Hour . "." . A_Min){
			GuiControl, bar%A_Index%:, Clock%A_Index%, %A_Hour%.%A_Min%
		}
		if(date != A_DDDD . ", " . A_MMMM . " " . A_DD){
			GuiControl, bar%A_Index%:, Date%A_Index%, %A_DDD%, %A_MMM% %A_DD%
		}
	}
	return
}

workT(mon, w, h, x, y, pos, input){
	global
	local size, temp, work
	
	if(input = "full"){
		work%mon%Mode := "full"
		size := Fnt_GetStringWidth(font, " 1 2 3 4 5 6 7 8 9")
	} else {
		work%mon%Mode := "single"
		size := Fnt_GetStringWidth(font, " 0 ")
	}
	if(pos != "center"){
		if(pos = "left"){
			temp := %pos%_%mon%
		} else if(pos = "right"){
			temp := w - %pos%_%mon% - workSize
		}
	} else {
		size := (w - left_%mon% - right_%mon%) / center0
		temp := left_%mon% + center_%mon%
	}
	if(work%mon%Mode = "full"){
		Gui, bar%mon%:Add, Text, vWork%mon% x%temp% y%downShift% w%size% h%h% Center, # 2 3 4 5 6 7 8 9
	} else {
		Gui, bar%mon%:Add, Text, vWork%mon% x%temp% y%downShift% w%size% h%h% Center, 1
	}
	%pos%_%mon% += size
	if(workOn = 0){
		SetTimer, UpdateWork, %updateRate%
		Gosub, UpdateWork
	}
	return
}

UpdateWork:
{	
	workOn := 1
	Loop, %monNum%
	{
		mon := A_Index
		GuiControlGet, work, bar%mon%:, work%mon%, Text
		if(work%mon%Mode = "full"){
			temp := A_Space
			Loop, 9
			{
				if(A_Index = Mon%mon%.workspace){
					temp := temp . "#"
				} else {
					temp := temp . A_Index
				}
				temp := temp . " "
			}
			if(work != temp){
				GuiControl, bar%mon%:, Work%mon%, %temp%
			}
		} else {
			
		}
	}
	return
}

textT(mon, w, h, x, y, pos, input){
	global
	local size, temp
	
	if(pos != "center"){
		size := Fnt_GetStringWidth(font, input)
		if(pos = "left"){
			temp := %pos%_%mon%
		} else if(pos = "right"){
			temp := w - %pos%_%mon% - size
		}
	} else {
		size := (w - left_%mon% - right_%mon%) / center0
		temp := left_%mon% + center_%mon%
	}
	Gui, bar%mon%:Add, Text, vText%mon% x%temp% y%downShift% w%size% h%h% Center, % input
	%pos%_%mon% += size
	return
}


;Config Methods --------------------------------------------------------------------------------------------------------------------------------------------

taskEnable(temp){
	global
	
	clockOn := 0
	workOn := 0
	updateRate := 100
	
	font := "uushi"
	fontSize := 6
	fontColour := "000000"
	
	barheight := 15
	downShift := 0
	taskColour := "auto"
	
	Loop, %monNum%
	{
		barLayout%A_Index% := "workT(Full)&[]&clockT()"
	}
	
	command := "/"
	defSearch := 1
	progloc := "C:"
	return
}

taskFont(temp){
	global
	
	StringSplit, temp, temp ,`,
	font := temp1
	fontSize := temp2
	fontColour := temp3
	return
}

taskOption(temp){
	global
	
	StringSplit, temp, temp ,`,
	barheight := temp1
	downShift := temp2
	taskColour := temp3
	return
}

taskLayout(temp){
	global
	
	StringSplit, temp, temp ,`,
	barLayout%temp1% := temp2
	return
}

taskCommand(temp){
	global
	
	StringSplit, temp, temp ,`,
	command := temp1
	defSearch := temp2
	progloc := temp3
	return
}

taskRun(temp){
	global
	
	StringSplit, otherexe, temp ,`,
	return
}

taskActivate(temp){
	global
	
	Loop, %monNum%
	{
		SysGet, mon, Monitor, %A_Index%
		initializeBar(A_Index, monRight - monLeft, barheight, monLeft, monTop)
		tTask%A_Index% += barheight
	}
	return
}