#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here

#include <ImageSearch2015.au3>

Func collect_loot()

   GUICtrlSetData ($current_function,"Collecting loot")

   click_campaign()
   wait_for_loot_box()

   If IsArray(findImage("loot_box_with_red_dot.png")) Then
	  click_loot_box()
	  clickwait_popup_loot_claim()
   EndIf

   clickwait_collect()
   clickwait_back()

   GUICtrlSetData ($current_function,"Done")
   GUICtrlSetData ($current_task,"Done")
EndFunc

Func click_campaign()
    GUICtrlSetData ($current_task,"Searching campaign button...")
   	;waitForImage("stats.bmp") ;search until image s found
	;waitForImage("stats_transp.bmp", 5) ;search 5 seconds for the image
	Local $result = findImage("campaign_button.png")

	If $result = false Then
		MsgBox(0, 'Error', "Image was not found on screen.")
	 Else
	    GUICtrlSetData ($current_task,"Campaign button found! Clicking...")
		MouseMove($result[0], $result[1], 10)
		MouseClick($MOUSE_CLICK_LEFT)
	EndIf
EndFunc

Func wait_for_loot_box()

	;waitForImage("stats.bmp") ;search until image s found
	;waitForImage("stats_transp.bmp", 5) ;search 5 seconds for the image
	GUICtrlSetData ($current_task,"Searching for campaing loot box...")
	waitForImage("loot_box.png", 30)
EndFunc

Func click_loot_box()

	;waitForImage("stats.bmp") ;search until image s found
	;waitForImage("stats_transp.bmp", 5) ;search 5 seconds for the image
	Local $result = findImage("loot_box.png")

	If $result = false Then
		MsgBox(0, 'Error', "Image was not found on screen.")
	 Else
		GUICtrlSetData ($current_task,"Loot box button found! Clicking...")
		MouseMove($result[0], $result[1], 10)
		MouseClick($MOUSE_CLICK_LEFT)
	EndIf

EndFunc

Func clickwait_collect()

	;waitForImage("stats.bmp") ;search until image s found
	;waitForImage("stats_transp.bmp", 5) ;search 5 seconds for the image
	GUICtrlSetData ($current_task,"Searching for ""collect"" button...")
	waitForImage("loot_collect_non_shiny.png", 30)
	Local $result = findImage("loot_collect_non_shiny.png")

	If $result = false Then
		MsgBox(0, 'Error', "Image was not found on screen.")
	 Else
		GUICtrlSetData ($current_task,"""collect"" button found! Clicking...")
		MouseMove($result[0], $result[1], 10)
		MouseClick($MOUSE_CLICK_LEFT)
	EndIf

EndFunc

Func clickwait_popup_loot_claim()
    GUICtrlSetData ($current_task,"Searching for ""claim"" button...")
	;waitForImage("stats.bmp") ;search until image s found
	;waitForImage("stats_transp.bmp", 5) ;search 5 seconds for the image
	waitForImage("loot_popup_claim.png", 30)
	Local $result = findImage("loot_popup_claim.png")

	If $result = false Then
		MsgBox(0, 'Error', "Image was not found on screen.")
	 Else
		GUICtrlSetData ($current_task,"""claim"" button found! Clicking...")
		MouseMove($result[0], $result[1], 10)
		MouseClick($MOUSE_CLICK_LEFT)
	EndIf

EndFunc

Func clickwait_back()
    GUICtrlSetData ($current_task,"Searching for ""back"" button...")
	;waitForImage("stats.bmp") ;search until image s found
	;waitForImage("stats_transp.bmp", 5) ;search 5 seconds for the image
	waitForImage("back.png", 30)
	Local $result = findImage("back.png")

	If $result = false Then
		MsgBox(0, 'Error', "Image was not found on screen.")
	 Else
		GUICtrlSetData ($current_task,"""back"" button found! Clicking...")
		MouseMove($result[0], $result[1], 10)
		MouseClick($MOUSE_CLICK_LEFT)
	EndIf

EndFunc