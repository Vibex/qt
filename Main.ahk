	#NoEnv
	#SingleInstance Force
	#WinActivateForce
	SetTitleMatchMode, 3
	CoordMode, Mouse, Screen
	DetectHiddenWindows, On
	OnExit, DeathToTheScript
	
	qtVer := "0.1.0"
	
	config()
	SetBatchLines, %bspeed%
	SetWinDelay, %wspeed%
	SetKeyDelay, %kspeed%

	hWnd := WinExist()
	DllCall("RegisterShellHookWindow", UInt, hWnd)
	MsgNum := DllCall("RegisterWindowMessage", Str, "SHELLHOOK")
	OnMessage(MsgNum, "ShellMessage")
	return
	
class monitor{
	__New(aMon, aX1, aY1, aX2, aY2, aVBor, aHBor, aVBorEx, aHBorEx, aTTask, aBTask, aLTask, aRTask){
		this.MonNum := aMon
		this.L := aX1
		this.R := aX2
		this.T := aY1
		this.B := aY2
		this.W := this.R - this.L
		this.H := this.B - this.T
		
		this.update(aVBor, aHBor, aVBorEx, aHBorEx, aTTask, aBTask, aLTask, aRTask)
		
		Loop, 9
		{
			this.Mode[A_Index] := "monocle"
			this.WindowNum[A_Index] := 0
		}
		this.Workspace := 1
    }
	
	update(aVBor, aHBor, aVBorEx, aHBorEx, aTTask, aBTask, aLTask, aRTask){
		this.LBound := aHBor + aHBorEx + aLTask
		this.RBound := aHBor + aHBorEx + aRTask
		this.TBound := aVBor + aVBorEx + aTTask
		this.BBound := aVBor + aVBorEx + aBTask
		this.UW := this.W - this.LBound - this.RBound
		this.UH := this.H - this.TBound - this.BBound
	}
	
	add(aHwnd){
		this.WindowNum[this.Workspace] += 1
		this.Window[this.Workspace, this.WindowNum[this.Workspace]] := aHwnd
		updatePos(this.MonNum)
	}
	
	remove(aHwnd){
		temp := this.WindowNum[this.Workspace]
		Mode := 1
		Loop, %temp%
		{
			if(Mode = 1 && this.Window[this.Workspace, A_Index] = aHwnd){
				this.Window[this.Workspace, A_Index] := ""
				mode := 2
				continue
			} 
			if(Mode = 2){
				this.Window[this.Workspace, A_Index] := this.Window[this.Workspace, A_Index + 1]
			}
		}
		if(mode = 2)
		{
			this.Window[this.Workspace, this.WindowNum] := ""
			this.WindowNum[this.Workspace] -= 1
			updatePos(this.MonNum)
			IfWinExist, ahk_id %aHwnd%
			{
				title(2, aHwnd)
			}
		}
	}
}

winFind(mon, id){
	global
	local temp
	
	temp := Mon%mon%.WindowNum[Mon%mon%.Workspace]
	Loop, %temp%
	{
		if(Mon%mon%.Window[Mon%mon%.Workspace, A_Index] = id){
			return A_Index
		}
	}
	return 0
}

windowObj(id){
	global
	local mon
	
	mon := mon(id)
	%id%_Tag := Mon%mon%.Workspace
	Mon%mon%.add(id)
	if(titleAway = 1){
		title(1, id)
	}
	return
}

title(Mode, id){
	if(Mode = 0){
		WinSet, Style, ^0xC00000, ahk_id %id%
		WinSet, Style, ^0x800000, ahk_id %id%
	} else if(Mode = 1){
		WinSet, Style, -0xC00000, ahk_id %id%
		WinSet, Style, -0x800000, ahk_id %id%
	} else {
		WinSet, Style, +0xC00000, ahk_id %id%
		WinSet, Style, +0x800000, ahk_id %id%
	}
	WinSet, Redraw,, ahk_id %id%
	return
}

DeathToTheScript:
{
	SetBatchLines, -1
	DetectHiddenWindows, Off
	if(A_ExitReason != "Shutdown" && A_ExitReason != "Logoff"){
		WinShow, ahk_group allhiden
		WinGet, winarr, List
		Loop, %winarr%
		{
			idtemp := winarr%A_Index%
			Loop, 3
			{
				Mon%A_Index%.remove(idtemp)
			}
		}
	}
	ExitApp
	Sleep 1000
}

config(){
	global
	local temp, comment, place, cmd
	
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
			continue
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
		mon%A_Index% := new monitor(A_Index, monLeft, monTop, monRight, monBottom, vBor, hBor, vBorEx, hBorEx, tTask%A_Index%, bTask%A_Index%, lTask%A_Index%, rTask%A_Index%)
	}
	return
}

border(temp){
	global
	
	StringSplit, temp, temp ,`,
	if(temp0 = 2){
		vBor += temp1
		hBor += temp1
		vBorEx += temp2
		hBorEx += temp2
	} else if(temp0 = 4){
		vBor += temp1
		hBor += temp2
		vBorEx += temp3
		hBorEx += temp4
	}
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

mon(id = 0){
	global
	local xtemp, ytemp
	
	if(id = 0){
		MouseGetPos, xtemp,ytemp
	} else {
		WinGetPos, xtemp, ytemp,,, ahk_id %id%
	}
	Loop %monNum%{
		if(mon%A_Index%.L <= xtemp && xtemp < mon%A_Index%.R && mon%A_Index%.T <= ytemp && ytemp < mon%A_Index%.B){
			return %A_Index%
		}
	}
	return 0
}

mode(mode){
	global
	local mon, temp
	
	mon := mon()
	mon%mon%.Mode[mon%mon%.Workspace] := mode
	updatePos(mon)
	return
}

updatePos(mon){
	global
	local temp, cmd
	
	cmd := Mon%mon%.Mode[Mon%mon%.Workspace]
	temp := Mon%mon%.WindowNum[Mon%mon%.Workspace]
	Loop, %temp%
	{
		idtemp := Mon%mon%.Window[Mon%mon%.Workspace, A_Index]
		%cmd%(mon, idtemp)
	}
	return
}

#A::
{
	mode("monocle")
	return
}

monocle(mon, id){
	global
	
	WinMove, ahk_id %id%,, (Mon%mon%.L + Mon%mon%.LBound), (Mon%mon%.T + Mon%mon%.TBound), (Mon%mon%.UW), (Mon%mon%.UH)
	return
}

#Q::
{
	mode("lStack")
	return
}

lStack(mon, id){
	global
	local num, pos, panelW, panelH
	
	num := Mon%mon%.WindowNum[Mon%mon%.Workspace]
	if(num = 1){
		monocle(mon, id)
		return
	}
	panelW := (Mon%mon%.UW / lrRatio) - hBor
	panelH := ceil((Mon%mon%.UH - (vbor * (num - 2))) / (num - 1))
	pos := winFind(mon, id)
	if(pos = 1){
		WinMove, ahk_id %id%,, (Mon%mon%.L + Mon%mon%.LBound + panelW + hbor), (Mon%mon%.T + Mon%mon%.TBound), (Mon%mon%.UW - panelW - hBor), (Mon%mon%.UH)
	} else if(pos = num){
		WinMove, ahk_id %id%,, (Mon%mon%.L + Mon%mon%.LBound), (Mon%mon%.T + Mon%mon%.TBound + ((pos - 2) * (panelH + vBor))), (panelW), (Mon%mon%.UH - ((num - 2) * (panelH + vBor)))
	} else {
		WinMove, ahk_id %id%,, (Mon%mon%.L + Mon%mon%.LBound), (Mon%mon%.T + Mon%mon%.TBound + ((pos - 2) * (panelH + vBor))), (panelW), (panelH)
	}
	return
}

#R::
{
	mode("rStack")
	return
}

rStack(mon, id){
	global
	local num, pos, panelW, panelH
	
	num := Mon%mon%.WindowNum[Mon%mon%.Workspace]
	if(num = 1){
		monocle(mon, id)
		return
	}
	panelW := (Mon%mon%.UW / lrRatio) - hBor
	panelH := ceil((Mon%mon%.UH - (vbor * (num - 2))) / (num - 1))
	pos := winFind(mon, id)
	if(pos = 1){
		WinMove, ahk_id %id%,, (Mon%mon%.L + Mon%mon%.LBound), (Mon%mon%.T + Mon%mon%.TBound), (Mon%mon%.UW - panelW - hBor), (Mon%mon%.UH)
	} else if(pos = num){
		WinMove, ahk_id %id%,, (Mon%mon%.L + Mon%mon%.LBound + Mon%mon%.UW - panelW), (Mon%mon%.T + Mon%mon%.TBound + ((pos - 2) * (panelH + vBor))), (panelW), (Mon%mon%.UH - ((num - 2) * (panelH + vBor)))
	} else {
		WinMove, ahk_id %id%,, (Mon%mon%.L + Mon%mon%.LBound + Mon%mon%.UW - panelW), (Mon%mon%.T + Mon%mon%.TBound + ((pos - 2) * (panelH + vBor))), (panelW), (panelH)
	}
	return
}

#E::
{
	mode("tStack")
	return
}

tStack(mon, id){
	global
	local num, pos, panelW, panelH
	
	num := Mon%mon%.WindowNum[Mon%mon%.Workspace]
	if(num = 1){
		monocle(mon, id)
		return
	}
	panelW := ceil((Mon%mon%.UW - (hbor * (num - 2))) / (num - 1))
	panelH := (Mon%mon%.UH / tbRatio) - vBor
	pos := winFind(mon, id)
	if(pos = 1){
		WinMove, ahk_id %id%,, (Mon%mon%.L + Mon%mon%.LBound), (Mon%mon%.T + Mon%mon%.TBound + panelH + vBor), (Mon%mon%.UW), (Mon%mon%.UH - panelH - vBor)
	} else if(pos = num){
		WinMove, ahk_id %id%,, (Mon%mon%.L + Mon%mon%.LBound + ((pos - 2) * (panelW + hBor))), (Mon%mon%.T + Mon%mon%.TBound), (Mon%mon%.UW - ((num - 2) * (panelW + hBor))), (panelH)
	} else {
		WinMove, ahk_id %id%,, (Mon%mon%.L + Mon%mon%.LBound + ((pos - 2) * (panelW + hBor))), (Mon%mon%.T + Mon%mon%.TBound), (panelW), (panelH)
	}
	return
}

#W::
{
	mode("bStack")
	return
}

bStack(mon, id){
	global
	local num, pos, panelW, panelH
	
	num := Mon%mon%.WindowNum[Mon%mon%.Workspace]
	if(num = 1){
		monocle(mon, id)
		return
	}
	panelW := ceil((Mon%mon%.UW - (hbor * (num - 2))) / (num - 1))
	panelH := (Mon%mon%.UH / tbRatio) - vBor
	pos := winFind(mon, id)
	if(pos = 1){
		WinMove, ahk_id %id%,, (Mon%mon%.L + Mon%mon%.LBound), (Mon%mon%.T + Mon%mon%.TBound), (Mon%mon%.UW), (Mon%mon%.UH - panelH - vBor)
	} else if(pos = num){
		WinMove, ahk_id %id%,, (Mon%mon%.L + Mon%mon%.LBound + ((pos - 2) * (panelW + hBor))), (Mon%mon%.T + Mon%mon%.TBound + Mon%mon%.UH - panelH), (Mon%mon%.UW - ((num - 2) * (panelW + hBor))), (panelH)
	} else {
		WinMove, ahk_id %id%,, (Mon%mon%.L + Mon%mon%.LBound + ((pos - 2) * (panelW + hBor))), (Mon%mon%.T + Mon%mon%.TBound + Mon%mon%.UH - panelH), (panelW), (panelH)
	}
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

work(work){
	global
	local idtemp, mon, montemp
	
	mon := mon()
	
	Mon%mon%.Workspace := work
	WinGet, winarr, List
	Loop, %winarr%
	{
		idtemp := winarr%A_Index%
		montemp := mon(idtemp)
		if(varExist(%idtemp%_Tag) = 1 && %idtemp%_Tag != 0 && mon = montemp){
			GroupAdd, allhiden, ahk_id %idtemp%
			if(%idtemp%_Tag = work){
				WinShow, ahk_id %idtemp%
			} else {
				WinHide, ahk_id %idtemp%
			}
		}
	}
	updatePos(mon)
	return
}

varExist(ByRef v){
	return &v = &n ? 0 : v = "" ? 2 : 1
}

#Z::
{
	idtemp := WinExist("A")
	mon := mon(idtemp)
	if(winFind(mon, idtemp) = 0){
		windowObj(idtemp)
	}
	return
}

~!F4::
#X::
{
	idtemp := WinExist("A")
	Loop, %monNum%
	{
		Mon%A_Index%.remove(idtemp)
	}
	return
}

#include Plugins\Media\Media.ahk
#include Plugins\Mouse\Mouse.ahk
#include Plugins\Explorer\Explorer.ahk
#include Plugins\Split\Split.ahk
#include Plugins\Taskbar\Fnt.ahk
#include Plugins\Taskbar\Taskbar.ahk