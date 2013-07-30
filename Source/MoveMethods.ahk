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
			work := workspace%mon%
			findPos(mon, row, col)
			remove(id)
			setId(mon, work, id, row, col)
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
				expand(mon, work, id, row, col, rcol, rrow)
			}
		}
	return
	}
	
	repos(mon, work, id, row, col)
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
		test := InStr(mon%mon%_%work%_%row%_%tcol%, mon%mon%_%work%_%row%_%col%)
		if (test != 0)
		{
			move(mon%mon%_%work%_%row%_%col%, row, tcol)
		return
		}
		test := InStr(mon%mon%_%work%_%trow%_%col%, mon%mon%_%work%_%row%_%col%)
		if (test != 0)
		{
			move(mon%mon%_%work%_%row%_%col%, trow, col)
		}
	return
	}
	
	expand(mon, work, id, row, col, tw, th)
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
			if (mon%mon%_%work%_%row%_%tcol1% = null)
			{
				tw := tw + col%mon%%tcol1% + hbor
				mon%mon%_%work%_%row%_%tcol1% := full . id
				path1 := 1
				if (trow1 <= row%mon% && mon%mon%_%work%_%trow1%_%tcol1% = null && mon%mon%_%work%_%trow1%_%col% = null)
				{
					th := th + row%mon%%trow1% + vbor
					mon%mon%_%work%_%trow1%_%tcol1% := full . id
					mon%mon%_%work%_%trow1%_%col% := full . id
				}
			}
		}
		if (tcol2 <= col%mon%)
		{
			if (mon%mon%_%work%_%row%_%tcol2% = null)
			{
				tw := tw + col%mon%%tcol2% + hbor
				mon%mon%_%work%_%row%_%tcol2% := full . id
				path2 := 1
				if (trow2 <= row%mon% && mon%mon%_%work%_%trow2%_%tcol2% = null && mon%mon%_%work%_%trow2%_%col% = null)
				{
					th := th + row%mon%%trow2% + vbor
					mon%mon%_%work%_%trow1%_%tcol2% := full . id
					mon%mon%_%work%_%trow2%_%tcol1% := full . id
					mon%mon%_%work%_%trow2%_%tcol2% := full . id
					mon%mon%_%work%_%trow2%_%col% := full . id
				}
			}
		}
		if (trow1 <= row%mon% && path1 != 1 && mon%mon%_%work%_%trow1%_%col% = null)
		{
			th := th + row%mon%%trow1% + vbor
			mon%mon%_%work%_%trow1%_%col% := full . id
		}
		if (trow2 <= row%mon% && path2 != 1 && mon%mon%_%work%_%trow2%_%col% = null)
		{
			th := th + row%mon%%trow2% + vbor
			mon%mon%_%work%_%trow2%_%col% := full . id
			if (path1 = 1)
			{
				mon%mon%_%work%_%trow2%_%tcol1% := full . id
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
		local work
		
		remove(id)
		WinGetPos, xtemp,, widthtemp, heighttemp, ahk_id %id%
		if (mon = 0)
		{
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
		}
		work := workspace%mon%
		if (mon != 0)
		{
			Mon%mon%_%work%_center := id
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
		}
	return
	}
	
	centerPanel(direc)
	{
		global
		local xtemp
		local id
		local temp
		local x
		local mon
		local wtemp
		local xtemp2
		local temp1
		local temp2
		local temp3
		local temp4
		local work
		
		work := workspace%mon%
		
		id := WinExist("A")
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
			temp := Mon%mon%_%work%_center
			WinGetPos, xtemp2,, wtemp,, ahk_id %temp%
			if (Mon%mon%_%work%_center != null)
			{
				if (direc = "l")
				{
					temp1 := Mon%mon%Left + boundary + lbar%mon%
				} else if (direc = "r"){
					temp1 := xtemp2 + wtemp + boundary
				}
				temp2 := Mon%mon%Top + tbar%mon% + boundary
				temp3 := (Mon%mon%Width - lbar%mon% - rbar%mon% - wtemp - (4 * boundary)) / 2
				temp4 := Mon%mon%Height - tbar%mon% - bbar%mon% - (2 * boundary)
			} else {
				temp3 := (Mon%mon%Width - lbar%mon% - rbar%mon%) / 2
				if (direc = "l")
				{
					temp1 := Mon%mon%Left + lbar%mon%
				} else if (direc = "r"){
					temp1 := Mon%mon%Left + lbar%mon% + temp3
				}
				temp2 := Mon%mon%Top + tbar%mon%
				temp4 := Mon%mon%Height - tbar%mon% - bbar%mon%
			}
			WinMove, ahk_id %id%,, temp1, temp2, temp3, temp4
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
		local work
		
		work := workspace%mon%
		
		x := 4
		Loop, 3
		{
			x -= 1
			y := 4
			Loop, 3
			{
				y -= 1
				z := mon%mon%_%work%_%x%_%y%
				test := InStr(z, full)
				if (test = 0 && z != null)
				{
					move(z, x, y)
				}
			}
		}
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