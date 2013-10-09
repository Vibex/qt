fibonacciDwindle(mon, pos){
	global
	local temp1, temp2, temp3
	
	temp1 := Ceil(((Mon%mon%.UW - hbor) / 2))
	temp2 := Ceil(((Mon%mon%.UH - vbor) / 2))
	temp3 := Ceil(((Mon%mon%.UH - (3 * vbor)) / 4))
	if(pos = 1 || pos = 4 || pos = 7){
		WinMove, A,, (mon%mon%.L + lTask%mon% + hBor + hBorEx), (mon%mon%.T + tTask%mon% + vBor + vBorEx), (temp1), (Mon%mon%.UH)
	} else if(pos = 8 || pos = 9){
		WinMove, A,, (mon%mon%.L + lTask%mon% + (2 * hBor) + hBorEx + temp1), (mon%mon%.T + tTask%mon% + vBor + vBorEx), ((Mon%mon%.UW - hbor) / 2), (temp2)
	} else if(pos = 5 || pos = 2){
		WinMove, A,, (mon%mon%.L + lTask%mon% + (2 * hBor) + hBorEx + temp1), (mon%mon%.T + tTask%mon% + (2 * vBor) + vBorEx + temp2), ((Mon%mon%.UW - (2 * hbor)) / 4), ((Mon%mon%.UH - vbor) / 2)
	} else if(pos = 6){
		WinMove, A,, (mon%mon%.L + lTask%mon% + (3 * hBor) + hBorEx + temp1 + ((Mon%mon%.UW - (2 * hbor)) / 4)), (mon%mon%.T + tTask%mon% + (2 * vBor) + vBorEx + temp2), ((Mon%mon%.UW - (4 * hbor)) / 4), ((Mon%mon%.UH - (3 * vbor)) / 4)
	} else {
		WinMove, A,, (mon%mon%.L + lTask%mon% + (3 * hBor) + hBorEx + temp1 + ((Mon%mon%.UW - (2 * hbor)) / 4)), (mon%mon%.T + tTask%mon% + (3 * vBor) + vBorEx + temp2 + ((Mon%mon%.UH - (3 * vbor)) / 4)), ((Mon%mon%.UW - (4 * hbor)) / 4), (temp3)
	}
	return
}

#S::
{
	mode("fibonacciDwindle")
	return
}