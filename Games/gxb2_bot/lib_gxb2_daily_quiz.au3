#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here

#include <ImageSearch2015.au3>
;#include <HandleImgSearch.au3>

Func daily_quiz()

   GUICtrlSetData ($current_function,"Doing daily quizzies")
   $status = True
   $extra_quiz = False

   $status = click_quiz()

   If $status Then
	  $status = wait_for_quiz_window()
   EndIf

    If $status Then
 	  $status = clickwait_buy_extra_quizzies()
    EndIf


    $extra_quiz = clickwait_adjust_extra_quizzies_number(1)


    If $extra_quiz Then
 	  $extra_quiz = clickwait_extra_quizzies_ok()
    EndIf

   If $status Then
	  While wait_for_claim(1)

		 If $status Then
			$status = clickwait_claim()
		 EndIf

		 If $status Then
			$status = clickwait_ok()
		 EndIf
	  WEnd
   EndIf

   If $status Then
	  $status = clickwait_x()
   EndIf

   If $status Then
	  GUICtrlSetData ($current_function,"Done")
	  GUICtrlSetData ($current_task,"Done")
   Else
		 GUICtrlSetData ($current_function,"ERROR: Failed doing daily quizzies!")
   EndIf


EndFunc

Func click_quiz()
   ; Return 1 = OK, 0 = Failed Task
    GUICtrlSetData ($current_task,"Searching quiz button...")
	Local $result = findImage("quiz.png")

	If $result = false Then
		Return 0
	 Else
	    GUICtrlSetData ($current_task,"Quiz button found! Clicking...")
		MouseMove($result[0], $result[1], 10)
		MouseClick($MOUSE_CLICK_LEFT)
		Return 1
	EndIf
EndFunc

Func wait_for_claim($sec = 30)
   ; Return 1 = OK, 0 = Failed Task
    GUICtrlSetData ($current_task,"Searching for ""claim"" button...")
	Return waitForImage("quiz_claim.png", $sec)
EndFunc

Func clickwait_claim()
   ; Return 1 = OK, 0 = Failed Task
    GUICtrlSetData ($current_task,"Searching for ""claim"" button...")
	waitForImage("quiz_claim.png", 30)
	Local $result = findImage("quiz_claim.png")

	If $result = false Then
		Return 0
	 Else
		GUICtrlSetData ($current_task,"""claim"" button found! Clicking...")
		MouseMove($result[0], $result[1], 10)
		MouseClick($MOUSE_CLICK_LEFT)
		Return 1
	EndIf

EndFunc

Func wait_for_quiz_window()
   ; Return 1 = OK, 0 = Failed Task
	GUICtrlSetData ($current_task,"Searching for quiz window...")
	$result = waitForImage("quiz_window.png", 30)
	Return $result
EndFunc

Func clickwait_ok()
   ; Return 1 = OK, 0 = Failed Task
	GUICtrlSetData ($current_task,"Searching for ""ok"" button...")
	waitFor_one_of_2_Images("quiz_ok_grey_middle.png","quiz_ok_grey_side.png", 30)
	Local $result = find_one_from_2_Images("quiz_ok_grey_middle.png", "quiz_ok_grey_side.png")

	If $result = false Then
		Return 0
	 Else
		GUICtrlSetData ($current_task,"""ok"" button found! Clicking...")
		MouseMove($result[0], $result[1], 10)
		MouseClick($MOUSE_CLICK_LEFT)
		Return 1
	EndIf

EndFunc

Func clickwait_x()
   ; Return 1 = OK, 0 = Failed Task
	GUICtrlSetData ($current_task,"Searching for ""X"" button...")
	waitForImage("quiz_x.png", 30)
	Local $result = findImage("quiz_x.png")

	If $result = false Then
		Return 0
	 Else
		GUICtrlSetData ($current_task,"""X"" button found! Clicking...")
		MouseMove($result[0], $result[1], 10)
		MouseClick($MOUSE_CLICK_LEFT)
		Return 1
	EndIf

EndFunc

Func clickwait_buy_extra_quizzies()
   ; Return 1 = OK, 0 = Failed Task
	GUICtrlSetData ($current_task,"Searching for ""PLUS"" button...")
	waitForImage("quiz_plus.png", 30)
	Local $result = findImage("quiz_plus.png")

	If $result = false Then
		Return 0
	 Else
		GUICtrlSetData ($current_task,"""PLUS"" button found! Clicking...")
		MouseMove($result[0], $result[1], 10)
		MouseClick($MOUSE_CLICK_LEFT)
		Return 1
	EndIf

EndFunc

Func clickwait_adjust_extra_quizzies_number($sec=30)
   ; Return 1 = OK, 0 = Failed Task
	GUICtrlSetData ($current_task,"Searching for ""FF"" button...")
	waitForImage("quiz_FF.png", $sec)
	Local $result = findImage("quiz_FF.png")

	If $result = false Then
		Return 0
	 Else
		GUICtrlSetData ($current_task,"""FF"" button found! Clicking...")
		MouseMove($result[0], $result[1], 10)
		MouseClick($MOUSE_CLICK_LEFT)
		Return 1
	EndIf

EndFunc

Func clickwait_extra_quizzies_ok()
   ; Return 1 = OK, 0 = Failed Task
	GUICtrlSetData ($current_task,"Searching for ""OK"" button...")
	waitForImage("quiz_blue_ok.png", 30)
	Local $result = findImage("quiz_blue_ok.png")

	If $result = false Then
		Return 0
	 Else
		GUICtrlSetData ($current_task,"""OK"" button found! Clicking...")
		MouseMove($result[0], $result[1], 10)
		MouseClick($MOUSE_CLICK_LEFT)
		Return 1
	EndIf

EndFunc

Func wait_for_claim_t()
   ; Return 1 = OK, 0 = Failed Task
   ; THIS IS FOR TESTING OF TOLERANCE. TOLERANCE IS SHIT
    GUICtrlSetData ($current_task,"Searching for ""claim"" button...")
	waitForImage("quiz_claim.png", 30)
	Local $result = findImage("quiz_claim.png")

	If $result = false Then
		Return 0
	 Else
		GUICtrlSetData ($current_task,"""claim"" button found! Clicking...")
		MouseMove($result[0], $result[1], 10)
		MouseClick($MOUSE_CLICK_LEFT)
		Return 1
	EndIf

EndFunc