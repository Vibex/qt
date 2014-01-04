Fnt_GetStringWidth(ignore, text){
	global monoSize
	temp := StrLen(text)
	return temp * monoSize
}