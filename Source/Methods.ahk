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
	
	ShellMessage(wParam, lParam)
	{
		;This detects messages sent by windows itself and preforms actions based on the messages.
		global previousid
		global currentid
		global autocenter
		global titlebaraway
		global baryeah
		global tranthresh
		global nonactivetrans
		global barid1
		global barid2
		global barid3
		
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
	
	reload(math = 1, autoShift = 1)
	{
		;This loads all of the information from the config files.
		global
		local temp
		local temp2
		local x
		
		SetBatchLines, -1
		;The location of the config files.
		config := "Config\config.txt"
		configA := "Config\configAdvanced.txt"
		configB := "Config\Bar\configBar.txt"
		
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
		
		FileReadLine, enableadv, %configA%, 4
		if (enableadv = 1)
		{
			FileReadLine, bspeed, %configA%, 7
			if (bspeed = "WARP DRIVE")
			{
				bspeed := -1
			}
			FileReadLine, wspeed, %configA%, 10
			if (wspeed = "WARP DRIVE")
			{
				wspeed := -1
			}
			FileReadLine, kspeed, %configA%, 13
			if (kspeed = "WARP DRIVE")
			{
				kspeed := -1
			}
			
			FileReadLine, cspeed, %configA%, 16
			if (cspeed = "WARP DRIVE")
			{
				cspeed := -1
			}
			
			FileReadLine, titleFix, %configA%, 19
			
			FileReadLine, us1, %configA%, 24
			FileReadLine, ds1, %configA%, 27
			FileReadLine, rs1, %configA%, 30
			FileReadLine, ls1, %configA%, 33
			
			FileReadLine, us2, %configA%, 38
			FileReadLine, ds2, %configA%, 41
			FileReadLine, rs2, %configA%, 44
			FileReadLine, ls2, %configA%, 47
			
			FileReadLine, us3, %configA%, 52
			FileReadLine, ds3, %configA%, 55
			FileReadLine, rs3, %configA%, 58
			FileReadLine, ls3, %configA%, 61
			
			FileReadLine, custran, %configA%, 66
			FileReadLine, nonactivetrans, %configA%, 69

			
			FileReadLine, titlebaraway, %configA%, 74
			FileReadLine, autocenter, %configA%, 77
			
			FileReadLine, winHook, %configA%, 82
			
			FileReadLine, exclude, %configA%, 87
			if (exclude != null)
			{
				StringSplit, exclusion, exclude, `,
			} else {
				exclusion0 := 1
				exclusion1 := null	
			}
		
			FileReadLine, baryeah, %configA%, 94
			if (baryeah = 1)
			{
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
			}
			
			tranthresh := 0
		} else {
			;Defaults when advanced config is disabled. What each value does can be found in the advancedConfig.txt file. The items below are listed in the order they appear in the text file.
			bspeed := "10ms"
			wspeed := 100
			kspeed := 10
			cspeed := 20
			titlefix := 0
			us1 := 0
			ds1 := 0
			rs1 := 0
			ls1 := 0
			us2 := 0
			ds2 := 0
			rs2 := 0
			ls2 := 0
			us3 := 0
			ds3 := 0
			rs3 := 0
			ls3 := 0
			custran := 85
			titlebaraway := 0
			autocenter := 0
			winHook := 1
			monreverse := 0
			exclusion0 := 1
			exclusion1 := null
			baryeah := 0
			tranthresh := 0
		}
		
		FileReadLine, row1, %config%, 4
		FileReadLine, col1, %config%, 7
		
		FileReadLine, tbar1, %config%, 42
		FileReadLine, bbar1, %config%, 51
		FileReadLine, rbar1, %config%, 60
		FileReadLine, lbar1, %config%, 69
		
		if (dis2 = 1)
		{
			FileReadLine, row2, %config%, 12
			FileReadLine, col2, %config%, 15
			
			FileReadLine, tbar2, %config%, 45
			FileReadLine, bbar2, %config%, 54
			FileReadLine, rbar2, %config%, 63
			FileReadLine, lbar2, %config%, 72
		}
		
		if (dis3 = 1)
		{
			FileReadLine, row3, %config%, 20
			FileReadLine, col3, %config%, 23
			
			FileReadLine, tbar3, %config%, 48
			FileReadLine, bbar3, %config%, 57
			FileReadLine, rbar3, %config%, 66
			FileReadLine, lbar3, %config%, 75
		}
		
		FileReadLine, hbor, %config%, 28
		FileReadLine, vbor, %config%, 31
		FileReadLine, hborex, %config%, 34
		FileReadLine, vborex, %config%, 37
		
		FileReadLine, hspeed, %config%, 81
		FileReadLine, vspeed, %config%, 84
		
		FileReadLine, enablesound, %config%, 90
		if (enablesound = 1)
		{
			FileReadLine, vol, %config%, 93
			vold := vol * -1
			FileReadLine, enablebeep, %config%, 98
			if (enablebeep = 1)
			{
				FileReadLine, freq, %config%, 101
				FileReadLine, dura, %config%, 104
			}
		}	
		
		if (math = 1)
		{
			math()
		}
		if (autoshift = 1)
		{
			autoShift()
		}
	return
	}
	
	math()
	{
		;This preforms some random math to determine some values.
		global
		
		Mon1CusWidth := (Mon1Width - hbor - (col1 * hbor) - hborex - hborex - lbar1 - rbar1)
		Mon1CusHeight := (Mon1Height - vbor - (row1 * vbor) - vborex - vborex - tbar1 - bbar1)
		row11 := Mon1CusHeight / row1
		row12 := Mon1CusHeight / row1
		row13 := Mon1CusHeight / row1
		col11 := Mon1CusWidth / col1
		col12 := Mon1CusWidth / col1
		col13 := Mon1CusWidth / col1
		if (dis2 = 1)
		{
			Mon2CusWidth := (Mon2Width - hbor - (col2 * hbor) - hborex - hborex - lbar2 - rbar2)
			Mon2CusHeight := (Mon2Height - vbor - (row2 * vbor) - vborex - vborex - tbar2 - bbar2)
			row21 := Mon2CusHeight / row2
			row22 := Mon2CusHeight / row2
			row23 := Mon2CusHeight / row2
			col21 := Mon2CusWidth / col2
			col22 := Mon2CusWidth / col2
			col23 := Mon2CusWidth / col2
		}
		if (dis3 = 1)
		{
			Mon3CusWidth := (Mon3Width - hbor - (col3 * hbor) - hborex - hborex - lbar3 - rbar3)
			Mon3CusHeight := (Mon3Height - vbor - (row3 * vbor) - vborex - vborex - tbar3 - bbar3)
			row31 := Mon3CusHeight / row3
			row32 := Mon3CusHeight / row3
			row33 := Mon3CusHeight / row3
			col31 := Mon3CusWidth / col3
			col32 := Mon3CusWidth / col3
			col33 := Mon3CusWidth / col3
		}
	return
	}
	
	autoShift()
	{
		;This will automatically shift your window grid when the script is called.
		global
		local mon
		local temp
		
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
		
		MouseGetPos, pos
		if (pos < Mon1Left && dis2 = 1)
		{
			row2 := row
			col2 := col
			math()
		return
		}
		if (pos >= Mon1Right && dis3 = 1)
		{
			row3 := row
			col3 := col
			math()
		return
		}
		row1 := row
		col1 := col
		math()
		autoShift()
	return
	}
	
	remove(id, all = 0)
	{
		;Removes the window from the grid (or all items if all = 1).
		global
		local x
		local y
		local mon
		local work
		
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
		
		local xtemp
		local mon
		
		id := null
		if (nowin = 0)
		{
			id := WinExist("A")
		}
		
		mon := 0
		if (id != null)
		{
			WinGetPos, xtemp,,,, ahk_id %id%
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
		local x
		local y
		local work
		
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
	
	titleBeGone(id, mode = 1, titleFixmode = 0)
	{
		;Controls the titlebar on the window. The way it does this is based on the mode.
		global
		local widthtemp
		
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
		WinSet, Redraw,, ahk_id %id%
		if (titleFixMode = 0)
		{
			titleFixMode = titleFix
		}
		if (titleFixMode = 1)
		{
			WinGetPos,,, widthtemp,, ahk_id %id%
			WinMove, ahk_id %id%,,,, (widthtemp - 1)
			WinMove, ahk_id %id%,,,, (widthtemp)
		return
		}
		if (titleFixMode = 2)
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
		
		MouseGetPos,xtemp,,
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
				if (exclusion(class) = 1)
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
		idtemp := WinExist("A")
		WinMinimize, ahk_id %idtemp%
	return
	}
	
	;This script is a modified version of http://www.autohotkey.com/docs/scripts/EasyWindowDrag_%28KDE%29.htm.
	LDrag()
	{
		global
		
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
		}
		Else
		{
			KDE_WinLeft := -1
		}
		If (KDE_Y1 < KDE_WinY1 + KDE_WinH / 2)
		{
			KDE_WinUp := 1
		}
		Else
		{
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
			GetKeyState,KDE_Button,RButton,P ; Break if button has been released.
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
				WinSetTitle, ahk_id %KDE_id%,, %title%
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
	return 1
	}