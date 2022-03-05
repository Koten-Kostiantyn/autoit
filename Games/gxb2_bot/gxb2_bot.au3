;
; Include internal libs
#include <Constants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
;
; Include external ImageSearch Libs. Only one should be active
#include <ImageSearch2015.au3>
;#include <HandleImgSearch.au3>  ;alternative lib for image search, with tolerance
;
; Include my libs but not GXB2 specific libs
#include <lib_pictures_mapper.au3>
#include <lib_click_wait_functions.au3>
;
; Include GXB2 specific libs
#include <lib_gxb2_collect_loot.au3>
#include <lib_gxb2_daily_quiz.au3>
#include <lib_gxb2_alchemy.au3>
#include <lib_gxb2_email.au3>

Global $sleep_debug = 1000

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
   daily_quiz()
   ;clickwait_image($quiz_claim, "Searching for ""claim"" button...", """claim"" button found! Clicking...")
   alchemy()
   ;email()

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




