	#NoEnv
	#SingleInstance Force
	#WinActivateForce
	SetTitleMatchMode, 3
	CoordMode, Mouse, Screen
	DetectHiddenWindows, On
	OnExit, DeathToTheScript
	null := ""
	full := "full string"
	
	qtVer := "0.1.0"
	
	config()
	SetBatchLines, %bspeed%
	SetWinDelay, %wspeed%
	SetKeyDelay, %kspeed%

	createWindow()
	
	hWnd := WinExist()
	DllCall("RegisterShellHookWindow", UInt, hWnd)
	MsgNum := DllCall("RegisterWindowMessage", Str, "SHELLHOOK")
	OnMessage(MsgNum, "ShellMessage")
	return
	
class monitor{
	__New(aX1, aY1, aX2, aY2, aVBor, aHBor, aVBorEx, aHBorEx, aTTask, aBTask, aLTask, aRTask, aTBRatio, aLRRatio){
		this.L := aX1
		this.T := aY1
		this.R := aX2
		this.B := aY2
		this.W := this.R - this.L
		this.H := this.B - this.T
		Loop, 9
		{
			this.Mode[A_Index] := "monocle"
		}
		this.workspace := 1
		this.remove()
		
		this.usable(aVBor, aHBor, aVBorEx, aHBorEx, aTTask, aBTask, aLTask, aRTask, aTBRatio, aLRRatio)
    }
	
	usable(aVBor, aHBor, aVBorEx, aHBorEx, aTTask, aBTask, aLTask, aRTask, aTBRatio, aLRRatio){
		this.UW := this.W - aLTask - aRTask - (2 * aHBorEx) - (2 * aHBor)
		this.UH := this.H - aTTask - aBTask - (2 * aVBorEx) - (2 * aVBor)
		
		this.tbSmallH := (this.UH - ((aTBRatio - 1) * aHBor)) / aTBRatio
		this.tbSmallW := (this.UW - (2 * aVBor)) / 3
		this.tbLargeH := (aTBRatio - 1) * (this.UH / aTBRatio)b
		this.tbLargeW := this.UW
		result := mod(this.tbLargeH, 1)
		if(result != 0){
			this.tbLargeH += 1
		}
		result := mod(this.tbLargeW, 1)
		if(result != 0){
			this.tbLargeW += 1
		}
		
		this.lrSmallH := (this.UH - (2 * aHBor)) / 3
		this.lrSmallW := (this.UW - ((aLRRatio - 1) * aVBor)) / aLRRatio
		this.lrLargeH := this.UH
		this.lrLargeW := (aLRRatio - 1) * (this.UW / aLRRatio)
		result := mod(this.lrLargeH, 1)
		if(result != 0){
			this.lrLargeH += 1
		}
		result := mod(this.lrLargeW, 1)
		if(result != 0){
			this.lrLargeW += 1
		}
	}
	
	remove(aHwnd = "all"){
		Loop, 9
		{
			work := A_Index
			Loop, 9
			{
				pos := A_Index
				if(aHwnd = "all" || this.Grid[work, pos] = aHwnd){
					this.Grid[work, pos] := ""
				}
			}
		}
	}
	
	set(pos, aHwnd){
		this.Grid[this.workspace, pos] := aHwnd
	}
}

class window{
    __New(aHwnd, aTitle){
		this.Hwnd := aHwnd
		WinGetClass, class, ahk_id %aHwnd%
		this.Title := 1
		if(aTitle = 1 && exclusion(class) = 1){
			this.titleAway()
		}
		this.OnTop := 0
		this.Initialized := 1
    }
	
	titleAway(Force = 0){
		temp := this.Hwnd
		if(this.Title = 1 && Force = 0){
			WinSet, Style, -0xC00000, ahk_id %temp%
			WinSet, Style, -0x800000, ahk_id %temp%
			this.Title := 0
		} else {
			WinSet, Style, +0xC00000, ahk_id %temp%
			WinSet, Style, +0x800000, ahk_id %temp%
			this.Title := 1
		}
		WinSet, Redraw,, ahk_id %temp%
	}
}

DeathToTheScript:
{
	SetBatchLines, -1
	DetectHiddenWindows, Off
	if(A_ExitReason != "Shutdown" && A_ExitReason != "Logoff"){
		WinShow, ahk_group allhiden
	}
	
	if(A_ExitReason != "Shutdown" && A_ExitReason != "Logoff" && A_ExitReason != "reload"){
		WinGet, winarr ,List
		Loop, %winarr%
		{
			idtemp := winarr%A_Index%
			WinGetClass, class, ahk_id %idtemp%
			if (exclusion(class) = 1)
			{
				%idtemp%.titleAway(1)
			}
		}
	}
	ExitApp
	Sleep 1000
}
	
ShellMessage(wParam, lParam){
	Global
	
	SetBatchLines, -1
	if(wParam = 1){
		;Window created
		%lParam% := new window(lParam, titleAway)
	} else if (wParam = 4){
		;Window active
	}
	return
}

config(){
	global
	local temp, paramError, paramErrorNum, comment, place, cmd
	
	vBor := 0
	hBor := 0
	vBorEx := 0
	hBorEx := 0
	
	titleAway := 0
	
	bSpeed := "10ms"
	wSpeed := 100
	kSpeed := 10
	
	tbRatio := 3
	lrRatio := 3
	
	exclusion("BlackboxClass,bbSlit,bbLeanBar,bbIconBox,Progman,Shell_TrayWnd,DV2ControlHost,Button")
	
	SysGet, monNum, MonitorCount
	Loop, %monNum%
	{
		tTask%A_Index% := 0
		bTask%A_Index% := 0
		lTask%A_Index% := 0
		rTask%A_Index% := 0
	}
	
	Loop, Read, Data\config.txt
	{
		temp := A_LoopReadLine
		comment := InStr(temp, ";")
		place := InStr(temp, "(")
		if(comment = 1){
			break
		} else if(place != 0){
			place -= 1
			StringLeft, cmd, temp, %place%
			StringReplace, temp, temp, %cmd%(
			StringTrimRight, temp, temp, 1
			%cmd%(temp)
		}
	}
	
	Loop, %monNum%{
		SysGet, mon, Monitor, %A_Index%
		mon%A_Index% := new monitor(monLeft, monTop, monRight, monBottom, vBor, hBor, vBorEx, hBorEx, tTask%A_Index%, bTask%A_Index%, lTask%A_Index%, rTask%A_Index%, tbRatio, lrRatio)
	}
	return
}

border(temp){
	global
	
	StringSplit, temp, temp ,`,
	vBor := temp1
	hBor := temp2
	vBorEx := temp3
	hBorEx := temp4
	return
}

taskbar(temp){
	global
	
	StringSplit, temp, temp ,`,
	tTask%temp1% += temp2
	bTask%temp1% += temp3
	lTask%temp1% += temp4
	rTask%temp1% += temp5
	return
}

removeTitle(temp){
	global
	
	titleAway := 1
	return
}

exclusions(temp){
	global
	
	StringSplit, exclusion, temp ,`,
	return
}

speed(temp){
	global
	
	StringSplit, temp, temp ,`,
	bSpeed := temp1
	wSpeed := temp2
	kSpeed := temp3
	return
}

stack(temp){
	global
	
	StringSplit, temp, temp ,`,
	tbRatio := temp1
	lrRatio := temp2
	return
}

negBorder(temp){
	global
	
	StringSplit, temp, temp ,`,
	vBor := -1 * temp1
	hBor := -1 * temp1
	vBorEx := temp1
	hBorEx := temp1
	return
}

createWindow(){
	global
	local winarr, idtemp
	
	DetectHiddenWindows, Off
	WinGet, winarr ,List
	Loop, %winarr%
	{
		idtemp := winarr%A_Index%
		%idtemp% := := new window(idtemp, titleAway)
	}
	return
}

exclusion(class){
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

mon(){
	global
	local xtemp, ytemp
	
	MouseGetPos, xtemp,ytemp
	Loop %monNum%{
		if(mon%A_Index%.L <= xtemp && xtemp < mon%A_Index%.R && mon%A_Index%.T <= ytemp && ytemp < mon%A_Index%.B){
			return %A_Index%
		}
	}
	return 0
}

move(pos){
	global
	local mon, mode, idtemp
	
	mon := mon()
	mode := mon%mon%.Mode[mon%mon%.workspace]
	idtemp := WinExist("A")
	Loop, %monNum%
	{
		Mon%A_Index%.remove(idtemp)
	}
	%mode%(mon, pos)
	Mon%mon%.set(pos, idtemp)
	return
}

bStack(mon, pos){
	global
	local temp, temp2
	
	temp := Ceil(mon%mon%.tbSmallW)
	temp2 := Ceil(mon%mon%.tbSmallH)
	if(pos = 1 || pos = 2 || pos = 3){
		if(pos = 1){
			WinMove, A,, (mon%mon%.L + lTask%mon% + hBor + hBorEx), (mon%mon%.T + tTask%mon% + (2 * vBor) + vBorEx + mon%mon%.tbLargeH), (temp), (temp2)
		} else if(pos = 2){
			WinMove, A,, (mon%mon%.L + lTask%mon% + (2 * hBor) + hBorEx + temp), (mon%mon%.T + tTask%mon% + (2 * vBor) + vBorEx + mon%mon%.tbLargeH), (mon%mon%.tbSmallW), (temp2)
		} else {
			WinMove, A,, (mon%mon%.L + lTask%mon% + (3 * hBor) + hBorEx + temp + mon%mon%.tbSmallW), (mon%mon%.T + tTask%mon% + (2 * vBor) + vBorEx + mon%mon%.tbLargeH), (mon%mon%.tbSmallW), (temp2)
		}
	} else {
		WinMove, A,, (mon%mon%.L + lTask%mon% + hBor + hBorEx), (mon%mon%.T + tTask%mon% + vBor + vBorEx), (mon%mon%.tbLargeW), (mon%mon%.tbLargeH)
	}
	return
}

tStack(mon, pos){
	global
	local temp, temp2
	
	temp := Ceil(mon%mon%.tbSmallW)
	temp2 := Ceil(mon%mon%.tbSmallH)
	if(pos = 7 || pos = 8 || pos = 9){
		if(pos = 7){
			WinMove, A,, (mon%mon%.L + lTask%mon% + hBor + hBorEx), (mon%mon%.T + tTask%mon% + vBor + vBorEx), (temp), (temp2)
		} else if(pos = 8){
			WinMove, A,, (mon%mon%.L + lTask%mon% + (2 * hBor) + hBorEx + temp), (mon%mon%.T + tTask%mon% + vBor + vBorEx), (mon%mon%.tbSmallW), (temp2)
		} else {
			WinMove, A,, (mon%mon%.L + lTask%mon% + (3 * hBor) + hBorEx + temp + mon%mon%.tbSmallW), (mon%mon%.T + tTask%mon% + vBor + vBorEx), (mon%mon%.tbSmallW), (temp2)
		}
	} else {
		WinMove, A,, (mon%mon%.L + lTask%mon% + hBor + hBorEx), (mon%mon%.T + tTask%mon% + (2 * vBor) + vBorEx + temp2), (mon%mon%.tbLargeW), (mon%mon%.tbLargeH)
	}
	return
}

lStack(mon, pos){
	global
	local temp, temp2
	
	temp := Ceil(mon%mon%.lrSmallW)
	temp2 := Ceil(mon%mon%.lrSmallH)
	if(pos = 1 || pos = 4 || pos = 7){
		if(pos = 1){
			WinMove, A,, (mon%mon%.L + lTask%mon% + hBor + hBorEx), (mon%mon%.T + tTask%mon% + (3 * vBor) + vBorEx + temp2 + mon%mon%.lrSmallH), (temp), (mon%mon%.lrSmallH)
		} else if(pos = 4){
			WinMove, A,, (mon%mon%.L + lTask%mon% + hBor + hBorEx), (mon%mon%.T + tTask%mon% + (2 * vBor) + vBorEx + temp2), (temp), (mon%mon%.lrSmallH)
		} else {
			WinMove, A,, (mon%mon%.L + lTask%mon% + hBor + hBorEx), (mon%mon%.T + tTask%mon% + vBor + vBorEx), (temp), (temp2)
		}
	} else {
		WinMove, A,, (mon%mon%.L + lTask%mon% + (2 * hBor) + hBorEx + temp), (mon%mon%.T + tTask%mon% + vBor + vBorEx), (mon%mon%.lrLargeW), (mon%mon%.lrLargeH)
	}
	return
}

rStack(mon, pos){
	global
	local temp, temp2
	
	temp := Ceil(mon%mon%.lrSmallW)
	temp2 := Ceil(mon%mon%.lrSmallH)
	if(pos = 3 || pos = 6 || pos = 9){
		if(pos = 3){
			WinMove, A,, (mon%mon%.L + lTask%mon% + (2 * hBor) + hBorEx + mon%mon%.lrLargeW), (mon%mon%.T + tTask%mon% + (3 * vBor) + vBorEx + temp2 + mon%mon%.lrSmallH), (temp), (mon%mon%.lrSmallH)
		} else if(pos = 6){
			WinMove, A,, (mon%mon%.L + lTask%mon% + (2 * hBor) + hBorEx + mon%mon%.lrLargeW), (mon%mon%.T + tTask%mon% + (2 * vBor) + vBorEx + temp2), (temp), (mon%mon%.lrSmallH)
		} else {
			WinMove, A,, (mon%mon%.L + lTask%mon% + (2 * hBor) + hBorEx + mon%mon%.lrLargeW), (mon%mon%.T + tTask%mon% + vBor + vBorEx), (temp), (temp2)
		}
	} else {
		WinMove, A,, (mon%mon%.L + lTask%mon% + hBor + hBorEx), (mon%mon%.T + tTask%mon% + vBor + vBorEx), (mon%mon%.lrLargeW), (mon%mon%.lrLargeH)
	}
	return
}

monocle(mon, pos){
	global
	
	WinMove, A,, (mon%mon%.L + lTask%mon% + hBor + hBorEx), (mon%mon%.T + tTask%mon% + vBor + vBorEx), (mon%mon%.UW), (mon%mon%.UH)
	return	
}

mode(mode){
	global
	local mon
	
	mon := mon()
	mon%mon%.Mode[mon%mon%.workspace] := mode
	return
}

#Q::
{
	mode("lStack")
	return
}

#W::
{
	mode("bStack")
	return
}

#E::
{
	mode("tStack")
	return
}

#R::
{
	mode("rStack")
	return
}

#A::
{
	mode("monocle")
	return
}

#NumpadHome::
{
	move(7)
	return
}

#NumpadUp::
{
	move(8)
	return
}

#NumpadPgUp::
{
	move(9)
	return
}

#NumpadLeft::
{
	move(4)
	return
}

#NumpadClear::
{
	move(5)
	return
}

#NumpadRight::
{
	move(6)
	return
}

#NumpadEnd::
{
	move(1)
	return
}

#NumpadDown::
{
	move(2)
	return
}

#NumpadPgDn::
{
	move(3)
	return
}

~!F4::
{
	idtemp := WinExist("A")
	%idtemp% := null
	return
}

#1::
{
	work(1)
	return
}

#2::
{
	work(2)
	return
}

#3::
{
	work(3)
	return
}

#4::
{
	work(4)
	return
}

#5::
{
	work(5)
	return
}

#6::
{
	work(6)
	return
}

#7::
{
	work(7)
	return
}

#8::
{
	work(8)
	return
}

#9::
{
	work(9)
	return
}

#NumLock::
{
	
	return
}

#NumpadDiv::
{
	idtemp := WinExist("A")
	%idtemp%.titleAway()
	return
}

#NumpadMult::
{
	
	return
}

work(work){
	global
	local mon, oldWork, temp
	
	mon := mon()
	oldWork := mon%mon%.workSpace
	if(oldWork != work){
		mon%mon%.workSpace := work
		Loop, 9
		{
			temp := Mon%mon%.Grid[work, A_Index]
			GroupAdd, allhiden, ahk_id %temp%
			WinShow, ahk_id %temp%
		}
		Loop, 9
		{
			temp := Mon%mon%.Grid[oldWork, A_Index]
			GroupAdd, allhiden, ahk_id %temp%
			WinHide, ahk_id %temp%
		}
	}
	return
}