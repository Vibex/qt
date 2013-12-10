#C::
{
	if(toggleBorS = 1){
		toggleBorS := 0
		hbor := toggleBor1[1]
		vbor := toggleBor1[2]
		hborEx := toggleBor1[3]
		vborEx := toggleBor1[4]
	} else {
		toggleBorS := 1
		hbor := toggleBor2[1]
		vbor := toggleBor2[2]
		hborEx := toggleBor2[3]
		vborEx := toggleBor2[4]
	}
	Loop, %MonNum%
	{
		Mon%A_Index%.update(vBor, hBor, vBorEx, hBorEx, tTask%A_Index%, bTask%A_Index%, lTask%A_Index%, rTask%A_Index%)
		updatePos(A_Index)
	}
	return
}

toggleBor(temp){
	global 
	local place, cmd
	
	StringSplit, temp, temp, &
	Loop, 2
	{
		place := InStr(temp%A_Index%, "(") - 1
		StringLeft, cmd, temp%A_Index%, %place%
		StringReplace, temp%A_Index%, temp%A_Index%, %cmd%(
		StringTrimRight, temp%A_Index%, temp%A_Index%, 1
		toggleBor%A_Index% := %cmd%(temp%A_Index%)
	}
	hbor := toggleBor1[1]
	vbor := toggleBor1[2]
	hborEx := toggleBor1[3]
	vborEx := toggleBor1[4]
	toggleBorS := 0
	return
}