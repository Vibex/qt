	nirOn := 1
	volU := 2000
	volD := -2000
	beepOn := 0
	return

#Insert::
{
	Send {Media_Play_Pause}
	return
}

#Home::
{
	Send {Media_Prev}
	return
}

#PgUp::
{
	Send {Media_Next}
	return
}

#If (nirOn = 1)
#NumpadAdd::
{
	sound("u")
	return
}

#If (nirOn = 1)
#NumpadEnter::
{
	sound("d")
	return
}

#If (nirOn = 1)
#NumpadSub::
{	
	sound("m")
	return
}

nircmd(temp){
	global
	
	StringSplit, temp, temp ,`,
	nirOn := 1
	volU := temp1
	volD := (-1 * temp1)
	beepOn := temp2
	if(beepOn = 1){
		beepFreq := temp3
		beepDur := temp4
	}
	return
}

sound(direc)
{
	global
	
	if (enablebeep = 1)
	{
		SoundBeep, %freq%, %dura%
	}
	if (direc = "u"){
		run nircmd.exe changesysvolume %volU%
	} else if (direc = "d"){
		run nircmd.exe changesysvolume %volD%
	} else if (direc = "m"){
		run nircmd.exe mutesysvolume 2
	}
	return
}