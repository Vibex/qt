	AutoTrim, On
	SetTitleMatchMode,Slow
	DetectHiddenWindows, On
	null := ""
	
	run1 := 0
	run2 := 0
	run3 := 0
	
	reload()
	return
	
	^NumpadHome::
	{
		idtemp := WinExist("A")
        move7(idtemp)
	return
	}
	
	^NumpadUp::
	{
		idtemp := WinExist("A")
        move8(idtemp)
	return
	}
	
	^NumpadPgUp::
	{
		idtemp := WinExist("A")
        move9(idtemp)
	return
	}
	
	^NumpadLeft::
	{
		idtemp := WinExist("A")
        move4(idtemp)
	return
	}

	^NumpadClear::
	{
		idtemp := WinExist("A")
        move5(idtemp)
	return
	}
	
	^NumpadRight::
	{
		idtemp := WinExist("A")
        move6(idtemp)
	return
	}

	^NumpadEnd::
	{
		idtemp := WinExist("A")
        move1(idtemp)
	return
	}

	^NumpadDown::
	{
		idtemp := WinExist("A")
        move2(idtemp)
	return
	}
	
	^NumpadPgDn::
	{
		idtemp := WinExist("A")
		layoutChange(idtemp)
	return
	}
	
	
	
	!^1::
	{
		idtemp := WinExist("A")
		layoutChange1(idtemp)
	return
	}
	
	!^2::
	{
		idtemp := WinExist("A")
		layoutChange2(idtemp)
	return
	}
	
	!^3::
	{
		idtemp := WinExist("A")
		layoutChange3(idtemp)
	return
	}
	
	!^4::
	{
		idtemp := WinExist("A")
		layoutChange4(idtemp)
	return
	}
	
	
	
	!^NumpadHome::
    {
        WinGetTitle, tasktemp, A
        mon2(tasktemp)
    return
    }
	
    !^NumpadUp::
    {
        WinGetTitle, tasktemp, A
        mon1(tasktemp)
    return
    }
	
    !^NumpadPgUp::
    {
        WinGetTitle, tasktemp, A
        mon3(tasktemp)
    return
    }
	
	
	
	^Down::
	{
		WinGetTitle, tasktemp, A
		dropDown(tasktemp)
	return
	}
	
	
	
	!^NumpadClear::
	{
		WinSet, Style, -0x800000, A
		WinSet, Style, ^0xC00000, A  
	return
	}
	
	
	
    !^NumpadDown::
    {
        idtemp := WinExist("A")
        swap(idtemp)
    return
    }
	
	~!F4::
	{
		idtemp := WinExist("A")
		remove(idtemp)
	return
	}
	
	
	
	^NumpadAdd::
	{
		if (disablesound = 1)
		{
			run nircmd.exe changesysvolume %volchange%
			if (disablebeep = 1)
			{
				SoundBeep, %freq%, %dura%
			}
		}
	return
	}
	
	^NumpadSub::
	{	
		if (disablesound = 1)
		{
			run nircmd.exe changesysvolume %volchanged%
			if (disablebeep = 1)
			{
				SoundBeep, %freq%, %dura%
			}
		}
	return
	}
	
	^NumpadEnter::
	{
		if (disablesound = 1)
		{
			run nircmd.exe mutesysvolume 2
		}
	return
	}
	
	
	
	!^F::
	{
		idtemp := WinExist("A")
		remove(idtemp)
	return
	}
	
	!^R::
	{
		reload()
	return
	}
	
	
	+^NumpadHome::
	+^1::
	{
		if (run1 = 0)
		{
			run1 := 1
			layout2 := 0
		return
		} else {
			run1 := 0
			layout2 := arrlayout2[dlayout2] * secmulti2
		return
		}
	return
	}
	
	+^NumpadUp::
	+^2::
	{
		if (run2 = 0)
		{
			run2 := 1
			layout1 := 0
		return
		} else {
			run2 := 0
			layout1 := arrlayout1[dlayout1] * secmulti1
		return
		}
	return
	}
	
	+^NumpadPgUp::
	+^3::
	{
		if (run3 = 0)
		{
			run3 := 1
			layout3 := 0
		return
		} else {
			run3 := 0
			layout3 := arrlayout3[dlayout3] * secmulti3
		return
		}
	return
	}
	
	
	
	;-------------------------------------------------------------------------------------------------------------
	;-------------------------------------------------------------------------------------------------------------

	
	
	move7(y)
	{
		global
		WinGetTitle, x, ahk_id %y%
		WinGetPos, xtemp, ytemp, widthtemp, heighttemp, %x%
		if (xtemp < 0 && layout2 != 0)
		{
			id27 := y
			remove(y, 27)
			if (layout2 = 1 || layout2 = 2 || layout2 = 3)
			{
				WinMove, %x%,,     (hbor + (-1 * hres2) + hborex + ltaskbar2),  (ttaskbar2 + vbor + monitoroff2 + vborex), (hwindow211), (vres2 - ttaskbar2 - vbor - vbor - btaskbar2 - vborex - vborex)
			return
			}
			if (layout2 = -1 || layout2 = -2 || layout2 = -3)
			{
				WinMove, %x%,,     (hbor + (-1 * hres2) + hborex + ltaskbar2 + (hres2 - hbor - hwindow211 - hbor - hbor - hborex - hborex - ltaskbar2 - rtaskbar2) + hbor),  (ttaskbar2 + vbor + monitoroff2 + vborex), (hwindow211), (vres2 - ttaskbar2 - vbor - vbor - btaskbar2 - vborex - vborex)
			return
			}
			if (layout2 = 4 || layout2 = -4)
			{
				WinMove, %x%,,     (hbor + (-1 * hres2) + hborex + ltaskbar2),  (ttaskbar2 + vbor + monitoroff2 + vborex), (hres2 - hbor - hbor - hborex - hborex - ltaskbar2 - rtaskbar2), (vwindow222)
			return
			}
			layoutError(layout2, 2)
		return
		}
		if (xtemp > hres1 && layout3 != 0)
		{
			id37 := y
			remove(y, 37)
			if (layout3 = 1 || layout3 = 2 || layout3 = 3)
			{
				WinMove, %x%,,     (hres1 + hbor + hborex + ltaskbar3), (ttaskbar3 + vbor + monitoroff3 + vborex), (hwindow311), (vres3 - ttaskbar3 - vbor - vbor - btaskbar3 - vborex - vborex)
			return
			}
			if (layout3 = -1 || layout3 = -2 || layout3 = -3)
			{
				WinMove, %x%,,     (hres1 + hbor + hborex + ltaskbar3 + (hres3 - hbor - hwindow311 - hbor - hbor - hborex - hborex - ltaskbar3 - rtaskbar3) + hbor), (ttaskbar3 + vbor + monitoroff3 + vborex), (hwindow311), (vres3 - ttaskbar3 - vbor - vbor - btaskbar3 - vborex - vborex)
			return
			}
			if (layout3 = 4 || layout3 = -4)
			{
				WinMove, %x%,,     (hbor + hres1 + hborex + ltaskbar3),  (ttaskbar3 + vbor + monitoroff3 + vborex), (hres3 - hbor - hbor - hborex - hborex - ltaskbar3 - rtaskbar3), (vwindow322)
			return
			}
			layoutError(layout3, 3)
		return
		}
		id17 := y
		remove(y, 17)
		if (layout1 = 1 || layout1 = 2 || layout1 = 3)
		{
			WinMove, %x%,,     (hbor + hborex + ltaskbar1), (ttaskbar1 + vbor + vborex), (hwindow111), (vres1 - ttaskbar1 - vbor - vbor - btaskbar1 - vborex - vborex)
		return
		}
		if (layout1 = -1 || layout1 = -2 || layout1 = -3)
		{
			WinMove, %x%,,     (hbor + hborex + ltaskbar1 + (hres1 - hbor - hwindow111 - hbor - hbor - hborex - hborex - ltaskbar1 - rtaskbar1) + hbor), (ttaskbar1 + vbor + vborex), (hwindow111), (vres1 - ttaskbar1 - vbor - vbor - btaskbar1 - vborex - vborex)
		return
		}
		if (layout1 = 4 || layout1 = -4)
		{
			WinMove, %x%,,     (hbor + hborex + ltaskbar1),  (ttaskbar1 + vbor + vborex), (hres1 - hbor - hbor - hborex - hborex - ltaskbar1 - rtaskbar1), (vwindow122)
		return
		}
		layoutError(layout1, 1)
	return
	}
	
	move8(y)
	{
		global
		WinGetTitle, x, ahk_id %y%
		WinGetPos, xtemp, ytemp, widthtemp, heighttemp, %x%
		if (xtemp < 0 && layout2 != 0)
		{
			id28 := y
			remove(y, 28)
			if (layout2 = 1 || layout2 = 2 || layout2 = 3)
			{
				WinMove, %x%,,     (hbor + (-1 * hres2) + hwindow211 + hbor + hborex + ltaskbar2), (ttaskbar2 + vbor + monitoroff2 + vborex), (hres2 - hbor - hwindow211 - hbor - hbor - hborex - hborex - ltaskbar2 - rtaskbar2), (vres2 - ttaskbar2 - vbor - vbor - btaskbar2 - vborex - vborex)
			return
			}
			if (layout1 = -1 || layout2 = -2 || layout2 = -3)
			{
				WinMove, %x%,,     (hbor + (-1 * hres2) + hborex + ltaskbar2), (ttaskbar2 + vbor + monitoroff2 + vborex), (hres2 - hbor - hwindow211 - hbor - hbor - hborex - hborex - ltaskbar2 - rtaskbar2), (vres2 - ttaskbar2 - vbor - vbor - btaskbar2 - vborex - vborex)
			return
			}
			if (layout2 = 4 || layout2 = -4)
			{
				WinMove, %x%,,     (hbor + (-1 * hres2) + hborex + ltaskbar2),  (ttaskbar2 + vbor + monitoroff2 + vborex + vwindow222 + vbor), (hres2 - hbor - hbor - hborex - hborex - ltaskbar2 - rtaskbar2), (vres2 - vwindow222 - ttaskbar2 - btaskbar2- vbor - vbor - vbor - vborex - vborex)
			return
			}
			layoutError(layout2, 2)
		return
		}
		if (xtemp > hres1 && layout3 != 0)
		{
			id38 := y
			remove(y, 38)
			if (layout3 = 1 || layout3 = 2 || layout3 = 3)
			{
				WinMove, %x%,,     (hres1 + hbor + hbor + hwindow311 + hborex + ltaskbar3),  (ttaskbar3 + vbor + monitoroff3 + vborex), (hres3 - hbor - hwindow311 - hbor - hbor - hborex - hborex - ltaskbar3 - rtaskbar3), (vres3 - ttaskbar3 - vbor - vbor - btaskbar3 - vborex - vborex)
			return
			}
			if (layout3 = -1 || layout3 = -2 || layout3 = -3)
			{
				WinMove, %x%,,     (hres1 + hbor + hborex + ltaskbar3),  (ttaskbar3 + vbor + monitoroff3 + vborex), (hres3 - hbor - hwindow311 - hbor - hbor - hborex - hborex - ltaskbar3 - rtaskbar3), (vres3 - ttaskbar3 - vbor - vbor - btaskbar3 - vborex - vborex)
			return
			}
			if (layout3 = 4 || layout3 = -4)
			{
				WinMove, %x%,,     (hbor + hres1 + hborex + ltaskbar3),  (ttaskbar3 + vbor + monitoroff3 + vborex + vwindow322 + vbor), (hres3 - hbor - hbor - hborex - hborex - ltaskbar3 - rtaskbar3), (vres3 - vwindow322 - ttaskbar3 - btaskbar3- vbor - vbor - vbor - vborex - vborex)
			return
			}
			layoutError(layout3, 3)
		return
		}
		id18 := y
		remove(y, 18)
		if (layout1 = 1 || layout1 = 2 || layout1 = 3)
		{
			WinMove, %x%,,     (hbor + hbor + hwindow111 + hborex + ltaskbar1),  (ttaskbar1 + vbor + vborex), (hres1 - hbor - hwindow111 - hbor - hbor - hborex - hborex - ltaskbar1 - rtaskbar1), (vres1 - ttaskbar1 - vbor - vbor - btaskbar1 - vborex - vborex)
		return
		}
		if (layout1 = -1 || layout1 = -2 || layout1 = -3)
		{
			WinMove, %x%,,     (hbor + hborex + ltaskbar1),  (ttaskbar1 + vbor + vborex), (hres1 - hbor - hwindow111 - hbor - hbor - hborex - hborex - ltaskbar1 - rtaskbar1), (vres1 - ttaskbar1 - vbor - vbor - btaskbar1 - vborex - vborex)
		return
		}
		if (layout1 = 4 || layout1 = -4)
		{
			WinMove, %x%,,     (hbor + hborex + ltaskbar1),  (ttaskbar1 + vbor + vborex + vwindow122 + vbor), (hres1 - hbor - hbor - hborex - hborex - ltaskbar1 - rtaskbar1), (vres1 - vwindow122 - ttaskbar1 - btaskbar1- vbor - vbor - vbor - vborex - vborex)
		return
		}
		layoutError(layout1, 1)
	return
	}
	
	move9(y)
	{
		global
		WinGetTitle, x, ahk_id %y%
		WinGetPos, xtemp, ytemp, widthtemp, heighttemp, %x%
		if (xtemp < 0 && layout2 != 0)
		{
			mon2(x)
			remove(y, 29)
		return
		}
		if (xtemp > hres1 && layout3 != 0)
		{
			mon3(x)
			remove(y, 39)
		return
		}
		mon1(x)
		remove(y, 19)
	return
	}
	
	move4(y)
	{
		global
		WinGetTitle, x, ahk_id %y%
		WinGetPos, xtemp, ytemp, widthtemp, heighttemp, %x%
		if (xtemp < 0  && layout2 != 0)
		{
			id24 := y
			remove(y, 24)
			if (layout2 = 1 || layout2 = -1)
			{
				WinMove, %x%,,     ((-1 * hres2) + hbor + hborex + ltaskbar2), (ttaskbar2 + vbor + monitoroff2 + vborex), ((hres2 - hbor - hbor - hborex - hborex - ltaskbar2 - rtaskbar2 - hbor) / 2), (vres2 - ttaskbar2 - vbor - vbor - btaskbar2 - vborex - vborex)
			return
			}
			if (layout2 = 2)
			{
				WinMove, %x%,,     ((-1 * hres2) + hbor + hborex + ltaskbar2 + hwindow211 + hbor), (ttaskbar2 + vbor + monitoroff2 + vborex), ((hres2 - hbor - hbor - hborex - hborex - ltaskbar2 - rtaskbar2 - hbor - hwindow211 - hbor) / 2), (vres2 - ttaskbar2 - vbor - vbor - btaskbar2 - vborex - vborex)
			return
			}
			if (layout2 = 3)
			{
				WinMove, %x%,,     (hbor + (-1 * hres2) + hwindow211 + hbor + hborex  + ltaskbar2),  (ttaskbar2 + vbor + monitoroff2 + vborex), (hwindow222and223), (vwindow222)
			return
			}
			if (layout2 = 4 || layout2 = -4)
			{
				WinMove, %x%,,     (hbor + (-1 * hres2) + hborex + ltaskbar2),  (ttaskbar2 + vbor + monitoroff2 + vborex), ((hres2 - hbor - hbor - hborex - hborex - ltaskbar2 - rtaskbar2 - vbor) / 2), (vwindow222)
			return
			}
			if (layout2 = -2)
			{
				WinMove, %x%,,     ((-1 * hres2) + hbor + hborex + ltaskbar2), (ttaskbar2 + vbor + monitoroff2 + vborex), ((hres2 - hbor - hbor - hborex - hborex - ltaskbar2 - rtaskbar2 - hbor - hwindow211 - hbor) / 2), (vres2 - ttaskbar2 - vbor - vbor - btaskbar2 - vborex - vborex)
			return
			}
			if (layout2 = -3)
			{
				WinMove, %x%,,     (hbor + (-1 * hres2) + hborex  + ltaskbar2),  (ttaskbar2 + vbor + monitoroff2 + vborex), (hwindow222and223), (vwindow222)
			return
			}
			layoutError(layout2, 2)
		return
		}
		if (xtemp > hres1 && layout3 != 0)
		{
			id34 := y
			remove(y, 34)
			if (layout3 = 1 || layout3 = -1)
			{
				WinMove, %x%,,     (hres1 + hbor + hborex + ltaskbar3), (ttaskbar3 + vbor + monitoroff3 + vborex), ((hres3 - hbor - hbor - hborex - hborex - ltaskbar3 - rtaskbar3 - hbor) / 2), (vres3 - ttaskbar3 - vbor - vbor - btaskbar3 - vborex - vborex)
			return
			}
			if (layout3 = 2)
			{
				WinMove, %x%,,     (hres1 + hbor + hborex + ltaskbar3 + hwindow311 + hbor), (ttaskbar3 + vbor + monitoroff3 + vborex), ((hres3 - hbor - hbor - hborex - hborex - ltaskbar3 - rtaskbar3 - hbor - hwindow311 - hbor) / 2), (vres3 - ttaskbar3 - vbor - vbor - btaskbar3 - vborex - vborex)
			return
			}
			if (layout3 = 3)
			{
				WinMove, %x%,,     (hbor + hres1 + hwindow311 + hbor + hborex  + ltaskbar3),  (ttaskbar3 + vbor + monitoroff3 + vborex), (hwindow322and323), (vwindow322)
			return
			}
			if (layout3 = 4 || layout3 = -4)
			{
				WinMove, %x%,,     (hbor + hres1 + hborex + ltaskbar3),  (ttaskbar3 + vbor + monitoroff3 + vborex), ((hres3 - hbor - hbor - hborex - hborex - ltaskbar3 - rtaskbar3 - vbor) / 2), (vwindow322)
			return
			}
			if (layout3 = -2)
			{
				WinMove, %x%,,     (hres1 + hbor + hborex + ltaskbar3), (ttaskbar3 + vbor + monitoroff3 + vborex), ((hres3 - hbor - hbor - hborex - hborex - ltaskbar3 - rtaskbar3 - hbor - hwindow311 - hbor) / 2), (vres3 - ttaskbar3 - vbor - vbor - btaskbar3 - vborex - vborex)
			return
			}
			if (layout3 = -3)
			{
				WinMove, %x%,,     (hbor + hres1 + hborex  + ltaskbar3),  (ttaskbar3 + vbor + monitoroff3 + vborex), (hwindow322and323), (vwindow322)
			return
			}
			layoutError(layout3, 3)
		return
		}
		id14 := y
		remove(y, 14)
		if (layout1 = 1 || layout1 = -1)
			{
				WinMove, %x%,,     (hbor + hborex + ltaskbar1), (ttaskbar1 + vbor + vborex), ((hres1 - hbor - hbor - hborex - hborex - ltaskbar1 - rtaskbar1 - hbor) / 2), (vres1 - ttaskbar1 - vbor - vbor - btaskbar1 - vborex - vborex)
			return
			}
			if (layout1 = 2)
			{
				WinMove, %x%,,     (hbor + hborex + ltaskbar1 + hwindow111 + hbor), (ttaskbar1 + vbor + vborex), ((hres1 - hbor - hbor - hborex - hborex - ltaskbar1 - rtaskbar1 - hbor - hwindow111 - hbor) / 2), (vres1 - ttaskbar1 - vbor - vbor - btaskbar1 - vborex - vborex)
			return
			}
			if (layout1 = 3)
			{
				WinMove, %x%,,     (hbor + hwindow111 + hbor + hborex  + ltaskbar1),  (ttaskbar1 + vbor + vborex), (hwindow122and123), (vwindow122)
			return
			}
			if (layout1 = 4 || layout1 = -4)
			{
				WinMove, %x%,,     (hbor + hborex + ltaskbar1),  (ttaskbar1 + vbor + vborex), ((hres1 - hbor - hbor - hborex - hborex - ltaskbar1 - rtaskbar1 - vbor) / 2), (vwindow122)
			return
			}
			if (layout1 = -2)
			{
				WinMove, %x%,,     (hbor + hborex + ltaskbar1), (ttaskbar1 + vbor + vborex), ((hres1 - hbor - hbor - hborex - hborex - ltaskbar1 - rtaskbar1 - hbor - hwindow111 - hbor) / 2), (vres1 - ttaskbar1 - vbor - vbor - btaskbar1 - vborex - vborex)
			return
			}
			if (layout1 = -3)
			{
				WinMove, %x%,,     (hbor + hborex  + ltaskbar1),  (ttaskbar1 + vbor + vborex), (hwindow122and123), (vwindow122)
			return
			}
			layoutError(layout1, 1)
	return
	}
	
	move5(y)
	{
		global
		WinGetTitle, x, ahk_id %y%
		WinGetPos, xtemp, ytemp, widthtemp, heighttemp, %x%
		if (xtemp < 0 && layout2 != 0)
		{
			id25 := y
			remove(y, 25)
			if (layout2 = 1 || layout2 = -1)
			{
				WinMove, %x%,,     (((hres2 - hbor - hbor - hborex - hborex - ltaskbar2 - rtaskbar2 - hbor) / 2) + (-1 * hres2) + hbor + hborex + ltaskbar2 + hbor), (ttaskbar2 + vbor + monitoroff2 + vborex), ((hres2 - hbor - hbor - hborex - hborex - ltaskbar2 - rtaskbar2 - hbor) / 2), (vres2 - ttaskbar2 - vbor - vbor - btaskbar2 - vborex - vborex)
			return
			}
			if (layout2 = 2)
			{
				WinMove, %x%,,     (((hres2 - hbor - hbor - hborex - hborex - ltaskbar2 - rtaskbar2 - hbor - hwindow211 - hbor) / 2) + (-1 * hres2) + hbor + hborex + ltaskbar2 + hbor + hwindow211 + hbor), (ttaskbar2 + vbor + monitoroff2 + vborex), ((hres2 - hbor - hbor - hborex - hborex - ltaskbar2 - rtaskbar2 - hbor - hwindow211 - hbor) / 2), (vres2 - ttaskbar2 - vbor - vbor - btaskbar2 - vborex - vborex)
			return
			}
			if (layout2 = 3)
			{
				WinMove, %x%,,     (hbor + (-1 * hres2) + hwindow211 + hbor + hborex  + ltaskbar2 + hwindow222and223 + hbor),  (ttaskbar2 + vbor + monitoroff2 + vborex), ((hres2 - hbor - hwindow211 - hbor - hwindow222and223 - hbor - hbor - hbor - hborex - hborex - ltaskbar2 - rtaskbar2) / 2), (vwindow222)
			return
			}
			if (layout2 = 4 || layout2 = -4)
			{
				WinMove, %x%,,     (hbor + (-1 * hres2) + hborex + ltaskbar2 + ((hres2 - hbor - hbor - hborex - hborex - ltaskbar2 - rtaskbar2 - vbor) / 2) + vbor),  (ttaskbar2 + vbor + monitoroff2 + vborex), ((hres2 - hbor - hbor - hborex - hborex - ltaskbar2 - rtaskbar2 - vbor) / 2), (vwindow222)
			return
			}
			if (layout2 = -2)
			{
				WinMove, %x%,,     (((hres2 - hbor - hbor - hborex - hborex - ltaskbar2 - rtaskbar2 - hbor - hwindow211 - hbor) / 2) + (-1 * hres2) + hbor + hborex + ltaskbar2 + hbor), (ttaskbar2 + vbor + monitoroff2 + vborex), ((hres2 - hbor - hbor - hborex - hborex - ltaskbar2 - rtaskbar2 - hbor - hwindow211 - hbor) / 2), (vres2 - ttaskbar2 - vbor - vbor - btaskbar2 - vborex - vborex)
			return
			}
			if (layout2 = -3)
			{
				WinMove, %x%,,     (hbor + (-1 * hres2) + hborex  + ltaskbar2 + hwindow222and223 + hbor),  (ttaskbar2 + vbor + monitoroff2 + vborex), ((hres2 - hbor - hwindow211 - hbor - hwindow222and223 - hbor - hbor - hbor - hborex - hborex - ltaskbar2 - rtaskbar2) / 2), (vwindow222)
			return
			}
			layoutError(layout2, 2)
		return
		}
		if (xtemp > hres1 && layout3 != 0)
		{
			id35 := y
			remove(y, 35)
			if (layout3 = 1 || layout3 = -1)
			{
				WinMove, %x%,,     (((hres3 - hbor - hbor - hborex - hborex - ltaskbar3 - rtaskbar3 - hbor) / 2) + hres1 + hbor + hborex + ltaskbar3 + hbor), (ttaskbar3 + vbor + monitoroff3 + vborex), ((hres3 - hbor - hbor - hborex - hborex - ltaskbar3 - rtaskbar3 - hbor) / 2), (vres3 - ttaskbar3 - vbor - vbor - btaskbar3 - vborex - vborex)
			return
			}
			if (layout3 = 2)
			{
				WinMove, %x%,,     (((hres3 - hbor - hbor - hborex - hborex - ltaskbar3 - rtaskbar3 - hbor - hwindow311 - hbor) / 2) + hres1 + hbor + hborex + ltaskbar3 + hbor + hwindow311 + hbor), (ttaskbar3 + vbor + monitoroff3 + vborex), ((hres3 - hbor - hbor - hborex - hborex - ltaskbar3 - rtaskbar3 - hbor - hwindow311 - hbor) / 2), (vres3 - ttaskbar3 - vbor - vbor - btaskbar3 - vborex - vborex)
			return
			}
			if (layout3 = 3)
			{
				WinMove, %x%,,     (hbor + hres1 + hwindow311 + hbor + hborex  + ltaskbar3 + hwindow322and323 + hbor),  (ttaskbar3 + vbor + monitoroff3 + vborex), ((hres3 - hbor - hwindow311 - hbor - hwindow322and323 - hbor - hbor - hbor - hborex - hborex - ltaskbar3 - rtaskbar3) / 2), (vwindow322)
			return
			}
			if (layout3 = 4 || layout3 = -4)
			{
				WinMove, %x%,,     (hbor + hres1 + hborex + ltaskbar3 + ((hres3 - hbor - hbor - hborex - hborex - ltaskbar3 - rtaskbar3 - vbor) / 2) + vbor),  (ttaskbar3 + vbor + monitoroff3 + vborex), ((hres3 - hbor - hbor - hborex - hborex - ltaskbar3 - rtaskbar3 - vbor) / 2), (vwindow322)
			return
			}
			if (layout3 = -2)
			{
				WinMove, %x%,,     (((hres3 - hbor - hbor - hborex - hborex - ltaskbar3 - rtaskbar3 - hbor - hwindow311 - hbor) / 2) + hres1 + hbor + hborex + ltaskbar3 + hbor), (ttaskbar3 + vbor + monitoroff3 + vborex), ((hres3 - hbor - hbor - hborex - hborex - ltaskbar3 - rtaskbar3 - hbor - hwindow311 - hbor) / 2), (vres3 - ttaskbar3 - vbor - vbor - btaskbar3 - vborex - vborex)
			return
			}
			if (layout3 = -3)
			{
				WinMove, %x%,,     (hbor + hres1 + hborex  + ltaskbar3 + hwindow322and323 + hbor),  (ttaskbar3 + vbor + monitoroff3 + vborex), ((hres3 - hbor - hwindow311 - hbor - hwindow322and323 - hbor - hbor - hbor - hborex - hborex - ltaskbar3 - rtaskbar3) / 2), (vwindow322)
			return
			}
			layoutError(layout3, 3)
		return
		}
		id15 := y
		remove(y, 15)
		if (layout1 = 1 || layout1 = -1)
			{
				WinMove, %x%,,     (((hres1 - hbor - hbor - hborex - hborex - ltaskbar1 - rtaskbar1 - hbor) / 2) + hbor + hborex + ltaskbar1 + hbor), (ttaskbar1 + vbor + vborex), ((hres1 - hbor - hbor - hborex - hborex - ltaskbar1 - rtaskbar1 - hbor) / 2), (vres1 - ttaskbar1 - vbor - vbor - btaskbar1 - vborex - vborex)
			return
			}
			if (layout1 = 2)
			{
				WinMove, %x%,,     (((hres1 - hbor - hbor - hborex - hborex - ltaskbar1 - rtaskbar1 - hbor - hwindow111 - hbor) / 2) + hbor + hborex + ltaskbar1 + hbor + hwindow111 + hbor), (ttaskbar1 + vbor + vborex), ((hres1 - hbor - hbor - hborex - hborex - ltaskbar1 - rtaskbar1 - hbor - hwindow111 - hbor) / 2), (vres1 - ttaskbar1 - vbor - vbor - btaskbar1 - vborex - vborex)
			return
			}
			if (layout1 = 3)
			{
				WinMove, %x%,,     (hbor + hwindow111 + hbor + hborex  + ltaskbar1 + hwindow122and123 + hbor),  (ttaskbar1 + vbor + vborex), ((hres1 - hbor - hwindow111 - hbor - hwindow122and123 - hbor - hbor - hbor - hborex - hborex - ltaskbar1 - rtaskbar1) / 2), (vwindow122)
			return
			}
			if (layout1 = 4 || layout1 = -4)
			{
				WinMove, %x%,,     (hbor + hborex + ltaskbar1 + ((hres1 - hbor - hbor - hborex - hborex - ltaskbar1 - rtaskbar1 - vbor) / 2) + vbor),  (ttaskbar1 + vbor + vborex), ((hres1 - hbor - hbor - hborex - hborex - ltaskbar1 - rtaskbar1 - vbor) / 2), (vwindow122)
			return
			}
			if (layout1 = -2)
			{
				WinMove, %x%,,     (((hres1 - hbor - hbor - hborex - hborex - ltaskbar1 - rtaskbar1 - hbor - hwindow111 - hbor) / 2) + hbor + hborex + ltaskbar1 + hbor), (ttaskbar1 + vbor + vborex), ((hres1 - hbor - hbor - hborex - hborex - ltaskbar1 - rtaskbar1 - hbor - hwindow111 - hbor) / 2), (vres1 - ttaskbar1 - vbor - vbor - btaskbar1 - vborex - vborex)
			return
			}
			if (layout1 = -3)
			{
				WinMove, %x%,,     (hbor + hborex  + ltaskbar1 + hwindow122and123 + hbor),  (ttaskbar1 + vbor + vborex), ((hres1 - hbor - hwindow111 - hbor - hwindow122and123 - hbor - hbor - hbor - hborex - hborex - ltaskbar1 - rtaskbar1) / 2), (vwindow122)
			return
			}
			layoutError(layout1, 1)
	return
	}
	
	move6(y)
	{
		global
		WinGetTitle, x, ahk_id %y%
		WinGetPos, xtemp, ytemp, widthtemp, heighttemp, %x%
		if (xtemp < 0 && layout2 != 0)
		{
			id26 := y
			remove(y, 26)
			if (layout2 = 1 || layout2 = -1)
			{
				WinMove, %x%,,     (hbor + hborex + ltaskbar2 + (-1 * hres2)), (ttaskbar2 + vbor + monitoroff2 + vborex), (hres2 - hbor - hbor - hborex - hborex - ltaskbar2 - rtaskbar2), ((vres2 - ttaskbar2 - vbor - vbor - btaskbar2 - vbor - vborex - vborex) / 2)
			return
			}
			if (layout2 = 2)
			{
				WinMove, %x%,,     (hbor + hborex + ltaskbar2 + (-1 * hres2) + hwindow211 + hbor), (ttaskbar2 + vbor + monitoroff2 + vborex), (hres2 - hbor - hbor - hborex - hborex - ltaskbar2 - rtaskbar2  - hwindow211 - hbor), ((vres2 - ttaskbar2 - vbor - vbor - btaskbar2 - vbor - vborex - vborex) / 2)
			return
			}
			if (layout2 = 3)
			{
				WinMove, %x%,,     (hbor + (-1 * hres2) + hwindow211 + hbor + hborex  + ltaskbar2 + hwindow222and223 + hbor + ((hres2 - hbor - hwindow211 - hbor - hwindow222and223 - hbor - hbor - hbor - hborex - hborex - ltaskbar2 - rtaskbar2) / 2) + hbor),  (ttaskbar2 + vbor + monitoroff2 + vborex),  ((hres2 - hbor - hwindow211 - hbor - hwindow222and223 - hbor - hbor - hbor - hborex - hborex - ltaskbar2 - rtaskbar2) / 2), (vwindow222)
			return
			}
			if (layout2 = 4 || layout2 = -4)
			{
				WinMove, %x%,,     (hbor + (-1 * hres2) + hborex + ltaskbar2),  (ttaskbar2 + vbor + monitoroff2 + vborex + vwindow222 + vbor), ((hres2 - hbor - hbor - hborex - hborex - ltaskbar2 - rtaskbar2 - vbor) / 2), (vres2 - vwindow222 - ttaskbar2 - btaskbar2- vbor - vbor - vbor - vborex - vborex)
			return
			}
			if (layout2 = -2)
			{
				WinMove, %x%,,     (hbor + hborex + ltaskbar2 + (-1 * hres2)), (ttaskbar2 + vbor + monitoroff2 + vborex), (hres2 - hbor - hbor - hborex - hborex - ltaskbar2 - rtaskbar2  - hwindow211 - hbor), ((vres2 - ttaskbar2 - vbor - vbor - btaskbar2 - vbor - vborex - vborex) / 2)
			return
			}
			if (layout2 = -3)
			{
				WinMove, %x%,,     (hbor + (-1 * hres2) + hborex  + ltaskbar2 + hwindow222and223 + hbor + ((hres2 - hbor - hwindow211 - hbor - hwindow222and223 - hbor - hbor - hbor - hborex - hborex - ltaskbar2 - rtaskbar2) / 2) + hbor),  (ttaskbar2 + vbor + monitoroff2 + vborex),  ((hres2 - hbor - hwindow211 - hbor - hwindow222and223 - hbor - hbor - hbor - hborex - hborex - ltaskbar2 - rtaskbar2) / 2), (vwindow222)
			return
			}
			layoutError(layout2, 2)
		return
		}
		if (xtemp > hres1 && layout3 != 0)
		{
			id36 := y
			remove(y, 36)
			if (layout3 = 1 || layout3 = -1)
			{
				WinMove, %x%,,     (hbor + hborex + ltaskbar3 + hres1), (ttaskbar3 + vbor + monitoroff3 + vborex), (hres3 - hbor - hbor - hborex - hborex - ltaskbar3 - rtaskbar3), ((vres3 - ttaskbar3 - vbor - vbor - btaskbar3 - vbor - vborex - vborex) / 2)
			return
			}
			if (layout3 = 2)
			{
				WinMove, %x%,,     (hbor + hborex + ltaskbar3 + hres1 + hwindow311 + hbor), (ttaskbar3 + vbor + monitoroff3 + vborex), (hres3 - hbor - hbor - hborex - hborex - ltaskbar3 - rtaskbar3  - hwindow311 - hbor), ((vres3 - ttaskbar3 - vbor - vbor - btaskbar3 - vbor - vborex - vborex) / 2)
			return
			}
			if (layout3 = 3)
			{
				WinMove, %x%,,     (hbor + hres1 + hwindow311 + hbor + hborex  + ltaskbar3 + hwindow322and323 + hbor + ((hres3 - hbor - hwindow311 - hbor - hwindow322and323 - hbor - hbor - hbor - hborex - hborex - ltaskbar3 - rtaskbar3) / 2) + hbor),  (ttaskbar3 + vbor + monitoroff3 + vborex),  ((hres3 - hbor - hwindow311 - hbor - hwindow322and323 - hbor - hbor - hbor - hborex - hborex - ltaskbar3 - rtaskbar3) / 2), (vwindow322)
			return
			}
			if (layout3 = 4 || layout3 = -4)
			{
				WinMove, %x%,,     (hbor + hres1 + hborex + ltaskbar3),  (ttaskbar3 + vbor + monitoroff3 + vborex + vwindow322 + vbor), ((hres3 - hbor - hbor - hborex - hborex - ltaskbar3 - rtaskbar3 - vbor) / 2), (vres3 - vwindow322 - ttaskbar3 - btaskbar3 - vbor - vbor - vbor - vborex - vborex)
			return
			}
			if (layout3 = -2)
			{
				WinMove, %x%,,     (hbor + hborex + ltaskbar3 + hres1), (ttaskbar3 + vbor + monitoroff3 + vborex), (hres3 - hbor - hbor - hborex - hborex - ltaskbar3 - rtaskbar3  - hwindow311 - hbor), ((vres3 - ttaskbar3 - vbor - vbor - btaskbar3 - vbor - vborex - vborex) / 2)
			return
			}
			if (layout3 = -3)
			{
				WinMove, %x%,,     (hbor + hres1 + hborex  + ltaskbar3 + hwindow322and323 + hbor + ((hres3 - hbor - hwindow311 - hbor - hwindow322and323 - hbor - hbor - hbor - hborex - hborex - ltaskbar3 - rtaskbar3) / 2) + hbor),  (ttaskbar3 + vbor + monitoroff3 + vborex),  ((hres3 - hbor - hwindow311 - hbor - hwindow322and323 - hbor - hbor - hbor - hborex - hborex - ltaskbar3 - rtaskbar3) / 2), (vwindow322)
			return
			}
			layoutError(layout3, 3)
		return
		}
		id16 := y
		remove(y, 16)
		if (layout1 = 1 || layout1 = -1)
			{
				WinMove, %x%,,     (hbor + hborex + ltaskbar1), (ttaskbar1 + vbor + vborex), (hres1 - hbor - hbor - hborex - hborex - ltaskbar1 - rtaskbar1), ((vres1 - ttaskbar1 - vbor - vbor - btaskbar1 - vbor - vborex - vborex) / 2)
			return
			}
			if (layout1 = 2)
			{
				WinMove, %x%,,     (hbor + hborex + ltaskbar1 + hwindow111 + hbor), (ttaskbar1 + vbor + vborex), (hres1 - hbor - hbor - hborex - hborex - ltaskbar1 - rtaskbar1  - hwindow111 - hbor), ((vres1 - ttaskbar1 - vbor - vbor - btaskbar1 - vbor - vborex - vborex) / 2)
			return
			}
			if (layout1 = 3)
			{
				WinMove, %x%,,     (hbor + hwindow111 + hbor + hborex  + ltaskbar1 + hwindow122and123 + hbor + ((hres1 - hbor - hwindow111 - hbor - hwindow122and123 - hbor - hbor - hbor - hborex - hborex - ltaskbar1 - rtaskbar1) / 2) + hbor),  (ttaskbar1 + vbor + vborex),  ((hres1 - hbor - hwindow111 - hbor - hwindow122and123 - hbor - hbor - hbor - hborex - hborex - ltaskbar1 - rtaskbar1) / 2), (vwindow122)
			return
			}
			if (layout1 = 4 || layout1 = -4)
			{
				WinMove, %x%,,     (hbor + hborex + ltaskbar1),  (ttaskbar1 + vbor + vborex + vwindow122 + vbor), ((hres1 - hbor - hbor - hborex - hborex - ltaskbar1 - rtaskbar1 - vbor) / 2), (vres1 - vwindow122 - ttaskbar1 - btaskbar1 - vbor - vbor - vbor - vborex - vborex)
			return
			}
			if (layout1 = -2)
			{
				WinMove, %x%,,     (hbor + hborex + ltaskbar1), (ttaskbar1 + vbor + vborex), (hres1 - hbor - hbor - hborex - hborex - ltaskbar1 - rtaskbar1  - hwindow111 - hbor), ((vres1 - ttaskbar1 - vbor - vbor - btaskbar1 - vbor - vborex - vborex) / 2)
			return
			}
			if (layout1 = -3)
			{
				WinMove, %x%,,     (hbor + hborex  + ltaskbar1 + hwindow122and123 + hbor + ((hres1 - hbor - hwindow111 - hbor - hwindow122and123 - hbor - hbor - hbor - hborex - hborex - ltaskbar1 - rtaskbar1) / 2) + hbor),  (ttaskbar1 + vbor + vborex),  ((hres1 - hbor - hwindow111 - hbor - hwindow122and123 - hbor - hbor - hbor - hborex - hborex - ltaskbar1 - rtaskbar1) / 2), (vwindow122)
			return
			}
			layoutError(layout1, 1)
	return
	}
	
	move1(y)
	{
		global
		WinGetTitle, x, ahk_id %y%
		WinGetPos, xtemp, ytemp, widthtemp, heighttemp, %x%
		if (xtemp < 0 && layout2 != 0)
		{
			id21 := y
			remove(y, 21)
			if (layout2 = 1 || layout2 = -1)
			{
				WinMove, %x%,,     (hbor + hborex + ltaskbar2 + (-1 * hres2)), (((vres2 - ttaskbar2 - vbor - vbor - btaskbar2 - vbor - vborex - vborex) / 2) + ttaskbar2 + vbor + monitoroff2 + vbor + vborex), (hres2 - hbor - hbor - hborex - hborex - ltaskbar2 - rtaskbar2), ((vres2 - ttaskbar2 - vbor - vbor - btaskbar2 - vbor - vborex - vborex) / 2)
			return
			}
			if (layout2 = 2)
			{
				WinMove, %x%,,     (hbor + hborex + ltaskbar2 + (-1 * hres2) + hwindow211 + hbor), (((vres2 - ttaskbar2 - vbor - vbor - btaskbar1 - vbor - vborex - vborex) / 2) + ttaskbar2 + vbor + monitoroff2 + vbor + vborex), (hres2 - hbor - hbor - hborex - hborex - ltaskbar2 - rtaskbar2 - hwindow211 - hbor), ((vres2 - ttaskbar2 - vbor - vbor - btaskbar2 - vbor - vborex - vborex) / 2)
			return
			}
			if (layout2 = 3)
			{
				WinMove, %x%,,    (hbor + (-1 * hres2) + hwindow211 + hbor + hborex + ltaskbar2), (ttaskbar2 + vbor + vwindow222 + vbor + monitoroff2 + vborex), (hres2 - hbor - hwindow211 - hbor - hbor - hborex - hborex - ltaskbar2 - rtaskbar2), (vres2 - ttaskbar2 - vbor - vwindow222 - vbor - vbor - btaskbar2 - vborex - vborex)
			return
			}
			if (layout2 = 4 || layout2 = -4)
			{
				WinMove, %x%,,     (hbor + (-1 * hres2) + hborex + ltaskbar2 + ((hres2 - hbor - hbor - hborex - hborex - ltaskbar2 - rtaskbar2 - vbor) / 2) + vbor),  (ttaskbar2 + vbor + monitoroff2 + vborex + vwindow222 + vbor), ((hres2 - hbor - hbor - hborex - hborex - ltaskbar2 - rtaskbar2 - vbor) / 2), (vres2 - vwindow222 - ttaskbar2 - btaskbar2 - vbor - vbor - vbor - vborex - vborex)
			return
			}
			if (layout2 = -2)
			{
				WinMove, %x%,,     (hbor + hborex + ltaskbar2 + (-1 * hres2)), (((vres2 - ttaskbar2 - vbor - vbor - btaskbar1 - vbor - vborex - vborex) / 2) + ttaskbar2 + vbor + monitoroff2 + vbor + vborex), (hres2 - hbor - hbor - hborex - hborex - ltaskbar2 - rtaskbar2 - hwindow211 - hbor), ((vres2 - ttaskbar2 - vbor - vbor - btaskbar2 - vbor - vborex - vborex) / 2)
			return
			}
			if (layout2 = -3)
			{
				WinMove, %x%,,    (hbor + (-1 * hres2) + hborex + ltaskbar2), (ttaskbar2 + vbor + vwindow222 + vbor + monitoroff2 + vborex), (hres2 - hbor - hwindow211 - hbor - hbor - hborex - hborex - ltaskbar2 - rtaskbar2), (vres2 - ttaskbar2 - vbor - vwindow222 - vbor - vbor - btaskbar2 - vborex - vborex)
			return
			}
			layoutError(layout2, 2)
		return
		}
		if (xtemp > hres1 && layout3 != 0)
		{
			id31 := y
			remove(y, 31)
			if (layout3 = 1 || layout3 = -1)
			{
				WinMove, %x%,,     (hbor + hborex + ltaskbar3 + hres1), (((vres3 - ttaskbar3 - vbor - vbor - btaskbar3 - vbor - vborex - vborex) / 2) + ttaskbar3 + vbor + monitoroff3 + vbor + vborex), (hres3 - hbor - hbor - hborex - hborex - ltaskbar3 - rtaskbar3), ((vres3 - ttaskbar3 - vbor - vbor - btaskbar3 - vbor - vborex - vborex) / 2)
			return
			}
			if (layout3 = 2)
			{
				WinMove, %x%,,     (hbor + hborex + ltaskbar3 + hres1 + hwindow311 + hbor), (((vres3 - ttaskbar3 - vbor - vbor - btaskbar3 - vbor - vborex - vborex) / 2) + ttaskbar3 + vbor + monitoroff3 + vbor + vborex), (hres3 - hbor - hbor - hborex - hborex - ltaskbar3 - rtaskbar3 - hwindow311 - hbor), ((vres3 - ttaskbar3 - vbor - vbor - btaskbar3 - vbor - vborex - vborex) / 2)
			return
			}
			if (layout3 = 3)
			{
				WinMove, %x%,,    (hbor + hres1 + hwindow311 + hbor + hborex + ltaskbar3), (ttaskbar3 + vbor + vwindow322 + vbor + monitoroff3 + vborex), (hres3 - hbor - hwindow311 - hbor - hbor - hborex - hborex - ltaskbar3 - rtaskbar3), (vres3 - ttaskbar3 - vbor - vwindow322 - vbor - vbor - btaskbar3 - vborex - vborex)
			return
			}
			if (layout3 = 4 || layout3 = -4)
			{
				WinMove, %x%,,     (hbor + hres1 + hborex + ltaskbar3 + ((hres3 - hbor - hbor - hborex - hborex - ltaskbar3 - rtaskbar3 - vbor) / 2) + vbor),  (ttaskbar3 + vbor + monitoroff3 + vborex + vwindow322 + vbor), ((hres3 - hbor - hbor - hborex - hborex - ltaskbar3 - rtaskbar3 - vbor) / 2), (vres3 - vwindow322 - ttaskbar3 - btaskbar3 - vbor - vbor - vbor - vborex - vborex)
			return
			}
			if (layout3 = -2)
			{
				WinMove, %x%,,     (hbor + hborex + ltaskbar3 + hres1), (((vres3 - ttaskbar3 - vbor - vbor - btaskbar3 - vbor - vborex - vborex) / 2) + ttaskbar3 + vbor + monitoroff3 + vbor + vborex), (hres3 - hbor - hbor - hborex - hborex - ltaskbar3 - rtaskbar3 - hwindow311 - hbor), ((vres3 - ttaskbar3 - vbor - vbor - btaskbar3 - vbor - vborex - vborex) / 2)
			return
			}
			if (layout3 = -3)
			{
				WinMove, %x%,,    (hbor + hres1 + hborex + ltaskbar3), (ttaskbar3 + vbor + vwindow322 + vbor + monitoroff3 + vborex), (hres3 - hbor - hwindow311 - hbor - hbor - hborex - hborex - ltaskbar3 - rtaskbar3), (vres3 - ttaskbar3 - vbor - vwindow322 - vbor - vbor - btaskbar3 - vborex - vborex)
			return
			}
			layoutError(layout3, 3)
		return
		}
		id11 := y
		remove(y, 11)
		if (layout1 = 1 || layout1 = -1)
			{
				WinMove, %x%,,     (hbor + hborex + ltaskbar1), (((vres1 - ttaskbar1 - vbor - vbor - btaskbar1 - vbor - vborex - vborex) / 2) + ttaskbar1 + vbor + vbor + vborex), (hres1 - hbor - hbor - hborex - hborex - ltaskbar1 - rtaskbar1), ((vres1 - ttaskbar1 - vbor - vbor - btaskbar1 - vbor - vborex - vborex) / 2)
			return
			}
			if (layout1 = 2)
			{
				WinMove, %x%,,     (hbor + hborex + ltaskbar1 + hwindow111 + hbor), (((vres1 - ttaskbar1 - vbor - vbor - btaskbar1 - vbor - vborex - vborex) / 2) + ttaskbar1 + vbor + vbor + vborex), (hres1 - hbor - hbor - hborex - hborex - ltaskbar1 - rtaskbar1 - hwindow111 - hbor), ((vres1 - ttaskbar1 - vbor - vbor - btaskbar1 - vbor - vborex - vborex) / 2)
			return
			}
			if (layout1 = 3)
			{
				WinMove, %x%,,    (hbor + hwindow111 + hbor + hborex + ltaskbar1), (ttaskbar1 + vbor + vwindow122 + vbor + vborex), (hres1 - hbor - hwindow111 - hbor - hbor - hborex - hborex - ltaskbar1 - rtaskbar1), (vres1 - ttaskbar1 - vbor - vwindow122 - vbor - vbor - btaskbar1 - vborex - vborex)
			return
			}
			if (layout1 = 4 || layout1 = -4)
			{
				WinMove, %x%,,     (hbor + hborex + ltaskbar1 + ((hres1 - hbor - hbor - hborex - hborex - ltaskbar1 - rtaskbar1 - vbor) / 2) + vbor),  (ttaskbar1 + vbor + vborex + vwindow122 + vbor), ((hres1 - hbor - hbor - hborex - hborex - ltaskbar1 - rtaskbar1 - vbor) / 2), (vres1 - vwindow122 - ttaskbar1 - btaskbar1 - vbor - vbor - vbor - vborex - vborex)
			return
			}
			if (layout1 = -2)
			{
				WinMove, %x%,,     (hbor + hborex + ltaskbar1), (((vres1 - ttaskbar1 - vbor - vbor - btaskbar1 - vbor - vborex - vborex) / 2) + ttaskbar1 + vbor + vbor + vborex), (hres1 - hbor - hbor - hborex - hborex - ltaskbar1 - rtaskbar1 - hwindow111 - hbor), ((vres1 - ttaskbar1 - vbor - vbor - btaskbar1 - vbor - vborex - vborex) / 2)
			return
			}
			if (layout1 = -3)
			{
				WinMove, %x%,,    (hbor + hborex + ltaskbar1), (ttaskbar1 + vbor + vwindow122 + vbor + vborex), (hres1 - hbor - hwindow111 - hbor - hbor - hborex - hborex - ltaskbar1 - rtaskbar1), (vres1 - ttaskbar1 - vbor - vwindow122 - vbor - vbor - btaskbar1 - vborex - vborex)
			return
			}
			layoutError(layout1, 1)
	return
	}
	
	move2(y)
	{
		global
		WinGetTitle, x, ahk_id %y%
		WinGetPos, xtemp, ytemp, widthtemp, heighttemp, %x%
		if (xtemp < 0 && layout2 != 0)
		{
			id22 := y
			if (heighttemp > vres2)
			{			
				if (widthtemp > hres2)
				{
					WinMove, %x%,,     (-1 * hres2), (monitoroff2), (hres2), (vres2)
				return
				}				
				WinMove, %x%,,      ((ltaskbar2 / 2) - (rtaskbar2 / 2) + ((-1 * hres2) / 2)) - (widthtemp / 2), (monitoroff2), (widthtemp), (vres2)
			return
			}			
			if (width11 > hres2)
			{
				WinMove, %x%,,     (-1 * hres2), (monitoroff2 + (ttaskbar2 / 2) - (btaskbar2 / 2) + (vres2 / 2)-(heighttemp / 2) + vbor + vbor + 2), (hres2), (heighttemp)
			return
			}			
			WinMove, %x%,,     ((ltaskbar2 / 2) - (rtaskbar2 / 2) + ((-1 * hres2) / 2))-(widthtemp / 2), (monitoroff2 + (ttaskbar2 / 2) - (btaskbar2 / 2) + (vres2 / 2)-(heighttemp / 2))
    	return
		}
		if (xtemp > hres1 && layout3 != 0)
		{
			id32 := y
			if (heighttemp > vres3)
			{			
				if (widthtemp > hres3)
				{
					WinMove, %x%,,     (hres1), (monitoroff3), (hres3), (vres3)
				return
				}				
				WinMove, %x%,,      (hres1 + (ltaskbar3 / 2) - (rtaskbar3 / 2) + ((hres3) / 2)) - (widthtemp / 2), (monitoroff3), (widthtemp), (vres3)
			return
			}			
			if (width18 > hres3)
			{
				WinMove, %x%,,     (hres1), (monitoroff3 + (ttaskbar3 / 2) - (btaskbar3 / 2) + (vres3 / 2)-(heighttemp / 2) + vbor + vbor + 2), (hres3), (heighttemp)
			return
			}			
			WinMove, %x%,,     (hres1 + (ltaskbar3 / 2) - (rtaskbar3 / 2) + ((hres3) / 2))-(widthtemp / 2), (monitoroff3 + (ttaskbar3 / 2) - (btaskbar3 / 2) + (vres3 / 2)-(heighttemp / 2))
		return
		}
		id12 := y
		if (heighttemp > vres1)
			{
				if (widthtemp > hres1)
				{
					WinMove, %x%,,     0, 0, (hres1), (vres1)
				return
				}
				WinMove, %x%,,      ((ltaskbar1 / 2) - (rtaskbar1 / 2) + (hres1 / 2) - (widthtemp / 2)), 0, (widthtemp), (vres1)
			return
			}
			if (width10 > hres1)
			{
				WinMove, %x%,,     0, (ttaskbar1 / 2) - (btaskbar1 / 2) + (vres1 / 2)-(heighttemp / 2), (hres1), (heighttemp)
			return
			}
			WinMove, %x%,,      ((ltaskbar1 / 2) - (rtaskbar1 / 2) + (hres1 / 2) - (widthtemp / 2)), ((ttaskbar1 / 2) - (btaskbar1 / 2) + (vres1 / 2)-(heighttemp / 2))
	return
	}
	
	layoutChange(y)
	{
		global
		WinGetTitle, x, ahk_id %y%
		WinGetPos, xtemp, ytemp, widthtemp, heighttemp, %x%
		if (xtemp < 0 && layout2 != 0)
		{
			if (dlayout2 >= maxlayout2)
			{
				dlayout2 := 1
				layout2 := arrlayout2[dlayout2] * secmulti2
			} else {
				dlayout2 += 1
				layout2 := arrlayout2[dlayout2] * secmulti2
			}
			layoutMove2(y)
			WinActivate, ahk_id %y%
		return
		}
		if (xtemp > hres1 && layout3 != 0)
		{
			if (dlayout3 >= maxlayout3)
			{
				dlayout3 := 1
				layout3 := arrlayout3[dlayout3] * secmulti3
			} else {
				dlayout3 += 1
				layout3 := arrlayout3[dlayout3] * secmulti3
			}
			layoutMove3(y)
			WinActivate, ahk_id %y%
		return
		}
		if (dlayout1 >= maxlayout1)
		{
			dlayout1 := 1
			layout1 := arrlayout1[dlayout1] * secmulti1
		} else {
			dlayout1 += 1
			layout1 := arrlayout1[dlayout1] * secmulti1
		}
		layoutMove1(y)
		WinActivate, ahk_id %y%
	return
	}
	
	layoutChange1(y)
	{
		global
		WinGetTitle, x, ahk_id %y%
		WinGetPos, xtemp, ytemp, widthtemp, heighttemp, %x%
		if (xtemp < 0 && layout2 != 0)
		{
			layout2 := 1 * secmulti2
			layoutMove2(y)
			WinActivate, ahk_id %y%
		return
		}
		if (xtemp > hres1 && layout3 != 0)
		{
			layout3 := 1 * secmulti3
			layoutMove3(y)
			WinActivate, ahk_id %y%
		return
		}
		layout1 := 1 * secmulti1
		layoutMove1(y)
		WinActivate, ahk_id %y%
	return
	}
	
	layoutChange2(y)
	{
		global
		WinGetTitle, x, ahk_id %y%
		WinGetPos, xtemp, ytemp, widthtemp, heighttemp, %x%
		if (xtemp < 0 && layout2 != 0)
		{
			layout2 := 2 * secmulti2
			layoutMove2(y)
			WinActivate, ahk_id %y%
		return
		}
		if (xtemp > hres1 && layout3 != 0)
		{
			layout3 := 2 * secmulti3
			layoutMove3(y)
			WinActivate, ahk_id %y%
		return
		}
		layout1 := 2 * secmulti1
		layoutMove1(y)
		WinActivate, ahk_id %y%
	return
	}
	
	layoutChange3(y)
	{
		global
		WinGetTitle, x, ahk_id %y%
		WinGetPos, xtemp, ytemp, widthtemp, heighttemp, %x%
		if (xtemp < 0 && layout2 != 0)
		{
			layout2 := 3 * secmulti2
			layoutMove2(y)
			WinActivate, ahk_id %y%
		return
		}
		if (xtemp > hres1 && layout3 != 0)
		{
			layout3 := 3 * secmulti3
			layoutMove3(y)
			WinActivate, ahk_id %y%
		return
		}
		layout1 := 3 * secmulti1
		layoutMove1(y)
		WinActivate, ahk_id %y%
	return
	}
	
	layoutChange4(y)
	{
		global
		WinGetTitle, x, ahk_id %y%
		WinGetPos, xtemp, ytemp, widthtemp, heighttemp, %x%
		if (xtemp < 0 && layout2 != 0)
		{
			layout2 := 4 * secmulti2
			layoutMove2(y)
			WinActivate, ahk_id %y%
		return
		}
		if (xtemp > hres1 && layout3 != 0)
		{
			layout3 := 4 * secmulti3
			layoutMove3(y)
			WinActivate, ahk_id %y%
		return
		}
		layout1 := 4 * secmulti1
		layoutMove1(y)
		WinActivate, ahk_id %y%
	return
	}
	
	layoutMove1(y)
	{
		global
		WinRestore, ahk_id %id11%
		WinRestore, ahk_id %id14%
		WinRestore, ahk_id %id15%
		WinRestore, ahk_id %id16%
		WinRestore, ahk_id %id17%
		WinRestore, ahk_id %id18%
		if (id17 != null)
		{
			move7(id17)
		}
		if (id18 != null)
		{
			move8(id18)
		}
		if (id14 != null)
		{
			move4(id14)
		}
		if (id14 != null)
		{
			move4(id14)
		}
		if (id15 != null)
		{
			move5(id15)
		}
		if (id16 != null)
		{
			move6(id16)
		}
		if (id11 != null)
		{
			move1(id11)
		}
		if (layout1 = 1 || layout1 = 2 || layout1 = -1 || layout1 = -2)
		{
			if (y = id17 || y = id18)
			{
				if (id18 != null || layout1 = 1)
				{
					WinMinimize, ahk_id %id14%
					WinMinimize, ahk_id %id15%
					WinMinimize, ahk_id %id16%
					WinMinimize, ahk_id %id11%
				}
				if (id18 = null && layout1 = 2)
				{
					WinMinimize, ahk_id %id16%
					WinMinimize, ahk_id %id11%
				}
			}
			if (y = id14 || y = id15)
			{
				WinMinimize, ahk_id %id18%
				WinMinimize, ahk_id %id16%
				WinMinimize, ahk_id %id11%
				if (layout1 = 1)
				{
					WinMinimize, ahk_id %id17%
				}
			}
			if (y = id16 || y = id11)
			{
				WinMinimize, ahk_id %id14%
				WinMinimize, ahk_id %id15%
				WinMinimize, ahk_id %id18%
				if (layout1 = 1)
				{
					WinMinimize, ahk_id %id17%
				}
			}
		}
		if (layout1 = 4 || layout1 = -4)
		{
			if (y = id17 || y = id18)
			{
				if (id18 != null)
				{
					WinMinimize, ahk_id %id14%
					WinMinimize, ahk_id %id15%
					WinMinimize, ahk_id %id16%
					WinMinimize, ahk_id %id11%
				}
			}
			if (y = id14 || y = id15)
			{
				WinMinimize, ahk_id %id17%
				if (id18 != null)
				{
					WinMinimize, ahk_id %id16%
					WinMinimize, ahk_id %id11%
				}
				if (id18 = null)
				{
					WinMinimize, ahk_id %id18%
				}
			}
			if (y = id16 || y = id11)
			{
				WinMinimize, ahk_id %id14%
				WinMinimize, ahk_id %id15%
				WinMinimize, ahk_id %id18%
				if (layout1 = 1)
				{
					WinMinimize, ahk_id %id17%
				}
			}
		}
	return
	}
	
	layoutMove2(y)
	{
		global
		WinRestore, ahk_id %id21%
		WinRestore, ahk_id %id24%
		WinRestore, ahk_id %id25%
		WinRestore, ahk_id %id26%
		WinRestore, ahk_id %id27%
		WinRestore, ahk_id %id28%
		if (id27 != null)
		{
			move7(id27)
		}
		if (id28 != null)
		{
			move8(id28)
		}
		if (id24 != null)
		{
			move4(id24)
		}
		if (id25 != null)
		{
			move5(id25)
		}
		if (id26 != null)
		{
			move6(id26)
		}
		if (id21 != null)
		{
			move1(id21)
		}
			if (layout2 = 1 || layout2 = 2 || layout2 = -1 || layout2 = -2)
		{
			if (y = id27 || y = id28)
			{
				if (id28 != null || layout2 = 1)
				{
					WinMinimize, ahk_id %id24%
					WinMinimize, ahk_id %id25%
					WinMinimize, ahk_id %id26%
					WinMinimize, ahk_id %id21%
				}
				if (id28 = null && layout2 = 2)
				{
					WinMinimize, ahk_id %id26%
					WinMinimize, ahk_id %id21%
				}
			}
			if (y = id24 || y = id25)
			{
				WinMinimize, ahk_id %id28%
				WinMinimize, ahk_id %id26%
				WinMinimize, ahk_id %id21%
				if (layout2 = 1)
				{
					WinMinimize, ahk_id %id27%
				}
			}
			if (y = id26 || y = id21)
			{
				WinMinimize, ahk_id %id24%
				WinMinimize, ahk_id %id25%
				WinMinimize, ahk_id %id28%
				if (layout2 = 1)
				{
					WinMinimize, ahk_id %id27%
				}
			}
		}
		if (layout2 = 4 || layout2 = -4)
		{
			if (y = id27 || y = id28)
			{
				if (id28 != null)
				{
					WinMinimize, ahk_id %id24%
					WinMinimize, ahk_id %id25%
					WinMinimize, ahk_id %id26%
					WinMinimize, ahk_id %id21%
				}
			}
			if (y = id24 || y = id25)
			{
				WinMinimize, ahk_id %id27%
				if (id28 != null)
				{
					WinMinimize, ahk_id %id26%
					WinMinimize, ahk_id %id21%
				}
				if (id28 = null)
				{
					WinMinimize, ahk_id %id28%
				}
			}
			if (y = id26 || y = id21)
			{
				WinMinimize, ahk_id %id24%
				WinMinimize, ahk_id %id25%
				WinMinimize, ahk_id %id28%
				if (layout2 = 1)
				{
					WinMinimize, ahk_id %id27%
				}
			}
		}
	return
	}
	
	layoutMove3(y)
	{
		global
		WinRestore, ahk_id %id31%
		WinRestore, ahk_id %id34%
		WinRestore, ahk_id %id35%
		WinRestore, ahk_id %id36%
		WinRestore, ahk_id %id37%
		WinRestore, ahk_id %id38%
		if (id37 != null)
		{
			move7(id37)
		}
		if (id38 != null)
		{
			move8(id38)
		}
		if (id34 != null)
		{
			move4(id34)
		}
		if (id35 != null)
		{
			move5(id35)
		}
		if (id36 != null)
		{
			move6(id36)
		}
		if (id31 != null)
		{
			move1(id31)
		}
		if (layout3 = 1 || layout3 = 2 || layout3 = -1 || layout3 = -2)
		{
			if (y = id37 || y = id38)
			{
				if (id38 != nulll || layout3 = 1)
				{
					WinMinimize, ahk_id %id34%
					WinMinimize, ahk_id %id35%
					WinMinimize, ahk_id %id36%
					WinMinimize, ahk_id %id31%
				}
				if (id38 = null && layout3 = 2)
				{
					WinMinimize, ahk_id %id36%
					WinMinimize, ahk_id %id31%
				}
			}
			if (y = id34 || y = id35)
			{
				WinMinimize, ahk_id %id38%
				WinMinimize, ahk_id %id36%
				WinMinimize, ahk_id %id31%
				if (layout3 = 1)
				{
					WinMinimize, ahk_id %id37%
				}
			}
			if (y = id36 || y = id31)
			{
				WinMinimize, ahk_id %id34%
				WinMinimize, ahk_id %id35%
				WinMinimize, ahk_id %id38%
				if (layout3 = 1)
				{
					WinMinimize, ahk_id %id37%
				}
			}
		}
		if (layout3 = 4 || layout3 = -4)
		{
			if (y = id37 || y = id38)
			{
				if (id38 != null)
				{
					WinMinimize, ahk_id %id34%
					WinMinimize, ahk_id %id35%
					WinMinimize, ahk_id %id36%
					WinMinimize, ahk_id %id31%
				}
			}
			if (y = id34 || y = id35)
			{
				WinMinimize, ahk_id %id37%
				if (id38 != null)
				{
					WinMinimize, ahk_id %id36%
					WinMinimize, ahk_id %id31%
				}
				if (id38 = null)
				{
					WinMinimize, ahk_id %id38%
				}
			}
			if (y = id36 || y = id31)
			{
				WinMinimize, ahk_id %id34%
				WinMinimize, ahk_id %id35%
				WinMinimize, ahk_id %id38%
				if (layout3 = 1)
				{
					WinMinimize, ahk_id %id37%
				}
			}
		}
	return
	}
	
	mon1(x)
	{
		global
		WinMove, %x%,,     (hbor + hborex + ltaskbar1), (ttaskbar1 + vbor + vborex), (hres1 - hbor - hbor - hborex - hborex - ltaskbar1 - rtaskbar1), (vres1 - ttaskbar1 - vbor - vbor - btaskbar1 - vborex - vborex)
	return
	}
	
	mon2(x)
	{
		global
		WinMove, %x%,,     (hbor + (-1 * hres2) + hborex + ltaskbar2), (ttaskbar2 + vbor + monitoroff2 + vborex), (hres2 - hbor - hbor - hborex - hborex - ltaskbar2 - rtaskbar2), (vres2 - ttaskbar2 - vbor - vbor - btaskbar2 - vborex - vborex)
	return
	}
	
	mon3(x)
	{
		global
		WinMove, %x%,,     (hres1 + hbor + hborex + ltaskbar3), (ttaskbar3 + vbor + monitoroff3 + vborex), (hres3 - hbor - hbor - hborex - hborex - ltaskbar3 - rtaskbar3), (vres3 - ttaskbar3 - vbor - vbor - btaskbar3 - vborex - vborex)
	return
	}
	
	dropDown(x)
	{
		global
		WinGetPos, xtemp, ytemp, widthtemp, heighttemp, %x%
		if (xtemp < 0 && layout2 != 0)
		{
			WinMove, %x%,,,,, (vres2 - ttaskbar2 - vbor - vbor - btaskbar2 - vborex - vborex)
		return
		}
		if (xtemp > hres1 && layout3 != 0)
		{
			WinMove, %x%,,,,, (vres3 - ttaskbar3 - vbor - vbor - btaskbar3 - vborex - vborex)
		return
		}
		WinMove, %x%,,,,, (vres1 - ttaskbar1 - vbor - vbor - btaskbar1 - vborex - vborex)
	return	
	}
	
	remove(x, current = 0)
	{
		global
		if (x = id11 && current != 11)
		{
			id11 := null
		}
		if (x = id12 && current != 12)
		{
			id12 := null
		}
		if (x = id14 && current != 14)
		{
			id14 := null
		}
		if (x = id15 && current != 15)
		{
			id15 := null
		}
		if (x = id16 && current != 16)
		{
			id16 := null
		}
		if (x = id17 && current != 17)
		{
			id17 := null
		}
		if (x = id18 && current != 18)
		{
			id18 := null
		}
		if (x = id19 && current != 19)
		{
			id19 := null
		}
		if (x = id21 && current != 21)
		{
			id21 := null
		}
		if (x = id22 && current != 22)
		{
			id22 := null
		}
		if (x = id24 && current != 24)
		{
			id24 := null
		}
		if (x = id25 && current != 25)
		{
			id25 := null
		}
		if (x = id26 && current != 26)
		{
			id26 := null
		}
		if (x = id27 && current != 27)
		{
			id27 := null
		}
		if (x = id28 && current != 28)
		{
			id28 := null
		}
		if (x = id29 && current != 29)
		{
			id29 := null
		}
		if (x = id31 && current != 31)
		{
			id31 := null
		}
		if (x = id32 && current != 32)
		{
			id32 := null
		}
		if (x = id34 && current != 34)
		{
			id34 := null
		}
		if (x = id35 && current != 35)
		{
			id35 := null
		}
		if (x = id36 && current != 36)
		{
			id36 := null
		}
		if (x = id37 && current != 37)
		{
			id37 := null
		}
		if (x = id38 && current != 38)
		{
			id38 := null
		}
		if (x = id39 && current != 39)
		{
			id39 := null
		}
	return
	}
	
	swap(y)
	{
		global
		WinGetTitle, x, ahk_id %y%
		WinGetPos, xtempx, ytempx, widthtempx, heighttempx, %x%
		MouseGetPos, , , z
		WinGetTitle, y, ahk_id %z%
		swapPart2TheSqueakquel(y, z)
		WinGetPos, xtempy, ytempy, widthtempy, heighttempy, %y%
		WinMove, %x%,,      (xtempy), (ytempy), (widthtempy), (heighttempy)
		WinMove, %y%,,      (xtempx), (ytempx), (widthtempx), (heighttempx)
		WinActivate, %y%
		WinActivate, %x%
	return
	}
	
	swapPart2TheSqueakquel(i, k)
	{
		global
		no := 0
		if (i = id11)
		{
			id11 := k
			no := 11
			part3TheTrilogy(i, k)
		return
		}
		if (i = id12)
		{
			id12 := k
			no := 12
			part3TheTrilogy(i, k)
		return
		}
		if (i = id14)
		{
			id14 := k
			no := 14
			part3TheTrilogy(i, k)
		return
		}
		if (i = id15)
		{
			id15 := k
			no := 15
			part3TheTrilogy(i, k)
		return
		}
		if (i = id16)
		{
			id16 := k
			no := 16
			part3TheTrilogy(i, k)
		return
		}
		if (i = id17)
		{
			id17 := k
			no := 17
			part3TheTrilogy(i, k)
		return
		}
		if (i = id18)
		{
			id18 := k
			no := 18
			part3TheTrilogy(i, k)
		return
		}
		if (i = id19)
		{
			id19 := k
			no := 19
			part3TheTrilogy(i, k)
		return
		}
		if (i = id21)
		{
			id21 := k
			no := 21
			part3TheTrilogy(i, k)
		return
		}
		if (i = id22)
		{
			id22 := k
			no := 22
			part3TheTrilogy(i, k)
		return
		}
		if (i = id24)
		{
			id24 := k
			no := 24
			part3TheTrilogy(i, k)
		return
		}
		if (i = id25)
		{
			id25 := k
			no := 25
			part3TheTrilogy(i, k)
		return
		}
		if (i = id26)
		{
			id26 := k
			no := 26
			part3TheTrilogy(i, k)
		return
		}
		if (i = id27)
		{
			id27 := k
			no := 27
			part3TheTrilogy(i, k)
		return
		}
		if (i = id28)
		{
			id28 := k
			no := 28
			part3TheTrilogy(i, k)
		return
		}
		if (i = id29)
		{
			id29 := k
			no := 29
			part3TheTrilogy(i, k)
		return
		}
		if (i = id31)
		{
			id31 := k
			no := 31
			part3TheTrilogy(i, k)
		return
		}
		if (i = id32)
		{
			id32 := k
			no := 32
			part3TheTrilogy(i, k)
		return
		}
		if (i = id34)
		{
			id34 := k
			no := 34
			part3TheTrilogy(i, k)
		return
		}
		if (i = id35)
		{
			id35 := k
			no := 35
			part3TheTrilogy(i, k)
		return
		}
		if (i = id36)
		{
			id36 := k
			no := 36
			part3TheTrilogy(i, k)
		return
		}
		if (i = id37)
		{
			id37 := k
			no := 37
			part3TheTrilogy(i, k)
		return
		}
		if (i = id38)
		{
			id38 := k
			no := 38
			part3TheTrilogy(i, k)
		return
		}
		if (i = id39)
		{
			id39 := k
			no := 39
			part3TheTrilogy(i, k)
		return
		}
	return
	}
	
	part3TheTrilogy(q, e)
	{
		if (e = id11 && no != 11)
		{
			id11 := q
		return
		}
		if (e = id12 && no != 12)
		{
			id12 := q
		return
		}
		if (e = id14 && no != 14)
		{
			id14 := q
		return
		}
		if (e = id15 && no != 15)
		{
			id15 := q
		return
		}
		if (e = id16 && no != 16)
		{
			id16 := q
		return
		}
		if (e = id17 && no != 17)
		{
			id17 := q
		return
		}
		if (e = id18 && no != 18)
		{
			id18 := q
		return
		}
		if (e = id19 && no != 19)
		{
			id19 := q
		return
		}
		if (e = id21 && no != 21)
		{
			id21 := q
		return
		}
		if (e = id22 && no != 22)
		{
			id22 := q
		return
		}
		if (e = id24 && no != 24)
		{
			id24 := q
		return
		}
		if (e = id25 && no != 25)
		{
			id25 := q
		return
		}
		if (e = id26 && no != 26)
		{
			id26 := q
		return
		}
		if (e = id27 && no != 27)
		{
			id27 := q
		return
		}
		if (e = id28 && no != 28)
		{
			id28 := q
		return
		}
		if (e = id29 && no != 29)
		{
			id29 := q
		return
		}
		if (e = id31 && no != 31)
		{
			id31 := q
		return
		}
		if (e = id32 && no != 32)
		{
			id32 := q
		return
		}
		if (e = id34 && no != 34)
		{
			id34 := q
		return
		}
		if (e = id35 && no != 35)
		{
			id35 := q
		return
		}
		if (e = id36 && no != 36)
		{
			id36 := q
		return
		}
		if (e = id37 && no != 37)
		{
			id37 := q
		return
		}
		if (e = id38 && no != 38)
		{
			id38 := q
		return
		}
		if (e = id39 && no != 39)
		{
			id39 := q
		return
		}
	return
	}
	
	reload()
	{
		global
		FileReadLine, batchspeed, config.txt, 176
		SetBatchLines, %batchspeed%
		
		FileReadLine, hres1, config.txt, 4
		FileReadLine, vres1, config.txt, 7
		FileReadLine, dlayout1, config.txt, 10
		arrlayout1 := [1,2,3,4]
		FileReadLine, secside1, config.txt, 16
		
		FileReadLine, hres2, config.txt, 21
		FileReadLine, vres2, config.txt, 24
		FileReadLine, monitoroff2, config.txt, 27
		FileReadLine, dlayout2, config.txt, 30
		arrlayout2 := [1,2,3,4]
		FileReadLine, secside2, config.txt, 36
		
		FileReadLine, hres3, config.txt, 41
		FileReadLine, vres3, config.txt, 44
		FileReadLine, monitoroff3, config.txt, 47
		FileReadLine, dlayout3, config.txt, 50
		arrlayout3 := [1,2,3,4]
		FileReadLine, secside3, config.txt, 56
		
		FileReadLine, hbor, config.txt, 61
		FileReadLine, vbor, config.txt, 64
		FileReadLine, hborex, config.txt, 67
		FileReadLine, vborex, config.txt, 70
		
		FileReadLine, ttaskbar1, config.txt, 75
		FileReadLine, ttaskbar2, config.txt, 78
		FileReadLine, ttaskbar3, config.txt, 81
		FileReadLine, btaskbar1, config.txt, 84
		FileReadLine, btaskbar2, config.txt, 87
		FileReadLine, btaskbar3, config.txt, 90
		FileReadLine, rtaskbar1, config.txt, 93
		FileReadLine, rtaskbar2, config.txt, 96
		FileReadLine, rtaskbar3, config.txt, 99
		FileReadLine, ltaskbar1, config.txt, 102
		FileReadLine, ltaskbar2, config.txt, 105
		FileReadLine, ltaskbar3, config.txt, 108

		FileReadLine, hwindow111, config.txt, 114
		FileReadLine, hwindow122and123, config.txt, 117
		FileReadLine, vwindow122, config.txt, 120
		
		FileReadLine, hwindow211, config.txt, 125
		FileReadLine, hwindow222and223, config.txt, 128.
		FileReadLine, vwindow222, config.txt, 131
		
		FileReadLine, hwindow311, config.txt, 136
		FileReadLine, hwindow322and323, config.txt, 139
		FileReadLine, vwindow322, config.txt, 142
		
		FileReadLine, hspeed, config.txt, 148
		FileReadLine, vspeed, config.txt, 151
	
		FileReadLine, disablesound, config.txt, 157
		FileReadLine, volchange, config.txt, 160
		
		FileReadLine, disablebeep, config.txt, 165
		FileReadLine, freq, config.txt, 168
		FileReadLine, dura, config.txt, 171
		
		currentwindows1 := []
		currentwindows2 := []
		currentwindows3 := []
		
		tasktemp := null
		widthtemp := null
		heighttemp := null
		xtemp := null
		ytemp := null
		idtemp := null
		id11 := null
		id12 := null
		id14 := null
		id15 := null
		id16 := null
		id17 := null
		id18 := null
		id21 := null
		id22 := null
		id24 := null
		id25 := null
		id26 := null
		id27 := null
		id28 := null
		id31 := null
		id32 := null
		id34 := null
		id35 := null
		id36 := null
		id37 := null
		id38 := null
		volchanged := (volchange * -1)
		if (secside1 = 0)
		{
			secmulti1 := 1
		} else {
			secmulti1 := -1
		}
		if (secside2 = 0)
		{
			secmulti2 := 1
		} else {
			secmulti2 := -1
		}
		if (secside3 = 0)
		{
			secmulti3 := 1
		} else {
			secmulti3 := -1
		}
		layout1 := arrlayout1[dlayout1] * secmulti1
		if (dlayout2 != 0)
		{
			layout2 := arrlayout2[dlayout2] * secmulti2
		} else {
			layout2 := 0
		}
		if (dlayout3 != 0)
		{
			layout3 := arrlayout3[dlayout3] * secmulti3
		} else {
			layout3 := 0
		}
		maxlayout1 := arrlayout1.GetCapacity()
		maxlayout2 := arrlayout2.GetCapacity()
		maxlayout3 := arrlayout3.GetCapacity()
	return
	}
	
	layoutError(x, y)
	{
		x := Abs(x)
		MsgBox , , Layout Error, Error: Layout %x%, is not in existence on monitor %y%. Please contact me, Vibex, about this bug. My info can be found in the readme.
	}