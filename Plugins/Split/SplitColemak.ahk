#R::
{
	mode("vSplit")
	return
}

vSplit(mon, id){
	global
	local num, pos, panelW, panelH
	
	num := Mon%mon%.WindowNum[Mon%mon%.Workspace]
	if(num = 1){
		monocle(mon, id)
		return
	}
	panelW := ceil((Mon%mon%.UW - (hbor * (num - 1))) / (num))
	panelH := Mon%mon%.UH
	pos := winFind(mon, id)
	if(pos = num){
		WinMove, ahk_id %id%,, (Mon%mon%.L + Mon%mon%.LBound + ((pos - 1) * (panelW + hBor))), (Mon%mon%.T + Mon%mon%.TBound), (Mon%mon%.UW - ((num - 1) * (panelW + hBor))), (panelH)
	} else {
		WinMove, ahk_id %id%,, (Mon%mon%.L + Mon%mon%.LBound + ((pos - 1) * (panelW + hBor))), (Mon%mon%.T + Mon%mon%.TBound), (panelW), (panelH)
	}
	return
}

#S::
{
	mode("hSplit")
	return
}

hSplit(mon, id){
	global
	local num, pos, panelW, panelH
	
	num := Mon%mon%.WindowNum[Mon%mon%.Workspace]
	if(num = 1){
		monocle(mon, id)
		return
	}
	panelW := Mon%mon%.UW
	panelH := ceil((Mon%mon%.UH - (vbor * (num - 1))) / (num))
	pos := winFind(mon, id)
	if(pos = num){
		WinMove, ahk_id %id%,, (Mon%mon%.L + Mon%mon%.LBound), (Mon%mon%.T + Mon%mon%.TBound + ((pos - 1) * (panelH + vBor))), (panelW), (Mon%mon%.UH - ((num - 1) * (panelH + vBor)))
	} else {
		WinMove, ahk_id %id%,, (Mon%mon%.L + Mon%mon%.LBound), (Mon%mon%.T + Mon%mon%.TBound + ((pos - 1) * (panelH + vBor))), (panelW), (panelH)
	}
	return
}