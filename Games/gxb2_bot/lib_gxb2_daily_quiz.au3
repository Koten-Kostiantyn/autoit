#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

Func daily_quiz()

   GUICtrlSetData ($current_function,"Doing daily quizzies")
   $status = True
   $extra_quiz = False

   $status = clickwait_image($quiz,"Searching quiz button...", "Quiz button found! Clicking...")

   If $status Then
	  $status = wait_for_image($quiz_window, "Searching for quiz window...")
   EndIf

    If $status Then
 	  $status = clickwait_image($quiz_plus, "Searching for ""PLUS"" button...", """PLUS"" button found! Clicking...")
    EndIf


    $extra_quiz = clickwait_image($quiz_FF, "Searching for ""FF"" button...", """FF"" button found! Clicking...", 1)


    If $extra_quiz Then
 	  $extra_quiz = clickwait_image($quiz_blue_ok, "Searching for ""OK"" button...", """OK"" button found! Clicking...")
    EndIf

   If $status Then
	  While wait_for_image($quiz_claim, "Searching for ""claim"" button...", 1)

		 If $status Then
			$status = clickwait_image($quiz_claim, "Searching for ""claim"" button....", """claim"" button found! Clicking...")
		 EndIf

		 If $status Then
			$status = clickwait_one_of_two_images($quiz_ok_grey_middle,$quiz_ok_grey_side, "Searching for ""ok"" button...", """ok"" button found! Clicking...")
		 EndIf
	  WEnd
   EndIf

   If $status Then
	  $status = clickwait_image($quiz_x, "Searching for ""X"" button...", """X"" button found! Clicking...")
   EndIf

   If $status Then
	  GUICtrlSetData ($current_function,"Done")
	  GUICtrlSetData ($current_task,"Done")
   Else
		 GUICtrlSetData ($current_function,"ERROR: Failed doing daily quizzies!")
   EndIf


EndFunc
