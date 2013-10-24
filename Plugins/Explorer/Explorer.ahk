#H::
{
	if(toggle := !toggle){
		WinHide ahk_class Shell_TrayWnd
		WinHide Start ahk_class Button
		toggle(0)
	} else {
		WinShow ahk_class Shell_TrayWnd
		WinShow Start ahk_class Button
		toggle(1)
	}
	return
}

toggleBar(temp){
	global
	
	StringSplit, temp, temp ,`,
	togglePos := temp1
	toggleSize := temp2
	WinShow ahk_class Shell_TrayWnd
	WinShow Start ahk_class Button
	toggle(1)
	return
}

toggle(set){
	global
	local temp
	
	if(togglePos = 1){
		temp := "tTask1"
	} else if(togglePos = 2){
		temp := "bTask1"
	} else if(togglePos = 3){
		temp := "lTask1"
	} else {
		temp := "rTask1"
	}
	if(set = 0){
		%temp% -= toggleSize
	} else {
		%temp% += toggleSize
	}
	Mon1.update(vBor, hBor, vBorEx, hBorEx, tTask1, bTask1, lTask1, rTask1)
	updatePos(1)
}