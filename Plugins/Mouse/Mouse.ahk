;This script is a heavily modified version of http://www.autohotkey.com/docs/scripts/EasyWindowDrag_%28KDE%29.htm

#LButton::
{
	SetWinDelay, -1
	SetBatchLines, -1
	
	MouseGetPos, X1, Y1, id
	tiled := 0
	Loop, %monNum%
	{
		if(winFind(A_Index, id) != 0){
			tiled := A_Index
			break
		}
	}
	WinActivate, ahk_id %id%
	WinGetPos, winXStart, winYStart,winWStart,winHStart, ahk_id %id%
	WinGetPos, WinX1, WinY1,,, ahk_id %id%
	Loop{
		GetKeyState,Button,LButton,P
		If Button = U
		{
			if(Mon%tiled%.Mode[Mon%tiled%.Workspace] = "float"){
				WinGetPos, %id%_X, %id%_Y, %id%_W, %id%_H, ahk_id %id%
			}
			if(tiled != 0 && tiled = mon()){
				updatePos(tiled)
			} else if(tiled != 0){
				removeAll(id)
				genericAdd()
			} else {
				removeAll(id)
			}
			break
		}
		GetKeyState, EscapeState, Escape, P
		If EscapeState = D
		{
			WinMove, ahk_id %id%,, %winXStart%, %winYStart%, %winWStart%, %winHStart%
			break
		}
		MouseGetPos,X2,Y2
		X2 -= X1
		Y2 -= Y1
		WinX2 := (WinX1 + X2)
		WinY2 := (WinY1 + Y2)
		WinMove,ahk_id %id%,,%WinX2%,%WinY2%
	}
	return
}

#RButton::
{
	SetWinDelay, -1
	SetBatchLines, -1
	
	MouseGetPos, X1, Y1, id
	WinActivate, ahk_id %id%
	Loop, %monNum%
	{
		if(winFind(A_Index, id) != 0 && Mon%A_Index%.Mode[Mon%A_Index%.Workspace] != "float"){
			return
		}
	}
	WinGetPos, WinXStart, WinYStart, WinWStart, WinHStart, ahk_id %id%
	WinGetPos, WinX1, WinY1, WinW, WinH, ahk_id %id%
	If (X1 < WinX1 + WinW / 2)
	{
		WinLeft := 1
	} else {
		WinLeft := -1
	}
	If (Y1 < WinY1 + WinH / 2)
	{
		WinUp := 1
	} else {
		WinUp := -1
	}
	Loop
	{
		GetKeyState,Button, RButton, P
		If Button = U
		{
			Loop, %monNum%
			{
				if(winFind(A_Index, id) != 0){
					WinGetPos, %id%_X, %id%_Y, %id%_W, %id%_H, ahk_id %id%
				}
			}
			break
		}
		GetKeyState, EscapeState, Escape, P
		if EscapeState = D
		{
			WinMove, ahk_id %id%,, %WinXStart%, %WinYStart%, %WinWStart%, %WinHStart%
			break
		}
		MouseGetPos,X2,Y2
		WinGetPos,WinX1,WinY1,WinW,WinH,ahk_id %id%
		X2 -= X1
		Y2 -= Y1
		WinMove,ahk_id %id%,, WinX1 + (WinLeft+1)/2*X2 , WinY1 +  (WinUp+1)/2*Y2 , WinW - WinLeft *X2, WinH - WinUp *Y2
		X1 := (X2 + X1)
		Y1 := (Y2 + Y1)
	}
	return
}

#MButton::
{
	MouseGetPos,,, id
	WinMinimize, ahk_id %id%
	return
}

~LButton & WheelUp::AltTab
~LButton & WheelDown::ShiftAltTab