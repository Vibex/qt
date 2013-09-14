	;If you know what you are doing with AHK feel free to play with the methods below. I've left comments on things that you may want to play with. I have also added a description of each methods function. I can guarantee if you know anything about AHK or code programming practices you will have an aneurysm reading my code. Eventually I will get a round to cleaning it all up and optimizing it more. Right now I'm more focused on features and functionality.
	
	DeathToTheScript:
	{
		SetBatchLines, -1
		DetectHiddenWindows, Off
		if (A_ExitReason != "Shutdown" && A_ExitReason != "Logoff")
		{
			WinShow, ahk_group allhiden
		}
		if(A_ExitReason != "Shutdown" && A_ExitReason != "Logoff" && A_ExitReason != "reload")
		{
			WinGet, winarr ,List
			Loop, %winarr%
			{
				idtemp := winarr%A_Index%
				WinGetClass, class, ahk_id %idtemp%
				if (exclusion(class) = 1)
				{
					titleBeGone(idtemp, 3)
				}
				trans(idtemp, 255)
			}
		}
	ExitApp
	Sleep 1000
	}
	
	winConfine:
	{
		SetBatchLines, -1
		WinGetPos, xtemp, ytemp, wtemp, htemp, A
		MouseGetPos,mxtemp,mytemp
		if (mxtemp > xtemp + wtemp)
		{
			x := xtemp + wtemp
		} else if (mxtemp < xtemp)
		{
			x := xtemp
		} else {
			x := mxtemp
		}
		if (mytemp < ytemp)
		{
			y := ytemp
		} else if (mytemp > ytemp + htemp)
		{
			y := ytemp + htemp
		} else {
			y := mytemp
		}
		MouseMove, x, y, 0
	return
	}
	
	ShellMessage(wParam, lParam)
	{
		;This detects messages sent by windows itself and preforms actions based on the messages.
		global previousid,  currentid,  autocenter,  titlebaraway,  baryeah,  tranthresh,  nonactivetrans,  barid1
		
		SetBatchLines, -1
		WinGetTitle, title, ahk_id %lParam%
		WinGetClass, class , ahk_id %lParam%
		If (wParam = 1)
		{
			;Window created
			if (autocenter != 0 && Title != "Adobe Flash Player")
			{
				WinGet, id, id, ahk_group allhiden
				if (id != lParam)
				{
					Center(autocenter, lParam)
				}
			}
			if (titlebaraway = 1)
			{
				titleBeGone(lParam, 2)
			}
			if (nonactivetrans != 255)
			{
				trans(lParam, nonatcivetrans)
			}
		return
		}
		If (wParam = 4)
		{
			;Window active
			WinGet, tran, Transparent, ahk_id %lParam%
			if (tran <= tranthresh)
			{
				trans(lParam, 255)
			}
			if (lParam != currentid)
			{
				previousid := currentid
				currentid := lParam
			}
			if (nonactivetrans != 255)
			{
				trans(currentid, 255)
				trans(previousid, nonactivetrans)
			}
		return
		}
	return
	}
	
	reload(math = 1)
	{
		;This loads all of the information from the config files.
		global
		local temp, temp2, temp3, x
		
		SetBatchLines, -1
		;The location of the config files.
		config := "Data\config.txt"
		
		tranthresh := 0
		custran := 85
		nonactivetrans := 255
		
		
		dis1 := 0
		dis2 := 0
		dis3 := 0
		
		SysGet, MonNum, MonitorCount
		Loop, %MonNum%
		{
			SysGet, Temp%A_Index%, Monitor, %A_Index%
			if (Temp%A_Index%Left = 0)
			{
				temp2 := 1
			} else if (Temp%A_Index%Left < 0)
			{
				temp2 := 2
			} else {
				temp2 := 3
			}
			SysGet, Mon%temp2%, Monitor, %A_Index%
			Mon%temp2%Width := Mon%temp2%Right - Mon%temp2%Left
			Mon%temp2%Height := Mon%temp2%Bottom - Mon%temp2%Top
			dis%temp2% := 1
		}	

		FileReadLine, baryeah, %config%, 128
		
		FileReadLine, row1, %config%, 10
		FileReadLine, col1, %config%, 13
		
		FileReadLine, tbar1, %config%, 74
		FileReadLine, bbar1, %config%, 77
		FileReadLine, rbar1, %config%, 80
		FileReadLine, lbar1, %config%, 83
		
		FileReadLine, hbor, %config%, 33
		FileReadLine, vbor, %config%, 36
		FileReadLine, hborex, %config%, 39
		FileReadLine, vborex, %config%, 42
		
		FileReadLine, barheight1, %config%, 155
		if (barheight1 = 0)
		{
			barheight1 := Fnt_GetFontHeight(font)
		}
		
		if (dis2 = 1)
		{
			FileReadLine, row2, %config%, 17
			FileReadLine, col2, %config%, 20
			
			FileReadLine, tbar2, %config%, 87
			FileReadLine, bbar2, %config%, 90
			FileReadLine, rbar2, %config%, 93
			FileReadLine, lbar2, %config%, 96
			
			FileReadLine, hbor2, %config%, 46
			FileReadLine, vbor2, %config%, 49
			FileReadLine, hborex2, %config%, 52
			FileReadLine, vborex2, %config%, 55
			
			FileReadLine, barheight2, %config%, 158
			if (barheight2 = 0)
			{
				barheight2 := Fnt_GetFontHeight(font)
			}
		}
		
		if (dis3 = 1)
		{
			FileReadLine, row3, %config%, 24
			FileReadLine, col3, %config%, 27
			
			FileReadLine, tbar3, %config%, 100
			FileReadLine, bbar3, %config%, 103
			FileReadLine, rbar3, %config%, 106
			FileReadLine, lbar3, %config%, 109
			
			FileReadLine, hbor3, %config%, 59
			FileReadLine, vbor3, %config%, 62
			FileReadLine, hborex3, %config%, 65
			FileReadLine, vborex3, %config%, 68
			
			FileReadLine, barheight3, %config%, 161
			if (barheight3 = 0)
			{
				barheight3 := Fnt_GetFontHeight(font)
			}
		}
		
		if (baryeah = 1)
		{
			Loop, 3
			{
				tbar%A_Index% += barheight%A_Index%
			}
		}
		
		FileReadLine, hspeed, %config%, 117
		FileReadLine, vspeed, %config%, 120
		
		if (baryeah = 1)
		{
			FileReadLine, updateRate, %config%, 134
			FileReadLine, font, %config%, 140
			FileReadLine, fontsize, %config%, 143
			FileReadLine, texColour, %config%, 146
			FileReadLine, barColour, %config%, 149
			FileReadLine, downShift, %config%, 152
			
			FileReadLine, command, %config%, 168
			FileReadLine, defsearch, %config%, 171
			FileReadLine, progloc, %config%, 174
			FileReadLine, otherexe, %config%, 177
			if (otherexe != null)
			{
				StringSplit, otherexe, otherexe, `,
			} else {
				otherexe0 := 1
				otherexe1 := null	
			}
			
			Loop, 3
			{
				if (A_Index = 1)
				{
					temp3 := 183
				} else if (A_Index = 2)
				{
					temp3 := 186
				} else {
					temp3 := 189
				}
				
				FileReadLine, workname%A_Index%, %config%, %temp3%
				if (workname%A_Index% != null)
				{
					StringSplit, workname%A_Index%, workname%A_Index%, `,
				} else {
					workname%A_Index%0 := 3
					workname%A_Index%1 := 1
					workname%A_Index%2 := 2
					workname%A_Index%3 := 3
				}
			}
			
			FileReadLine, barlayout1, %config%, 196
			FileReadLine, barlayout2, %config%, 199
			FileReadLine, barlayout3, %config%, 202
		}
		
		FileReadLine, enablesound, %config%, 210
		if (enablesound = 1)
		{
			FileReadLine, vol, %config%, 213
			vold := vol * -1
			FileReadLine, enablebeep, %config%, 216
			if (enablebeep = 1)
			{
				FileReadLine, freq, %config%, 219
				FileReadLine, dura, %config%, 222
			}
		}	
		
		FileReadLine, titlebaraway, %config%, 228
		
		FileReadLine, autocenter, %config%, 234
		
		FileReadLine, winHook, %config%, 242
		
		FileReadLine, exclude, %config%, 248
		if (exclude != null)
		{
			StringSplit, exclusion, exclude, `,
		} else {
			exclusion0 := 1
			exclusion1 := null	
		}
		
		FileReadLine, bspeed, %config%, 254
		if (bspeed = "WARP DRIVE")
		{
			bspeed := -1
		}
		FileReadLine, wspeed, %config%, 257
		if (wspeed = "WARP DRIVE")
		{
			wspeed := -1
		}
		FileReadLine, kspeed, %config%, 260
		if (kspeed = "WARP DRIVE")
		{
			kspeed := -1
		}
		FileReadLine, cspeed, %config%, 263
		if (cspeed = "WARP DRIVE")
		{
			cspeed := -1
		}
		
		FileReadLine, titleFix, %config%, 269
		
		FileReadLine, RowSize1, %config%, 275
		FileReadLine, ColSize1, %config%, 278
		
		FileReadLine, RowSize2, %config%, 281
		FileReadLine, ColSize2, %config%, 284
		
		FileReadLine, RowSize3, %config%, 287
		FileReadLine, ColSize3, %config%, 290
		
		FileReadLine, noedge, %config%, 296
		FileReadLine, nonactivetrans, %config%, 299
		
		if (noedge != 0)
		{
			hbor := -1 * noedge
			vbor := -1 * noedge
			hborex := noedge
			vborex := noedge
		}
		
		if (math = 1)
		{
			math()
		}
	return
	}
	
	math()
	{
		;This preforms some random math to determine some values.
		global
		
		mathValues(1)
		if (dis2 = 1)
		{
			mathValues(2)
		}
		if (dis3 = 1)
		{
			mathValues(3)
		}
	return
	}
	
	mathValues(mon)
	{
		global
		local result, temp1
		
		Mon%mon%CusWidth := (Mon%mon%Width - hbor - (col%mon% * hbor) - hborex - hborex - lbar%mon% - rbar%mon%)
		Mon%mon%CusHeight := (Mon%mon%Height - vbor - (row%mon% * vbor) - vborex - vborex - tbar%mon% - bbar%mon%)
		
		if (rowsize%mon% = 0)
		{
			Loop, 3
			{
				row%mon%%A_Index% := Mon%mon%CusHeight / row%mon%
				if (A_Index = 1)
				{
					result := mod(row%mon%1, 1)				
					if (result != 0)
					{
						Row%mon%1 += 1
					}
				}
			}
		} else {
			temp1 := row%mon% - 1
			Row%mon%1 := rowsize%mon%
			if (temp1 > 1)
			{
				Row%mon%2 := (Mon%mon%CusHeight - row%mon%1) / 2
				Row%mon%3 := (Mon%mon%CusHeight - row%mon%1) / 2
				result := mod(row%mon%2, 1)				
				if (result != 0)
				{
					Row%mon%1 += 1
				}
			} else {
				Row%mon%2 := Mon%mon%CusHeight - row%mon%1
				Row%mon%3 := 0
			}
		}
		if (colsize%mon% = 0)
		{
			Loop, 3
			{
				col%mon%%A_Index% := Mon%mon%CusWidth / col%mon%
				if (A_Index = 1)
				{
					result := mod(col%mon%1, 1)				
					if (result != 0)
					{
						Col%mon%1 += 1
					}
				}	
			}
		} else {
			temp1 := col%mon% - 1
			col%mon%1 := colsize%mon%
			if (temp1 > 1)
			{
				Col%mon%2 := (Mon%mon%CusWidth - col%mon%1) / 2
				Col%mon%3 := (Mon%mon%CusWidth - col%mon%1) / 2
				result := mod(Col%mon%2, 1)				
				if (result != 0)
				{
					Col%mon%1 += 1
				}
			} else {
				Col%mon%2 := Mon%mon%CusWidth - Col%mon%1
				Col%mon%3 := 0
			}
		}
	return
	}
	
	allWindowEffect()
	{
		global
		local winarr, idtemp, class
		
		DetectHiddenWindows, Off
		WinGet, winarr ,List
		Loop, %winarr%
		{
			idtemp := winarr%A_Index%
			WinGetClass, class, ahk_id %idtemp%
			if (exclusion(class) = 1)
			{
				if (titlebaraway = 1)
				{
					titleBeGone(idtemp, 2)
				}
				trans(idtemp, nonactivetrans)
			}
		}
	return
	}
	
	autoShift()
	{
		;This will automatically shift your window grid when the script is called.
		global
		local mon, temp
		
		mon := 0
		Loop, 3
		{
			mon := mon + 1
			if (us%mon% > 0)
			{
				temp := us%mon%
				Loop, %temp%
				{
					shiftBorder("u", mon)
				}
			}
			if (ds%mon% > 0)
			{
				temp := ds%mon%
				Loop, %temp%
				{
					shiftBorder("d", mon)
				}
			}
			if (rs%mon% > 0)
			{
				temp := rs%mon%
				Loop, %temp%
				{
					shiftBorder("r", mon)
				}
			}
			if (ls%mon% > 0)
			{
				temp := ls%mon%
				Loop, %temp%
				{
					shiftBorder("l", mon)
				}
			}
		}
	return
	}
	
	getMon(pos)
	{
		global
		
		if (pos >= Mon1Left && pos < Mon1Right)
		{
			return 1
		} else if (pos < Mon1Left && dis2 = 1)
		{
			return 2
		} else if (pos >= Mon1Right && dis3 = 1)
		{
			return 3
		}
		return 0
	}
	
	findPos(mon, x, y)
	{
		;This determines the grid parameters to use.
		global
		
		if (x = 1)
		{
			rrow := row%mon%1
		}
		if (x = 2)
		{
			rrow := row%mon%2
		}
		if (x = 3)
		{
			rrow := row%mon%3
		}
		if (y = 1)
		{
			rcol := col%mon%1
		}
		if (y = 2)
		{
			rcol := col%mon%2
		}
		if (y = 3)
		{
			rcol := col%mon%3
		}
	return
	}
	
	setId(mon, work, id, row, col)
	{
		;This sets the id to the grid.
		global
		
		mon%mon%_%work%_%row%_%col% := id
	return
	}
	
	grid(row, col)
	{
		;This resizes the grid to a new row by col value.
		global
		local mon, pos
		
		MouseGetPos, pos
		mon := getMon(pos)
		row%mon% := row
		col%mon% := col
		math()
		autoShift()
	return
	}
	
	remove(id, all = 0)
	{
		;Removes the window from the grid (or all items if all = 1).
		global
		local x, y, mon, work
		
		x := 0
		Loop, 3
		{
			x += 1
			y := 0
			Loop, 3
			{
				y += 1
				mon := 0
				Loop, 3
				{
					mon += 1
					work := 0
					Loop, 3
					{
						work += 1
						if (mon%mon%_%work%_%x%_%y% = id ||  mon%mon%_%work%_%x%_%y% = full . id || all != 0)
						{
							mon%mon%_%work%_%x%_%y% := null
						}
					}
				}
				if (mon%x%_%y%_center = id || all = 1)
				{
					mon%x%_%y%_center := null
				}
				if (mon%x%_%y%_Left = id || all = 1)
				{
					mon%x%_%y%_Left := null
				}
				if (mon%x%_%y%_Right = id || all = 1)
				{
					mon%x%_%y%_Right := null
				}
				if (mon%x%_%y%_Full = id || all = 1)
				{
					idtemp := mon%x%_%y%_Full
					WinSet, Style, +0x40000, ahk_id %idtemp%
					mon%x%_%y%_Full := null
				}
			}
		}
	return
	}
	
	shiftBorder(direc, nowin = 0)
	{
		;This does the border shifting.
		global
		local xtemp, mon
		
		id := null
		if (nowin = 0)
		{
			id := WinExist("A")
		}
		
		mon := 0
		if (id != null)
		{
			WinGetPos, xtemp,,,, ahk_id %id%
			mon := getMon(xtemp)
		} else {
			mon := nowin
		}
		if (mon != 0)
		{
			if (direc = "u")
			{
				row%mon%1 := row%mon%1 - vspeed
				if (row%mon% = 3)
				{
					row%mon%2 := row%mon%2 + (vspeed/2)
					row%mon%3 := row%mon%3 + (vspeed/2)
				} else {
					row%mon%2 := row%mon%2 + vspeed
				}
			}
			if (direc = "d")
			{
				row%mon%1 := row%mon%1 + vspeed
				if (row%mon% = 3)
				{
					row%mon%2 := row%mon%2 - (vspeed/2)
					row%mon%3 := row%mon%3 - (vspeed/2)
				} else {
					row%mon%2 := row%mon%2 - vspeed
				}
			}
			if (direc = "l")
			{
				col%mon%1 := col%mon%1 - hspeed
				if (col%mon% = 3)
				{
					col%mon%2 := col%mon%2 + (hspeed/2)
					col%mon%3 := col%mon%3 + (hspeed/2)
				} else {
					col%mon%2 := col%mon%2 + hspeed
				}
			}
			if (direc = "r")
			{
				col%mon%1 := col%mon%1 + hspeed
				if (col%mon% = 3)
				{
					col%mon%2 := col%mon%2 - (hspeed/2)
					col%mon%3 := col%mon%3 - (hspeed/2)
				} else {
					col%mon%2 := col%mon%2 - hspeed
				}
			}
			if (nowin = 0)
			{
				auto(mon)
			}
		}
	return
	}
	
	cord(mon, id)
	{
		;Finds the grid position.
		global
		local x, y, work
		
		work := workspace%mon%
		x := 0
		Loop, 3
		{
			x += 1
			y := 0
			Loop, 3
			{
				y += 1
				if (id = mon%mon%_%work%_%x%_%y%)
				{
					rx := x
					ry := y
				return
				}
			}
		}
		rx := 0
		ry := 0
	return
	}
	
	sound(direc)
	{
		;Changes the system sound (if nircmd.exe is installed).
		global
		
		if (enablesound = 1)
		{
			if (enablebeep = 1)
			{
				SoundBeep, %freq%, %dura%
			}
			if (direc = "u")
			{
				run nircmd.exe changesysvolume %vol%
			return
			}
			if (direc = "d")
			{
				run nircmd.exe changesysvolume %vold%
			return
			}
			if (direc = "m")
			{
				run nircmd.exe mutesysvolume 2
			}
		}
	return
	}
	
	titleBeGone(id, mode = 1, titleFixMode = 0)
	{
		;Controls the titlebar on the window. The way it does this is based on the mode.
		global
		
		WinSet, Style, -0x800000, ahk_id %id%
		if (mode = 1)
		{
			WinSet, Style, ^0xC00000, ahk_id %id%
		} else if (mode = 2)
		{
			WinSet, Style, -0xC00000, ahk_id %id%
		} else if (mode = 3)
		{
			WinSet, Style, +0xC00000, ahk_id %id%
			WinSet, Style, +0x40000, ahk_id %id%
		}
		
		redraw(id, titleFixMode)
	return
	}
	
	redraw(id, titleFixMode = 0)
	{
		global
		local widthtemp
		
		WinSet, Redraw,, ahk_id %id%
		if (titleFixMode = 0)
		{
			titleFixMode := titleFix
		}
		
		if (titleFixMode = 1)
		{
			WinGetPos,,, widthtemp,, ahk_id %id%
			WinMove, ahk_id %id%,,,, (widthtemp - 1)
			WinMove, ahk_id %id%,,,, (widthtemp)
		return
		} else if (titleFixMode = 2)
		{
			WinMinimize, ahk_id %id%
			WinActivate, ahk_id %id%
			WinRestore, ahk_id %id%
		}
	return
	}
	
	trans(id, direc)
	{
		;This controls the transparency on windows.
		global custran
		
		if (id = null)
		{
			id := WinExist("A")
		}
		WinGet, tran, Transparent, ahk_id %id%
		if direc is not integer
		{
			if (direc = "u")
			{
				newtrans := tran + custran
			} else if (direc = "d")
			{
				newtrans := tran - custran
			}
		} else {
			newtrans := direc
		}
		WinSet, Transparent, %newtrans%, ahk_id %id%
	return
	}
	
	workspaceSwitch(workspace = 0)
	{
		global
		local xtemp, mon, z, x, y
		
		MouseGetPos,xtemp,,
		mon := getMon(xtemp)
		
		if (mon != 0 && workspace != workspace%mon%)
		{
			z := workspace%mon%
			x := 0
			Loop, 3
			{
				x += 1
				y := 0
				Loop, 3
				{
					y += 1
					idtemp := Mon%mon%_%z%_%x%_%y%
					GroupAdd, allhiden, ahk_id %idtemp%
					WinHide, ahk_id %idtemp%
				}
			}
			idtemp := Mon%mon%_%z%_center
			GroupAdd, allhiden, ahk_id %idtemp%
			WinHide, ahk_id %idtemp%
			
			idtemp := Mon%mon%_%z%_full
			GroupAdd, allhiden, ahk_id %idtemp%
			WinHide, ahk_id %idtemp%
			
			idtemp := Mon%mon%_%z%_Left
			GroupAdd, allhiden, ahk_id %idtemp%
			WinHide, ahk_id %idtemp%
			
			idtemp := Mon%mon%_%z%_Right
			GroupAdd, allhiden, ahk_id %idtemp%
			WinHide, ahk_id %idtemp%
			
			if (workspace = 0)
			{
				if (workspace%mon% != 3)
				{
					workspace%mon% := workspace%mon% + 1
				} else {
					workspace%mon% := 1
				}
			} else {
				workspace%mon% := workspace
			}
			
			z := workspace%mon%
			x := 0
			Loop, 3
			{
				x += 1
				y := 0
				Loop, 3
				{
					y += 1
					idtemp := Mon%mon%_%z%_%x%_%y%
					WinShow, ahk_id %idtemp%
				}
			}
			idtemp := Mon%mon%_%z%_center
			GroupAdd, allhiden, ahk_id %idtemp%
			WinShow, ahk_id %idtemp%
			
			idtemp := Mon%mon%_%z%_full
			GroupAdd, allhiden, ahk_id %idtemp%
			WinShow, ahk_id %idtemp%
			
			idtemp := Mon%mon%_%z%_Left
			GroupAdd, allhiden, ahk_id %idtemp%
			WinShow, ahk_id %idtemp%
			
			idtemp := Mon%mon%_%z%_Right
			GroupAdd, allhiden, ahk_id %idtemp%
			WinShow, ahk_id %idtemp%
			
			updateTitle(mon)
		}
	return
	}
	
	mode(mode)
	{
		global
		local xtemp, mon1, mon2
		
		DetectHiddenWindows, Off
		
		MouseGetPos,xtemp,,
		mon1 := getMon(xtemp)
		
		Mon%mon1%_mode := mode
		if (mode = 1)
		{
			auto(mon1)
		} else {
			WinGet, winarr ,List
			Loop, %winarr%
			{
				idtemp := winarr%A_Index%
				WinGetPos, xtemp, ytemp, wtemp, htemp, ahk_id %idtemp%
				if (idtemp = barid1 || idtemp = barid2 || idtemp = barid3)
				{
					break
				}
				mon2 := getMon(xtemp)
				if (mon1 = mon2)
				{
					screenfill(mon1, 0)
				}
			}
		}
		
	return
	}
	
	functionKey(key)
	{
		global
		
		if (key = 1)
		{
			IfExist, README.exe
			{
				Run, README.exe
			} else IfExist, README.ahk
			{
				IfExist, README.txt
				{
					Run, README.ahk
				} else {
					Run, explore %A_WorkingDir%
				}
			} else {
				Run, explore %A_WorkingDir%
			}
		} else if (key = 2)
		{
			idtemp := WinExist("A")
			WinGetTitle, title, ahk_id %idtemp%
			InputBox, newName, Rename "%title%" - qt.pi, Rename the current window.`n(Curently custom fonts are not available in AHK input boxes. As soon as this is available`, I will implement it. Otherwise I will write a GUI to do this more nicely.),,,,,,,, %title%
			WinSetTitle, ahk_id %idtemp%,, %newName%
		} else if (key = 3)
		{
			;Will hide/show taskbar.
		} else if (key = 4)
		{
			ExitApp
		} else if (key = "A4")
		{
			idtemp := WinExist("A")
			if (idtemp = gidDEBUG) {
				MsgBox, Please use Win + `` to hide the debug window.
			} else if (idtemp = barid1 || idtemp = barid2 || idtemp = barid3)
			{
				MsgBox, You can disable the taskbars in the config files.
			} else {
				remove(idtemp)
				WinKill, ahk_id %idtemp%
			}
		} else if (key = 5)
		{
			Reload
			Sleep 1000
		} else if (key = 6)
		{
			
		} else if (key = 7)
		{
			
		} else if (key = 8)
		{
			DetectHiddenWindows, Off
			WinGet, winarr ,List
			Loop, %winarr%
			{
				idtemp := winarr%A_Index%
				WinGetClass, class, ahk_id %idtemp%
				if (exclusion(class) = 1 && idtemp != barid1 && idtemp != barid2 && idtemp != barid3)
				{
					WinMinimize, ahk_id %idtemp%
				}
			}
		} else if (key = 9)
		{
			DetectHiddenWindows, Off
			WinGet, winarr ,List
			Loop, %winarr%
			{
				idtemp := winarr%A_Index%
				WinRestore, ahk_id %idtemp%
			}
		} else if (key = 10)
		{
			
		} else if (key = 11)
		{
			work := workspace%mon%
			idtemp := WinExist("A")
			WinGetPos, xtemp, ytemp, wtemp, htemp, ahk_id %idtemp%
			if (xtemp >= Mon1Left && xtemp < Mon1Right)
			{
				mon := 1
			} else if (xtemp < Mon1Left && dis2 = 1)
			{
				mon := 2
			} else if (xtemp >= Mon1Right && dis3 = 1)
			{
				mon := 3
			}
			if (mon != 0)
			{
				remove(idtemp)
				if (xtemp = Mon%mon%Left && ytemp = Mon%mon%Top && wtemp = Mon%mon%Width && htemp = Mon%mon%Height)
				{
					if (titlebaraway = 0)
					{
						titlebegone(idtemp, 3)
					}
					screenFill(mon, idtemp)
				} else {
					titlebegone(idtemp, 2, null)
					id := mon%mon%_%work%_Full
					WinSet, Style, +0x40000, ahk_id %id%
					WinSet, Style, -0x40000, ahk_id %idtemp%
					Mon%mon%_%work%_Full := idtemp
					WinMove, ahk_id %idtemp%,, (Mon%mon%Left), (Mon%mon%Top), (Mon%mon%Width), (Mon%mon%Height)
				}
			}
		} else if (key = 12)
		{
			
		} else {
			msgbox, Click F13 to win!
		}
	return
	}
	
	debug()
	{
		global
		local xtemp, x
		
		WinGetPos, xtemp,,,, ahk_id %gidDEBUG%
		if (gidDEBUG = null)
		{
			createDebug()
		} else if (dis3 = 1)
		{
			if (xtemp > Mon3Right)
			{
				center(1, gidDEBUG)
			} else {
				remove(gidDebug)
				x := Mon3Right + 100
				WinMove, ahk_id %gidDEBUG%,, %x%
			}
		} else {
			if (xtemp > Mon1Right)
			{
				center(1, gidDEBUG)
			} else {
				remove(gidDebug)
				x := Mon1Right + 100
				WinMove, ahk_id %gidDEBUG%,, %x%
			}
		}
	return
	}
	
	mini()
	{
		MouseGetPos,,, id
		WinMinimize, ahk_id %id%
	return
	}
	
	;This script is a modified version of http://www.autohotkey.com/docs/scripts/EasyWindowDrag_%28KDE%29.htm.
	LDrag()
	{
		global
		local KDE_X1, KDE_Y1, KDE_id, KDE_WinXStart, KDE_WinYStart, KDE_WinX1, KDE_WinY1, KDE_Button, KDE_EscapeState, KDE_X2, KDE_Y2
		
		SetWinDelay, -1
		SetBatchLines, -1
		
		MouseGetPos,KDE_X1,KDE_Y1,KDE_id
		WinActivate, ahk_id %KDE_id%
		WinGetPos,KDE_WinXStart,KDE_WinYStart,,,ahk_id %KDE_id%
		KDE_WinX1 := KDE_WinXStart
		KDE_WinY1 := KDE_WinYStart
		Loop
		{
			GetKeyState,KDE_Button,LButton,P
			If KDE_Button = U
			{
				remove(KDE_id)
			break
			}
			GetKeyState, KDE_EscapeState, Escape, P
			if KDE_EscapeState = D
			{
				WinMove, ahk_id %KDE_id%,, %KDE_WinXStart%, %KDE_WinYStart%
			break
			}
			MouseGetPos,KDE_X2,KDE_Y2
			KDE_X2 -= KDE_X1
			KDE_Y2 -= KDE_Y1
			KDE_WinX2 := (KDE_WinX1 + KDE_X2)
			KDE_WinY2 := (KDE_WinY1 + KDE_Y2)
			WinMove,ahk_id %KDE_id%,,%KDE_WinX2%,%KDE_WinY2%
		}
	return
	}
	
	;This script is a modified version of http://www.autohotkey.com/docs/scripts/EasyWindowDrag_%28KDE%29.htm.
	RDrag()
	{
		global
		local KDE_X1, KDE_Y1, KDE_ID, KDE_WinXStart, KDE_WinYStart, KDE_WinWStart, KDE_WinHStart, KDE_WinX1, KDE_WinY1, KDE_WinW, KDE_WinH, KDE_WinLeft, KDE_WinUp, mon, temp, KDE_Button, KDE_EscapeState, KDE_X2, KDE_Y2,
		
		SetWinDelay, -1
		SetBatchLines, -1
		
		MouseGetPos,KDE_X1,KDE_Y1,KDE_id
		WinActivate, ahk_id %KDE_id%
		WinGetPos,KDE_WinXStart,KDE_WinYStart,KDE_WinWStart,KDE_WinHStart,ahk_id %KDE_id%
		KDE_WinX1 := KDE_WinXStart
		KDE_WinY1 := KDE_WinYStart
		KDE_WinW := KDE_WinWStart
		KDE_WinH := KDE_WinHStart
		If (KDE_X1 < KDE_WinX1 + KDE_WinW / 2)
		{
			KDE_WinLeft := 1
		} else {
			KDE_WinLeft := -1
		}
		If (KDE_Y1 < KDE_WinY1 + KDE_WinH / 2)
		{
			KDE_WinUp := 1
		} else {
			KDE_WinUp := -1
		}
		mon := 0
		temp := 0
		Loop, 3
		{
			temp := temp + 1
			Loop, 3
			{
				if (Mon%temp%_%A_Index%_center = KDE_id)
				{
					mon := temp
					work := A_Index
				}
			}
		}
		Loop
		{
			GetKeyState,KDE_Button, RButton, P
			If KDE_Button = U
			{
				if (mon != 0)
				{
					center(mon, KDE_id)
				break
				}
				remove(KDE_id)
			break
			}
			GetKeyState, KDE_EscapeState, Escape, P
			if KDE_EscapeState = D
			{
				WinMove, ahk_id %KDE_id%,, %KDE_WinXStart%, %KDE_WinYStart%, %KDE_WinWStart%, %KDE_WinHStart%
			break
			}
			MouseGetPos,KDE_X2,KDE_Y2
			WinGetPos,KDE_WinX1,KDE_WinY1,KDE_WinW,KDE_WinH,ahk_id %KDE_id%
			KDE_X2 -= KDE_X1
			KDE_Y2 -= KDE_Y1
			WinMove,ahk_id %KDE_id%,, KDE_WinX1 + (KDE_WinLeft+1)/2*KDE_X2 , KDE_WinY1 +  (KDE_WinUp+1)/2*KDE_Y2 , KDE_WinW - KDE_WinLeft *KDE_X2, KDE_WinH - KDE_WinUp *KDE_Y2
			KDE_X1 := (KDE_X2 + KDE_X1)
			KDE_Y1 := (KDE_Y2 + KDE_Y1)
		}
	return
	}
	
	exclusion(class)
	{
		global
		
		Loop, %exclusion0%
		{
			if(class = exclusion%A_Index%)
			{
				return 0
			}
		}
		if (class = "BlackboxClass" || class = "bbSlit" || class = "bbLeanBar" || class = "bbIconBox" || class = "Progman" || class = "Shell_TrayWnd" || class = "DV2ControlHost" || class = "Button") 
		{
			return 0
		}
	return 1
	}
	
	confine()
	{
		global
		
		if (confine = 0)
		{
			setTimer, winConfine, 1
			Confine := 1
		} else {
			setTimer, winConfine, off
			confine := 0
		}
	return
	}