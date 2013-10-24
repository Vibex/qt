;This script is from http://www.autohotkey.com/docs/scripts/EasyWindowDrag_%28KDE%29.htm
;In the future I will slim down these scripts and make them more efficient.

#LButton::
{
	SetWinDelay, -1
	SetBatchLines, -1
	
	MouseGetPos,KDE_X1,KDE_Y1,KDE_id
	WinActivate, ahk_id %KDE_id%
	WinGetPos,KDE_WinXStart,KDE_WinYStart,,,ahk_id %KDE_id%
	KDE_WinX1 := KDE_WinXStart
	KDE_WinY1 := KDE_WinYStart
	Loop{
		GetKeyState,KDE_Button,LButton,P
		If KDE_Button = U
		{
			mon := mon(KDE_id)
			Mon%mon%.remove(KDE_id)
			break
		}
		GetKeyState, KDE_EscapeState, Escape, P
		If KDE_EscapeState = D
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

#RButton::
{
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
	Loop
	{
		GetKeyState,KDE_Button, RButton, P
		If KDE_Button = U
		{
			mon := mon(KDE_id)
			Mon%mon%.remove(KDE_id)
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

#MButton::
{
	MouseGetPos,,, id
	WinMinimize, ahk_id %id%
	return
}

~LButton & WheelUp::AltTab
~LButton & WheelDown::ShiftAltTab