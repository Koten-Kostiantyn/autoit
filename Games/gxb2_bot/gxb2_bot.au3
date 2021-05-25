#include <Constants.au3>
#include <GUIConstantsEx.au3>
#include <GXB2_collect_loot.au3>
#include <StaticConstants.au3>

GUICreate("ImageSearch demo", 300, 150)
GUICtrlCreateLabel("ImageSearch demo" & @CRLF & @CRLF & "- F9 test"& @CRLF & "- ESC exit", 10, 10, 100)
$current_function = GUICtrlCreateLabel("Current function is to be displayed here", 10, 90, 300)
$current_task = GUICtrlCreateLabel("Current task is to be displayed here", 10, 110, 300)
$seconds_counter = GUICtrlCreateLabel("0", 10, 130, 270, 17, $SS_CENTER)
GUISetState()

HotkeySet ("{F9}", test)
HotkeySet ("{ESC}", exitScript)


Func test()

   collect_loot()


EndFunc



Func exitScript()
	Exit
EndFunc


Func idle()
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				exit
		EndSwitch
		sleep(40)
	WEnd
EndFunc

idle()





