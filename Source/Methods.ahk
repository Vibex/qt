	;If you know what you are doing with AHK feel free to play with the methods below. I've left comments on things that you may want to play with. I have also added a description of each methods function.
	ShellMessage( wParam,lParam )
	{
		;This detects messages sent by windows itself and preforms actions based on the messages.
		global previousid
		global currentid
		global titlebaraway
		global baryeah
		global tranthresh
		
		WinGetTitle, title, ahk_id %lParam%
		WinGet, Style, Style, ahk_id %lParam%
		mon := 0
		If (wParam = 1 && titlebaraway = 1)
		{
			;Window created
			titleBeGone(lParam, 2)
		return
		}
		If (wParam = 4)
		{
			;Window active
			WinGet, tran, Transparent, ahk_id %lParam%
			if (tran <= tranthresh)
			{
				WinSet, Transparent, 255, ahk_id %lParam%
			}
			if (lParam != currentid && baryeah = 1)
			{
				previousid := currentid
				currentid := lParam
				Gosub, UpdateTitle
			}
		return
		}
		If (wParam = 32774 && baryeah = 1)
		{
			;Flash Window
			flashCheck(lparam)
		}
	return
	}
	
	flashCheck(id)
	{
		;This method is called when a window flashes. I then sends the value to the taskbar.
		global
		
		if (flashNum0 != 0)
		{
			Loop, %flashNum0%
			{
				if (id = flashNum%A_Index%)
				{
				return
				}
			}
		}
		flashNum0 += 1
		flashNum%flashNum0% := id
	return
	}
	
	reload(math = 1, autoShift = 1)
	{
		;This loads all of the information from the config files.
		global
		
		SetBatchLines, -1
		;The location of the config files.
		config := "Config\config.txt"
		configA := "Config\configAdvanced.txt"
	
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
			
			FileReadLine, titlebaraway, %configA%, 71
			
			FileReadLine, winHook, %configA%, 76
			
			FileReadLine, baryeah, %configA%, 83
			FileReadLine, autorepos, %configA%, 86
			FileReadLine, debug, %configA%, 89
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
			titlebaraway := 1
			winHook := 1
			baryeah := 0
			autorepos := 0
			debug := 0
			tranthresh := 0
		}
		
		disp1 := 1
		FileReadLine, row1, %config%, 4
		FileReadLine, col1, %config%, 7
		
		FileReadLine, tbar1, %config%, 48
		FileReadLine, bbar1, %config%, 57
		FileReadLine, rbar1, %config%, 66
		FileReadLine, lbar1, %config%, 75
		
		FileReadLine, dis2, %config%, 12
		if (dis2 = 1)
		{
			FileReadLine, row2, %config%, 15
			FileReadLine, col2, %config%, 18
			
			FileReadLine, tbar2, %config%, 51
			FileReadLine, bbar2, %config%, 60
			FileReadLine, rbar2, %config%, 69
			FileReadLine, lbar2, %config%, 78
		}
		
		FileReadLine, dis3, %config%, 23
		if (dis3 = 1)
		{
			FileReadLine, row3, %config%, 26
			FileReadLine, col3, %config%, 29
			
			FileReadLine, tbar3, %config%, 54
			FileReadLine, bbar3, %config%, 63
			FileReadLine, rbar3, %config%, 72
			FileReadLine, lbar3, %config%, 81
		}
		
		FileReadLine, hbor, %config%, 34
		FileReadLine, vbor, %config%, 37
		FileReadLine, hborex, %config%, 40
		FileReadLine, vborex, %config%, 43
		
		FileReadLine, hspeed, %config%, 87
		FileReadLine, vspeed, %config%, 90
		
		FileReadLine, enablesound, %config%, 96
		if (enablesound = 1)
		{
			FileReadLine, vol, %config%, 99
			vold := vol * -1
		}	
		
		FileReadLine, enablebeep, %config%, 104
		if (enablebeep = 1)
		{
			FileReadLine, freq, %config%, 107
			FileReadLine, dura, %config%, 110
		}
		
		SysGet, MonNum, MonitorCount
		Loop, %MonNum%
		{
			SysGet, Mon%A_Index%, Monitor, %A_Index%
			Mon%A_Index%Width := Mon%A_Index%Right - Mon%A_Index%Left
			Mon%A_Index%Height := Mon%A_Index%Bottom - Mon%A_Index%Top
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
		
		mon := 0
		Loop, 3
		{
			mon := mon + 1
			if (us%mon% > 0)
			{
				temp := us%mon%
				Loop, %temp%
				{
					shiftBorder(null, "u", mon)
				}
			}
			if (ds%mon% > 0)
			{
				temp := ds%mon%
				Loop, %temp%
				{
					shiftBorder(null, "d", mon)
				}
			}
			if (rs%mon% > 0)
			{
				temp := rs%mon%
				Loop, %temp%
				{
					shiftBorder(null, "r", mon)
				}
			}
			if (ls%mon% > 0)
			{
				temp := ls%mon%
				Loop, %temp%
				{
					shiftBorder(null, "l", mon)
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
	
	setId(mon, id, row, col)
	{
		;This sets the id to the grid.
		global
		mon%mon%_%row%_%col% := id
	return
	}
	
	move(id, row, col)
	{
		;This is the main method that actually does the movement of the windows.
		global
		local xtemp
		local mon
		local expand
		local d
		local g
		local f
		local v
		local b
		
		if (id = null)
		{
			id := WinExist("A")
		}
		WinGetPos, xtemp,,,, ahk_id %id%
		mon := 0
		if (xtemp >= Mon1Left && xtemp < Mon1Right && row <= row1 && col <= col1)
		{
			mon := 1
		} else if (xtemp < Mon1Left && dis2 = 1 && row <=  row2 && col <=  col2)
		{
			mon := 2
		} else if (xtemp >= Mon1Right && dis3 = 1  && row <=  row3 && col <=  col3)
		{
			mon := 3
		}
		if (mon != 0)
		{
			findPos(mon, row, col)
			remove(id)
			setId(mon, id, row, col)
			if (A_TimeSincePriorHotkey < 400 && A_TimeSincePriorHotkey <> -1 && A_PriorHotkey = A_ThisHotkey)
			{
				if ((row - 1) > 0)
				{
					d := row - 1
					g := row%mon%%d%
				} else {
					g := 0
				}
				if ((row - 2) > 0)
				{
					d := row - 2
					f := row%mon%%d%
				} else {
					f := 0
				}
				if ((col - 1) > 0)
				{
					d := col - 1
					v := col%mon%%d%
				} else {
					v := 0
				}
				if ((col - 2) > 0)
				{
					d := col - 2
					b := col%mon%%d%
				} else {
					b := 0
				}
				GoSub, UpdateDebug
				WinMove, ahk_id %id%,, (v + b + (hbor * col)  + hborex + lbar%mon% + Mon%mon%Left), (g + f + (vbor * row) + vborex + tbar%mon% + Mon%mon%Top), (rcol),  (rrow)
			} else {
				expand(mon, id, row, col, rcol, rrow)
			}
		}
	return
	}
	
	repos(mon, id, row, col)
	{
		;This does the automatic repositioning of windows. It's still very much in development.
		global
		local trow
		local tcol
		local trown
		local tcoln
		local test
		
		trow := row + 1
		tcol := col + 1
		test := InStr(mon%mon%_%row%_%tcol%, mon%mon%_%row%_%col%)
		if (test != 0)
		{
			move(mon%mon%_%row%_%col%, row, tcol)
		return
		}
		test := InStr(mon%mon%_%trow%_%col%, mon%mon%_%row%_%col%)
		if (test != 0)
		{
			move(mon%mon%_%row%_%col%, trow, col)
		}
	return
	}
	
	expand(mon, id, row, col, tw, th)
	{
		;This does the resizing of the windows to fit the full grid.
		global
		local path1
		local path2
		local trow1
		local trow2
		local tcol1
		local tcol2
		local d
		local g
		local f
		local v
		local b
		
		path1 := 0
		path2 := 0
		trow1 := row + 1
		tcol1 := col + 1
		trow2 := row + 2
		tcol2 := col + 2
		if (tcol1 <= col%mon%)
		{
			if (mon%mon%_%row%_%tcol1% = null)
			{
				tw := tw + col%mon%%tcol1% + hbor
				mon%mon%_%row%_%tcol1% := full . id
				path1 := 1
				if (trow1 <= row%mon% && mon%mon%_%trow1%_%tcol1% = null && mon%mon%_%trow1%_%col% = null)
				{
					th := th + row%mon%%trow1% + vbor
					mon%mon%_%trow1%_%tcol1% := full . id
					mon%mon%_%trow1%_%col% := full . id
				}
			}
		}
		if (tcol2 <= col%mon%)
		{
			if (mon%mon%_%row%_%tcol2% = null)
			{
				tw := tw + col%mon%%tcol2% + hbor
				mon%mon%_%row%_%tcol2% := full . id
				path2 := 1
				if (trow2 <= row%mon% && mon%mon%_%trow2%_%tcol2% = null && mon%mon%_%trow2%_%col% = null)
				{
					th := th + row%mon%%trow2% + vbor
					mon%mon%_%trow1%_%tcol2% := full . id
					mon%mon%_%trow2%_%tcol1% := full . id
					mon%mon%_%trow2%_%tcol2% := full . id
					mon%mon%_%trow2%_%col% := full . id
				}
			}
		}
		if (trow1 <= row%mon% && path1 != 1 && mon%mon%_%trow1%_%col% = null)
		{
			th := th + row%mon%%trow1% + vbor
			mon%mon%_%trow1%_%col% := full . id
		}
		if (trow2 <= row%mon% && path2 != 1 && mon%mon%_%trow2%_%col% = null)
		{
			th := th + row%mon%%trow2% + vbor
			mon%mon%_%trow2%_%col% := full . id
			if (path1 = 1)
			{
				mon%mon%_%trow2%_%tcol1% := full . id
			}
		}
		if ((row - 1) > 0)
		{
			d := row - 1
			g := row%mon%%d%
		} else {
			g := 0
		}
		if ((row - 2) > 0)
		{
			d := row - 2
			f := row%mon%%d%
		} else {
			f := 0
		}
		if ((col - 1) > 0)
		{
			d := col - 1
			v := col%mon%%d%
		} else {
			v := 0
		}
		if ((col - 2) > 0)
		{
			d := col - 2
			b := col%mon%%d%
		} else {
			b := 0
		}
		GoSub, UpdateDebug
		WinMove, ahk_id %id%,, (v + b + (hbor * col) + hborex + lbar%mon% + Mon%mon%Left), (g + f + (vbor * row) + vborex + tbar%mon% + Mon%mon%Top), (tw),  (th)
	return
	}
	
	center(mon, id)
	{
		;This centers the window on the screen and resizes it if need be.
		global
		
		remove(id)
		WinGetPos, xtemp,, widthtemp, heighttemp, ahk_id %id%
		Mon%mon%_center := id
		if (heighttemp > Mon%mon%CusHeight)
		{			
			if (widthtemp > Mon%mon%CusWidth)
			{
				WinMove, ahk_id %id%,, (Mon%mon%Left + lbar%mon% + hbor + hborex), (Mon%mon%Top + tbar%mon% + vbor + vborex), (Mon%mon%CusWidth), (Mon%mon%CusHeight)
			return
			}				
			WinMove, ahk_id %id%,, (Mon%mon%Left + (lbar%mon% / 2) - (rbar%mon% / 2) + hbor + hborex + ((Mon%mon%Width / 2) - (widthtemp / 2))), (Mon%mon%Top + tbar%mon% + vbor + vborex), (widthtemp), (Mon%mon%CusHeight)
		return
		}			
		if (widthtemp > Mon%mon%CusWidth)
		{
			WinMove, ahk_id %id%,, (Mon%mon%Left + lbar%mon% + hbor + hborex), (Mon%mon%Top + (tbar%mon% / 2) - (bbar%mon% / 2) + vbor + vborex + ((Mon%mon%Height / 2) - (heighttemp / 2))), (Mon%mon%CusWidth), (heighttemp)
		return
		}	
		WinMove, ahk_id %id%,, (Mon%mon%Left + (lbar%mon% / 2) - (rbar%mon% / 2) + hbor + hborex + ((Mon%mon%Width / 2) - (widthtemp / 2))), (Mon%mon%Top + (tbar%mon% / 2) - (bbar%mon% / 2) + vbor + vborex + ((Mon%mon%Height / 2) - (heighttemp / 2)))
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
		
		x := 0
		Loop, 3
		{
			x += 1
			y := 0
			Loop, 3
			{
				y += 1
				if (mon1_%x%_%y% = id ||  mon1_%x%_%y% = full . id || all != 0)
				{
					mon1_%x%_%y% := null
				}
				if (mon2_%x%_%y% = id ||  mon2_%x%_%y% = full . id || all != 0)
				{
					mon2_%x%_%y% := null
				}
				if (mon3_%x%_%y% = id ||  mon3_%x%_%y% = full . id || all != 0)
				{
					mon3_%x%_%y% := null
				}
			}
			if (mon%x%_center = id || all = 1)
			{
				mon%x%_center := null
			}
			if (mon%x%_Full = id || all = 1)
			{
				idtemp := mon%x%_Full
				WinSet, Style, +0x40000, ahk_id %idtemp%
				mon%x%_Full := null
			}
		}
	return
	}
	
	shiftBorder(id, direc, nowin = 0)
	{
		;This does the border shifting.
		global
		
		local xtemp
		local mon
		
		mon := 0
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
	
	auto(mon)
	{
		;This automatically places windows when shifting borders.
		global
		local x
		local y
		local z
		local test
		
		x := 4
		Loop, 3
		{
			x -= 1
			y := 4
			Loop, 3
			{
				y -= 1
				z := mon%mon%_%x%_%y%
				test := InStr(z, full)
				if (test = 0 && z != null)
				{
					move(z, x, y)
				}
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
		
		x := 0
		Loop, 3
		{
			x += 1
			y := 0
			Loop, 3
			{
				y += 1
				if (id = mon%mon%_%x%_%y%)
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
	
	screenFill(mon, id)
	{
		;Fills the entire screen with a window.
		global
		
		remove(id)
		WinMove, ahk_id %id%,, (hbor + Mon%mon%Left + hborex + lbar%mon%), (tbar%mon% + vbor + Mon%mon%Top + vborex), (Mon%mon%Width - hbor - hbor - hborex - hborex - lbar%mon% - rbar%mon%), (Mon%mon%Height - vbor - vbor - vborex - vborex - tbar%mon% - bbar%mon%)
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
		
		if (titleFixMode = 0)
		{
			titleFixMode = titleFix
		}
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
		}
		WinSet, Redraw,, ahk_id %id%
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
		if (direc = "u")
		{
			newtrans := tran + custran
		}
		if (direc = "d")
		{
			newtrans := tran - custran
		}
		WinSet, Transparent, %newtrans%, ahk_id %id%
	return
	}
	
	ClipCursor(Confine=True, x1=0 , y1=0, x2=1, y2=1)
	{
		VarSetCapacity(R,16,0),  NumPut(x1,&R+0),NumPut(y1,&R+4),NumPut(x2,&R+8),NumPut(y2,&R+12) 
	return Confine ? DllCall( "ClipCursor", UInt,&R ) : DllCall( "ClipCursor" ) 
	}