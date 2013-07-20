	#NoTrayIcon
	#SingleInstance off
	
	Gui, +Resize
	Gui, Add, Tab, x0 y0 w560 h460 vTab, Readme|License|Hotkeys|Changelog|Bugs|Beta
	FileRead, temp, Readme.txt
	Gui, Add, Edit, x16 y20 w556 h436 ReadOnly vEdit1, %temp%
	Gui, Tab, License
	FileRead, temp, Readme\License.txt
	Gui, Add, Edit, x16 y20 w556 h436 ReadOnly vEdit2, %temp%
	Gui, Tab, Hotkeys
	FileRead, temp, Readme\Hotkeys.txt
	Gui, Add, Edit, x16 y20 w556 h436 ReadOnly vEdit3, %temp%
	Gui, Tab, Changelog
	FileRead, temp, Readme\Changelog.txt
	Gui, Add, Edit, x16 y20 w556 h436 ReadOnly vEdit4, %temp%
	Gui, Tab, Bugs
	FileRead, temp, Readme\Known Bugs.txt
	Gui, Add, Edit, x16 y20 w556 h436 ReadOnly vEdit5, %temp%
	Gui, Tab, Beta
	FileRead, temp, Readme\Beta.txt
	Gui, Add, Edit, x16 y20 w556 h436 ReadOnly vEdit6, %temp%
	Gui, Show, h360 w460, qt.pi
	Return

	GuiSize:
	{
		if ErrorLevel = 1
		{
		return
		}
		NewWidth := A_GuiWidth
		NewHeight := A_GuiHeight
		GuiControl, Move, Tab, W%NewWidth% H%NewHeight%
		NewWidth := NewWidth - 4
		NewHeight := NewHeight - 24
		GuiControl, Move, Edit1, Y22 X2 W%NewWidth% H%NewHeight%
		GuiControl, Move, Edit2, Y22 X2 W%NewWidth% H%NewHeight%
		GuiControl, Move, Edit3, Y22 X2 W%NewWidth% H%NewHeight%
		GuiControl, Move, Edit4, Y22 X2 W%NewWidth% H%NewHeight%
		GuiControl, Move, Edit5, Y22 X2 W%NewWidth% H%NewHeight%
		GuiControl, Move, Edit6, Y22 X2 W%NewWidth% H%NewHeight%
	return
	}

	GuiClose:
	ExitApp