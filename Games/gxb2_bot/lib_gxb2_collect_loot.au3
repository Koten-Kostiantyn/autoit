#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here

#include <ImageSearch2015.au3>
;#include <lib_global_functions.au3>




Func collect_loot()

   GUICtrlSetData ($current_function,"Collecting loot")
   $status = True

   $status = click_campaign()

   If $status Then
	  $status = wait_for_loot_box()
   EndIf


   If IsArray(findImage("loot_box_with_red_dot.png")) Then

	  If $status Then
		 $status = click_loot_box()
	  EndIf

	  If $status Then
		 $status = clickwait_popup_loot_claim()
	  EndIf


   EndIf

   If $status Then
	  $status = clickwait_collect()
   EndIf

   If $status Then
	  $status = clickwait_back()
   EndIf

   If $status Then
	  GUICtrlSetData ($current_function,"Done")
	  GUICtrlSetData ($current_task,"Done")
   Else
		 GUICtrlSetData ($current_function,"ERROR: Failed collecting loot")
   EndIf


EndFunc

Func click_campaign()
   ; Return 1 = OK, 0 = Failed Task
    GUICtrlSetData ($current_task,"Searching campaign button...")
	Local $result = findImage("loot_campaign_button.png")

	If $result = false Then
		Return 0
	 Else
	    GUICtrlSetData ($current_task,"Campaign button found! Clicking...")
		MouseMove($result[0], $result[1], 10)
		MouseClick($MOUSE_CLICK_LEFT)
		Return 1
	EndIf
EndFunc

Func wait_for_loot_box()
   ; Return 1 = OK, 0 = Failed Task
	GUICtrlSetData ($current_task,"Searching for campaing loot box...")
	$result = waitForImage("loot_box.png", 30)
	Return $result
EndFunc

Func click_loot_box()
   ; Return 1 = OK, 0 = Failed Task
	Local $result = findImage("loot_box.png")

	If $result = false Then
		Return 0
	 Else
		GUICtrlSetData ($current_task,"Loot box button found! Clicking...")
		MouseMove($result[0], $result[1], 10)
		MouseClick($MOUSE_CLICK_LEFT)
		Return 1
	EndIf

EndFunc

Func clickwait_collect()
   ; Return 1 = OK, 0 = Failed Task
	GUICtrlSetData ($current_task,"Searching for ""collect"" button...")
	waitForImage("loot_collect_non_shiny.png", 30)
	Local $result = findImage("loot_collect_non_shiny.png")

	If $result = false Then
		Return 0
	 Else
		GUICtrlSetData ($current_task,"""collect"" button found! Clicking...")
		MouseMove($result[0], $result[1], 10)
		MouseClick($MOUSE_CLICK_LEFT)
		Return 1
	EndIf

EndFunc

Func clickwait_popup_loot_claim()
   ; Return 1 = OK, 0 = Failed Task
    GUICtrlSetData ($current_task,"Searching for ""claim"" button...")
	waitForImage("loot_popup_claim.png", 30)
	Local $result = findImage("loot_popup_claim.png")

	If $result = false Then
		Return 0
	 Else
		GUICtrlSetData ($current_task,"""claim"" button found! Clicking...")
		MouseMove($result[0], $result[1], 10)
		MouseClick($MOUSE_CLICK_LEFT)
		Return 1
	EndIf

EndFunc

Func clickwait_back()
   ; Return 1 = OK, 0 = Failed Task
    GUICtrlSetData ($current_task,"Searching for ""back"" button...")
	waitForImage("loot_back.png", 30)
	Local $result = findImage("loot_back.png")

	If $result = false Then
		Return 0
	 Else
		GUICtrlSetData ($current_task,"""back"" button found! Clicking...")
		MouseMove($result[0], $result[1], 10)
		MouseClick($MOUSE_CLICK_LEFT)
		Return 1
	EndIf

EndFunc