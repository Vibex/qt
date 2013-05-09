	ShellMessage( wParam,lParam )
	{
		global previousid
		global currentid
		WinGetTitle, title, ahk_id %lParam%
		If (wParam = 2) { ;Window closed
			remove(lParam)
		}
		If (wParam = 1) { ;Window created
			
		}
		If (wParam = 4) { ;Window active
			previousid := currentid
			currentid := lParam
			Gosub, UpdateTitle
		}
		If (wParam = 32774) { ;Flash Window
			flashCheck(lparam)
		}
	}
	
	flashCheck(id)
	{
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
		global
		remove(a, 1)
		
		config := "Config\config.txt"
		configA := "Config\configAdvanced.txt"
	
		FileReadLine, bspeed, %config%, 139
		SetBatchLines, %batchspeed%
		
		FileReadLine, hres1, %config%, 4
		FileReadLine, vres1, %config%, 7
		FileReadLine, row1, %config%, 10
		FileReadLine, col1, %config%, 13
		
		FileReadLine, dis2, %config%, 18
		if (dis2 = 1)
		{
			FileReadLine, hres2, %config%, 21
			FileReadLine, vres2, %config%, 24
			FileReadLine, off2, %config%, 27
			FileReadLine, row2, %config%, 30
			FileReadLine, col2, %config%, 33
			
			FileReadLine, tbar2, %config%, 75
			FileReadLine, bbar2, %config%, 84
			FileReadLine, rbar2, %config%, 93
			FileReadLine, lbar2, %config%, 102
		}
		
		FileReadLine, dis3, %config%, 38
		if (dis3 = 1)
		{
			FileReadLine, hres3, %config%, 41
			FileReadLine, vres3, %config%, 44
			FileReadLine, off3, %config%, 47
			FileReadLine, row3, %config%, 50
			FileReadLine, col3, %config%, 53
			
			FileReadLine, tbar3, %config%, 78
			FileReadLine, bbar3, %config%, 87
			FileReadLine, rbar3, %config%, 96
			FileReadLine, lbar3, %config%, 105
		}
		
		FileReadLine, hbor, %config%, 58
		FileReadLine, vbor, %config%, 61
		FileReadLine, hborex, %config%, 64
		FileReadLine, vborex, %config%, 67
		
		FileReadLine, tbar1, %config%, 72
		FileReadLine, bbar1, %config%, 81
		FileReadLine, rbar1, %config%, 90
		FileReadLine, lbar1, %config%, 99
		
		FileReadLine, hspeed, %config%, 111
		FileReadLine, vspeed, %config%, 114
		
		FileReadLine, enablesound, %config%, 120
		if (enablesound = 1)
		{
			FileReadLine, vol, %config%, 123
			vold := vol * -1
		}	
		
		FileReadLine, enablebeep, %config%, 128
		if (enablebeep = 1)
		{
			FileReadLine, freq, %config%, 131
			FileReadLine, dura, %config%, 134
		}
		
		FileReadLine, enableadv, %configA%, 4
		if (enableadv = 1)
		{
			FileReadLine, titleFix, %configA%, 7
			
			FileReadLine, us1, %configA%, 12
			FileReadLine, ds1, %configA%, 15
			FileReadLine, rs1, %configA%, 18
			FileReadLine, ls1, %configA%, 21
			
			FileReadLine, us2, %configA%, 26
			FileReadLine, ds2, %configA%, 29
			FileReadLine, rs2, %configA%, 32
			FileReadLine, ls2, %configA%, 35
			
			FileReadLine, us3, %configA%, 40
			FileReadLine, ds3, %configA%, 43
			FileReadLine, rs3, %configA%, 46
			FileReadLine, ls3, %configA%, 49
			
			FileReadLine, baryeah, %configA%, 56
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
		global
		w1 := (hres1 - hbor - (col1 * hbor) - hborex - hborex - lbar1 - rbar1)
		h1 := (vres1 - vbor - (row1 * vbor) - vborex - vborex - tbar1 - bbar1)
		w2 := (hres2 - hbor - (col2 * hbor) - hborex - hborex - lbar2 - rbar2)
		h2 := (vres2 - vbor - (row2 * vbor) - vborex - vborex - tbar2 - bbar2)
		w3 := (hres3 - hbor - (col3 * hbor) - hborex - hborex - lbar3 - rbar3)
		h3 := (vres3 - vbor - (row3 * vbor) - vborex - vborex - tbar3 - bbar3)
		
		row11 := h1 / row1
		row12 := h1 / row1
		row13 := h1 / row1
		col11 := w1 / col1
		col12 := w1 / col1
		col13 := w1 / col1
		row21 := h2 / row2
		row22 := h2 / row2
		row23 := h2 / row2
		col21 := w2 / col2
		col22 := w2 / col2
		col23 := w2 / col2
		row31 := h3 / row3
		row32 := h3 / row3
		row33 := h3 / row3
		col31 := w3 / col3
		col32 := w3 / col3
		col33 := w3 / col3
	return
	}
	
	autoShift()
	{
		global
		mon := 0
		Loop, 3
		{
			mon := mon + 1
			if (us%mon% != 0)
			{
				temp := us%mon%
				Loop, %temp%
				{
					shiftBorder(null, "u", mon)
				}
			}
			if (ds%mon% != 0)
			{
				temp := ds%mon%
				Loop, %temp%
				{
					shiftBorder(null, "d", mon)
				}
			}
			if (rs%mon% != 0)
			{
				temp := rs%mon%
				Loop, %temp%
				{
					shiftBorder(null, "r", mon)
				}
			}
			if (ls%mon% != 0)
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
		global
		mon%mon%_%row%_%col% := id
	return
	}
	
	move(id, row, col, expand = 1)
	{
		global
		WinGetTitle, title, ahk_id %y%
		WinGetPos, xtemp, ytemp, wtemp, htemp, %title%
		remove(id)
		if (xtemp < 0 && dis2 = 1 && row <=  row2 && col <=  col2)
		{
			findPos(2, row, col)
			setId(2, id, row, col)
			if (expand = 1)
			{
				expand(2, id, title, row, col, rcol, rrow)
			} else {
				if ((row - 1) > 0)
				{
					d := row - 1
					g := row2%d%
				} else {
					g := 0
				}
				if ((row - 2) > 0)
				{
					d := row - 2
					f := row2%d%
				} else {
					f := 0
				}
				if ((col - 1) > 0)
				{
					d := col - 1
					v := col2%d%
				} else {
					v := 0
				}
				if ((col - 2) > 0)
				{
					d := col - 2
					b := col2%d%
				} else {
					b := 0
				}
				WinMove, %title%,, (v + b + (hbor * col) + lbar2 - hres2), (g + f + (vbor * row) + tbar2 + off2), (rcol),  (rrow)
			}
		return
		}
		if (xtemp >= hres1 && dis3 = 1 && row <=  row3 && col <=  col3)
		{
			findPos(3, row, col)
			setId(3, id, row, col)
			if (expand = 1)
			{
				expand(3, id, title, row, col, rcol, rrow)
			} else {
				if ((row - 1) > 0)
				{
					d := row - 1
					g := row3%d%
				} else {
					g := 0
				}
				if ((row - 2) > 0)
				{
					d := row - 2
					f := row3%d%
				} else {
					f := 0
				}
				if ((col - 1) > 0)
				{
					d := col - 1
					v := col3%d%
				} else {
					v := 0
				}
				if ((col - 2) > 0)
				{
					d := col - 2
					b := col3%d%
				} else {
					b := 0
				}
				WinMove, %title%,, (v + b + (hbor * col) + lbar3 + hres1), (g + f + (vbor * row) + tbar3 + off3), (rcol),  (rrow)
			}
		return
		}
		if (xtemp >= 0 && xtemp < hres1 && row <= row1 && col <= col1)
		{
			findPos(1, row, col)
			setId(1, id, row, col)
			if (expand = 1)
			{
				expand(1, id, title, row, col, rcol, rrow)
			} else {
				if ((row - 1) > 0)
				{
					d := row - 1
					g := row1%d%
				} else {
					g := 0
				}
				if ((row - 2) > 0)
				{
					d := row - 2
					f := row1%d%
				} else {
					f := 0
				}
				if ((col - 1) > 0)
				{
					d := col - 1
					v := col1%d%
				} else {
					v := 0
				}
				if ((col - 2) > 0)
				{
					d := col - 2
					b := col1%d%
				} else {
					b := 0
				}
				WinMove, %title%,, (v + b + (hbor * col) + lbar1), (g + f + (vbor * row) + tbar1), (rcol),  (rrow)		
			}
		return
		}
	return
	}
	
	expand(mon, id, title, row, col, tw, th)
	{
		global
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
				if (trow1 <= row%mon%)
				{
					if (mon%mon%_%trow1%_%tcol1% = null && mon%mon%_%trow1%_%col% = null)
					{
						th := th + row%mon%%trow1% + vbor
						mon%mon%_%trow1%_%tcol1% := full . id
						mon%mon%_%trow1%_%col% := full . id
					}
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
				if (trow2 <= row%mon%)
				{
					if (mon%mon%_%trow2%_%tcol2% = null && mon%mon%_%trow2%_%col% = null)
					{
						th := th + row%mon%%trow2% + vbor
						mon%mon%_%trow2%_%tcol2% := full . id
						mon%mon%_%trow2%_%col% := full . id
					}
				}
			}
		}
		if (trow1 <= row%mon% && path1 != 1)
		{
			if (mon%mon%_%trow1%_%col% = null)
			{
				th := th + row%mon%%trow1% + vbor
				mon%mon%_%trow1%_%col% := full . id
			}
		}
		if (trow2 <= row%mon% && path2 != 1)
		{
			if (mon%mon%_%trow2%_%col% = null)
			{
				th := th + row%mon%%trow2% + vbor
				mon%mon%_%trow2%_%col% := full . id
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
		if (mon = 2)
		{
			WinMove, %title%,, (v + b + (hbor * col) + lbar2 - hres2), (g + f + (vbor * row) + tbar2 + off2), (tw),  (th)
		return
		}
		if (mon = 3)
		{
			WinMove, %title%,, (v + b + (hbor * col) + lbar3 + hres1), (g + f + (vbor * row) + tbar3 + off3), (tw),  (th)
		return
		}
		if (mon = 1)
		{
			WinMove, %title%,, (v + b + (hbor * col) + lbar1), (g + f + (vbor * row) + tbar1), (tw),  (th)
		return
		}
	return
	}
	
	arrGrid(mon)
	{
		global
		x := 0
		y := 0
		temp1 := row%mon%
		temp2 := col%mon%
		Loop, %temp1%
		{
			x += 1
			y := 0
			Loop, %temp2%
			{
				y += 1
				mon%mon%_%x%_%y% := null
			}
		}
	return
	}
	
	grid(pos, row, col)
	{
		global
		if (pos < 0 && dis2 = 1)
		{
			row2 := row
			col2 := col
			math()
		return
		}
		if (pos > hres1 && dis3 = 1)
		{
			row3 := row
			col3 := col
			math()
		return
		}
		row1 := row
		col1 := col
		math()
	return
	}
	
	remove(id, all = 0)
	{
		global
		x := 0
		Loop, 3
		{
			x += 1
			y := 0
			Loop, 3
			{
				y += 1
				if (mon1_%x%_%y% = id ||  mon1_%x%_%y% = full . id || all = 1)
				{
					mon1_%x%_%y% := null
				}
				if (mon2_%x%_%y% = id ||  mon2_%x%_%y% = full . id || all = 1)
				{
					mon2_%x%_%y% := null
				}
				if (mon3_%x%_%y% = id ||  mon3_%x%_%y% = full . id || all = 1)
				{
					mon3_%x%_%y% := null
				}
			}
		}
	return
	}
	
	shiftBorder(id, direc, nowin = 0)
	{
		global
		if (nowin = 0)
		{
			WinGetTitle, title, ahk_id %y%
			WinGetPos, xtemp, ytemp, wtemp, htemp, %title%
		} else {
			if (nowin = 1)
			{
				xtemp := 1
			}
			if (nowin = 2)
			{
				xtemp := -1
			}
			if (nowin = 3)
			{
				xtemp := hres1 + 1
			}
		}
		if (xtemp < 0 && dis2 = 1 && row <=  row2 && col <=  col2)
		{
			if (direc = "u")
			{
				row21 := row21 - vspeed
				if (row2 = 3)
				{
					row22 := row22 + (vspeed/2)
					row23 := row23 + (vspeed/2)
				} else {
					row22 := row22 + vspeed
				}
			}
			if (direc = "d")
			{
				row21 := row21 + vspeed
				if (row2 = 3)
				{
					row22 := row22 - (vspeed/2)
					row23 := row23 - (vspeed/2)
				} else {
					row22 := row22 - vspeed
				}
			}
			if (direc = "l")
			{
				col21 := col21 - hspeed
				if (col2 = 3)
				{
					col22 := col22 + (hspeed/2)
					col23 := col23 + (hspeed/2)
				} else {
					col22 := col22 + hspeed
				}
			}
			if (direc = "r")
			{
				col21 := col21 + hspeed
				if (col2 = 3)
				{
					col22 := col22 - (hspeed/2)
					col23 := col23 - (hspeed/2)
				} else {
					col22 := col22 - hspeed
				}
			}
		return
		}
		if (xtemp >= hres1 && dis3 = 1 && row <=  row2 && col <=  col2)
		{
			if (direc = "u")
			{
				row31 := row31 - vspeed
				if (row3 = 3)
				{
					row32 := row32 + (vspeed/2)
					row33 := row33 + (vspeed/2)
				} else {
					row32 := row32 + vspeed
				}
			}
			if (direc = "d")
			{
				row31 := row31 + vspeed
				if (row3 = 3)
				{
					row32 := row32 - (vspeed/2)
					row33 := row33 - (vspeed/2)
				} else {
					row32 := row32 - vspeed
				}
			}
			if (direc = "l")
			{
				col31 := col21 - hspeed
				if (col3 = 3)
				{
					col32 := col32 + (hspeed/2)
					col33 := col33 + (hspeed/2)
				} else {
					col32 := col32 + hspeed
				}
			}
			if (direc = "r")
			{
				col31 := col31 + hspeed
				if (col3 = 3)
				{
					col32 := col32 - (hspeed/2)
					col33 := col33 - (hspeed/2)
				} else {
					col32 := col32 - hspeed
				}
			}
		return
		}
		if (xtemp < hres1 && xtemp >= 0 && row <=  row2 && col <=  col2)
		{
			if (direc = "u")
			{
				row11 := row11 - vspeed
				if (row2 = 3)
				{
					row12 := row12 + (vspeed/2)
					row13 := row13 + (vspeed/2)
				} else {
					row12 := row12 + vspeed
				}
			}
			if (direc = "d")
			{
				row11 := row11 + vspeed
				if (row1 = 3)
				{
					row12 := row12 - (vspeed/2)
					row13 := row13 - (vspeed/2)
				} else {
					row12 := row12 - vspeed
				}
			}
			if (direc = "l")
			{
				col11 := col11 - hspeed
				if (col1 = 3)
				{
					col12 := col12 + (hspeed/2)
					col13 := col13 + (hspeed/2)
				} else {
					col12 := col12 + hspeed
				}
			}
			if (direc = "r")
			{
				col11 := col11 + hspeed
				if (col1 = 3)
				{
					col12 := col12 - (hspeed/2)
					col13 := col13 - (hspeed/2)
				} else {
					col12 := col12 - hspeed
				}
			}
		return
		}
	return
	}
	
	cord(mon, id)
	{
		global
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
		global
		remove(id)
		if (mon = 2)
		{
			WinMove, ahk_id %id%,, (hbor + (-1 * hres2) + hborex + lbar2), (tbar2 + vbor + off2 + vborex), (hres2 - hbor - hbor - hborex - hborex - lbar2 - rbar2), (vres2 - tbar2 - vbor - vbor - bbar2 - vborex - vborex)
		}
		if (mon = 3)
		{
			WinMove, ahk_id %id%,, (hbor + hres1 + hborex + lbar3), (tbar3 + vbor + off3 + vborex), (hres3 - hbor - hbor - hborex - hborex - lbar3 - rbar3), (vres3 - tbar3 - vbor - vbor - bbar3 - vborex - vborex)
		}
		if (mon = 1)
		{
			WinMove, ahk_id %id%,, (hbor + hborex + lbar1), (tbar1 + vbor + vborex), (hres1 - hbor - hbor - hborex - hborex - lbar1 - rbar1), (vres1 - tbar1 - vbor - vbor - bbar1 - vborex - vborex)
		}
	return
	}
	
	sound(direc)
	{
		global
		if (enablesound = 1)
		{
			if (direc = "u")
			{
				run nircmd.exe changesysvolume %vol%
			}
			if (direc = "d")
			{
				run nircmd.exe changesysvolume %vold%
			}
			if (direc = "m")
			{
				run nircmd.exe mutesysvolume 2
			}
			if (enablebeep = 1)
			{
				SoundBeep, %freq%, %dura%
			return
			}
		return
		}
	return
	}
	
	autoMove(mon)
	{
		global
		x := 0
		Loop, 3
		{
			x += 1
			y := 0
			Loop, 3
			{
				y += 1
				temp := mon1_%x%_%y%
				test := InStr(temp, full)
				if (temp != null && test = 0)
				{
					move(temp, x, y)					
				}
			}
		}
	return
	}
	
	titleBeGone(id)
	{
		global
		WinSet, Style, -0x800000, A
		WinSet, Style, ^0xC00000, A
		if (titleFix = 1)
		{
			WinMinimize, ahk_id %id%
			WinActivate, ahk_id %id%
			WinRestore, ahk_id %id%
		}
	return
	}
	
	switchWin(id, direc)
	{
		global
		local mon
		WinGetPos, xtemp, ytemp, wtemp, htemp, ahk_id %id%
		if (xtemp < 0 && dis2 = 1)
		{
			mon := 2
		}
		if (xtemp >= hres1 && dis3 = 1)
		{
			mon := 3
		}
		if (xtemp < hres1 && xtemp >= 0)
		{
			mon := 1
		}
		cord(mon, id)
		if (rx != 0 && ry != 0)
		{
			if (direc := "u")
			{
				rx := rx - 1
				if (rx !> 0)
				{
					rx := rx + 1
				}
			}
			if (direc := "d")
			{
				rx := rx + 1
				if (rx !< 4)
				{
					rx := rx - 1
				}
			}
			if (direc := "l")
			{
				ry := ry - 1
				if (rx !> 0)
				{
					ry := ry + 1
				}
			}
			if (direc := "r")
			{
				ry := ry + 1
				if (rx !< 4)
				{
					ry := ry - 1
				}
			}
		}
	return	
	}
	
	class Window
	{
		id := null
		
		__New(tid)
		{
			id := tid
		return this
		}
	}
	
	class Monitor
	{
		hres := ""
		vres := ""
		hoff := ""
		voff := ""
		tbar := ""
		bbar := ""
		lbar := ""
		rbar := ""
		Data := Object()
		
		__New(thres, tvres, thoff, tvoff, ttbar, tbbar, tlbar, trbar)
		{
			hres := thres
			vres := tvres
			hoff := thoff
			voff := tvoff
			tbar := ttbar
			bbar := tbbar
			lbar := tlbar
			rbar := trbar
			Loop 3
			{
				i := A_Index
				Loop 3
				{
					data[i, A_Index] := null
				}
			}
		return this
		}
		
		getWinAt(r, c)
		{
			
		return
		}
		
		getWinCord(tid)
		{
			
			tarr := [sr, er, sc, ec]
		return tarr
		}
	}