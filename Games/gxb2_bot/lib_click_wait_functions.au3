#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

;#include <ImageSearch2015.au3>
;#include <HandleImgSearch.au3>  ;alternative lib for image search, with tolerance



;===============================================================================
;
; Description:      loop until image is found, or until wait time is exceeded
;
; Syntax:           waitForImage
; Parameter(s):
;                   $imageFile - path to image file to search on desctop
;                   $waitSecs - time to search
;
; Return Value(s):  On Success - Returns 1 - if image is found
;                   On Failure - Returns 0
;
;
;===============================================================================
Func waitForImage($imageFile, $waitSecs = 0)
	Local $timeout = $waitSecs * 1000
	Local $startTime = TimerInit()

	;loop until image is found, or until wait time is exceeded
	While true

	    If IsDeclared("seconds_counter") Then
		   $current_second = ($timeout - TimerDiff($startTime))/1000
		   $current_second = Int($current_second)
		   GUICtrlSetData ($seconds_counter,String($current_second))
        EndIf

		If findImage($imageFile) <> false Then
			Return true
		EndIf

		If $timeout > 0 And TimerDiff($startTime) >= $timeout Then
			ExitLoop
		EndIf
		sleep(50)
	WEnd

	Return False
 EndFunc


;===============================================================================
;
; Description:      Find any of two given images on Desktop and return coordinats
;                   of first found image (center) on screen
;
; Syntax:           find_one_of_two_images
; Parameter(s):
;                   $imageFile1 - path to image file to search on desctop
;                   $imageFile2 - path to image file to search on desctop
;
; Return Value(s):  On Success - Returns [x,y] coordinats of image location (center) on desktop
;                   On Failure - Returns 0
;
;
;===============================================================================
Func find_one_of_two_images ($imageFile1, $imageFile2)

   If findImage($imageFile1) <> false Then
	  Return findImage($imageFile1)
   EndIf

   If findImage($imageFile2) <> false Then
	  Return findImage($imageFile2)
   EndIf

EndFunc


;===============================================================================
;
; Description:      loop until image is found, or until wait time is exceeded
;
; Syntax:           wait_one_of_two_images
; Parameter(s):
;                   $imageFile1 - path to image file to search on desctop
;                   $imageFile2 - path to image file to search on desctop
;                   $waitSecs - time to search
;
; Return Value(s):  On Success - Returns 1 - if image1 is found
;                   On Success - Returns 2 - if image2 is found
;                   On Failure - Returns 0
;
;
;===============================================================================
Func wait_one_of_two_images($imageFile1, $imageFile2, $message = "Oops, I forgot to set message", $waitSecs = 0)

    If IsDeclared("current_task") Then GUICtrlSetData ($current_task, $message)
	Local $timeout = $waitSecs * 1000
	Local $startTime = TimerInit()

	;loop until image is found, or until wait time is exceeded
	While true

	    If IsDeclared("seconds_counter") Then
		   $current_second = ($timeout - TimerDiff($startTime))/1000
		   $current_second = Int($current_second)
		   GUICtrlSetData ($seconds_counter,String($current_second))
        EndIf

		If findImage($imageFile1) <> false Then
			Return 1
	    EndIf

		If findImage($imageFile2) <> false Then
			Return 2
		EndIf

		If $timeout > 0 And TimerDiff($startTime) >= $timeout Then
			ExitLoop
		EndIf
		sleep(50)
	WEnd

	Return False

EndFunc




;===============================================================================
;
; Description:      Click on image at desktop screen
;
; Syntax:           click_image
; Parameter(s):
;                   $imageFile     - path to image file to search on desctop
;                   $message_start - message output to GUI (should be created separately)
;									 at script beginning. Used for debug and to know what's happening
;                   $message_good  - message output to GUI (should be created separately)
;									 when image is found. Used for debug and to know what's happening
;
; Return Value(s):  On Success - Returns 1 - if image is found, and click success
;                   On Failure - Returns 0 - image not found
;
;
;===============================================================================
Func click_image($imageFile, $message_start = "Oops, I forgot to set message 1", $message_good = "Oops, I forgot to set message 2")
    ; Return 1 = OK, 0 = Failed Task
    If IsDeclared("current_task") Then GUICtrlSetData ($current_task, $message_start)
	Local $result = findImage($imageFile)

	If $result = false Then
		Return 0
	 Else
	    If IsDeclared("current_task") Then GUICtrlSetData ($current_task, $message_good)
		MouseMove($result[0], $result[1], 10)
		MouseClick($MOUSE_CLICK_LEFT)
		Return 1
	EndIf
 EndFunc



;===============================================================================
;
; Description:      Wait for image on desctop to appear
;
; Syntax:           wait_for_image
; Parameter(s):
;                   $imageFile     - path to image file to search on desctop
;                   $message       - message output to GUI (should be created separately)
;									 at script beginning. Used for debug and to know what's happening
;                   $waitSecs      - time to search
;
; Return Value(s):  On Success - Returns 1
;                   On Failure - Returns 0
;
;
;===============================================================================
 Func wait_for_image($imageFile, $message = "Oops, I forgot to set message", $waitSecs = 30)
   ; Return 1 = OK, 0 = Failed Task
	If IsDeclared("current_task") Then GUICtrlSetData ($current_task, $message)
	$result = waitForImage($imageFile, $waitSecs)
	Return $result
 EndFunc


;===============================================================================
;
; Description:      Wait for image on desctop to appear and click it
;
; Syntax:           clickwait_image
; Parameter(s):
;                   $imageFile     - path to image file to search on desctop
;                   $message_start - message output to GUI (should be created separately)
;									 at script beginning. Used for debug and to know what's happening
;                   $message_good  - message output to GUI (should be created separately)
;									 when image is found. Used for debug and to know what's happening
;                   $waitSecs      - time to search
;
; Return Value(s):  On Success - Returns 1
;                   On Failure - Returns 0
;
;
;===============================================================================
 Func clickwait_image($imageFile, $message_start = "Oops, I forgot to set message 1", $message_good = "Oops, I forgot to set message 2", $waitSecs = 30)
   ; Return 1 = OK, 0 = Failed Task
	If IsDeclared("current_task") Then GUICtrlSetData ($current_task, $message_start)
	waitForImage($imageFile, $waitSecs)
	Local $result = findImage($imageFile)

	If $result = false Then
		Return 0
	 Else
		If IsDeclared("current_task") Then GUICtrlSetData ($current_task, $message_good)
		MouseMove($result[0], $result[1], 10)
		MouseClick($MOUSE_CLICK_LEFT)
		Return 1
	EndIf

EndFunc


;===============================================================================
;
; Description:      Wait for one of 2 images on desctop to appear and click it
;
; Syntax:           clickwait_one_of_two_images
; Parameter(s):
;                   $imageFile1    - path to image file to search on desctop
;                   $imageFile2    - path to image file to search on desctop
;                   $message_start - message output to GUI (should be created separately)
;									 at script beginning. Used for debug and to know what's happening
;                   $message_good  - message output to GUI (should be created separately)
;									 when image is found. Used for debug and to know what's happening
;                   $waitSecs      - time to search
;
; Return Value(s):  On Success - Returns 1
;                   On Failure - Returns 0
;
;
;===============================================================================
 Func clickwait_one_of_two_images($imageFile1, $imageFile2, $message_start = "Oops, I forgot to set message 1", $message_good = "Oops, I forgot to set message 2", $waitSecs = 30)
   ; Return 1 = OK, 0 = Failed Task
	If IsDeclared("current_task") Then GUICtrlSetData ($current_task, $message_start)
	wait_one_of_two_images($imageFile1, $imageFile2, $waitSecs)
	Local $result = find_one_of_two_images($imageFile1, $imageFile2)

	If $result = false Then
		Return 0
	 Else
		If IsDeclared("current_task") Then GUICtrlSetData ($current_task, $message_good)
		MouseMove($result[0], $result[1], 10)
		MouseClick($MOUSE_CLICK_LEFT)
		Return 1
	EndIf

EndFunc