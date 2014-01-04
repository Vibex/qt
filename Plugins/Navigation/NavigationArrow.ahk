#Down::
{
	mon := mon() - 1
	if(mon < 1){
		mon := monNum
	}
	id := Mon%mon%.Window[Mon%mon%.Workspace, 1]
	WinActivate, ahk_id %id%
	mouseCenter(Mon%mon%.L, Mon%mon%.T, Mon%mon%.W, Mon%mon%.H)
	return
}

#Up::
{
	mon := mon() + 1
	if(mon > monNum){
		mon := 1
	}
	id := Mon%mon%.Window[Mon%mon%.Workspace, 1]
	WinActivate, ahk_id %id%
	mouseCenter(Mon%mon%.L, Mon%mon%.T, Mon%mon%.W, Mon%mon%.H)
	return
}

#Left::
{
	id := WinExist("A")
	mon := mon(id)
	pos := winFind(mon, id) - 1
	if(pos < 1){
		pos := Mon%mon%.WindowNum[Mon%mon%.Workspace]
	}
	id := Mon%mon%.Window[Mon%mon%.Workspace, pos]
	WinActivate, ahk_id %id%
	WinGetPos, x, y, w, h, ahk_id %id%
	mouseCenter(x, y, w, h)
	return
}

#Right::
{
	id := WinExist("A")
	mon := mon(id)
	pos := winFind(mon, id) + 1
	if(pos > Mon%mon%.WindowNum[Mon%mon%.Workspace]){
		pos := 1
	}
	id := Mon%mon%.Window[Mon%mon%.Workspace, pos]
	WinActivate, ahk_id %id%
	WinGetPos, x, y, w, h, ahk_id %id%
	mouseCenter(x, y, w, h)
	return
}

#+Left::
{
	idtemp := WinExist("A")
	monM := mon()
	monW := mon(idtemp)
	if(exclude(idtemp) = 1){
		pos := winFind(monW, idtemp)
		Mon%monW%.remove(idtemp, 1)
		if(monW != monM || pos = 0){
			genericAdd()
		} else if(pos >= 0){
			genericAdd(pos - 1)
		} else {
			genericAdd(Mon%monM%.WindowNum[Mon%monM%.Workspace])
		}
	}
	return
}

#+Right::
{
	idtemp := WinExist("A")
	monM := mon()
	monW := mon(idtemp)
	if(exclude(idtemp) = 1){
		pos := winFind(monW, idtemp)
		Mon%monW%.remove(idtemp, 1)
		if(monW != monM || pos = 0){
			genericAdd()
		} else if(pos <= Mon%monM%.WindowNum[Mon%monM%.Workspace]){
			genericAdd(pos + 1)
		} else {
			genericAdd(1)
		}
	}
	return
}

mouseCenter(x, y, w, h){
	x += (w/2)
	y += (h/2)
	DllCall("SetCursorPos", int, x, int, y)
	return
}