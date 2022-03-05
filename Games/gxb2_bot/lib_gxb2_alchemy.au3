#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

Func alchemy()

   GUICtrlSetData ($current_function,"Doing Alchemy")
   $status = True
   $free = 0

   $status = clickwait_image($alchemy_coin, "Searching for golden coin...", "Golden coin found! Clicking...")

   If $status Then
	  $status = wait_one_of_two_images($alchemy_free, $alchemy_claim_grey, "Searching for ""claim\free"" button...")
	  $free = $status
	  $status = clickwait_one_of_two_images($alchemy_free, $alchemy_claim_grey, "Searching for ""claim\free"" button....", """claim"" button found! Clicking...")
   EndIf

   If $free = 1 Then
	  If $status Then
		 $status = clickwait_image($alchemy_ok, "Searching for ""ok"" button...", """ok"" button found! Clicking...")
	  EndIf
   EndIf

   If $status Then
	  $status = clickwait_image($alchemy_x, "Searching for ""x"" button...", """x"" button found! Clicking...")
   EndIf

   If $status Then
	  GUICtrlSetData ($current_function,"Done")
	  GUICtrlSetData ($current_task,"Done")
   Else
	  GUICtrlSetData ($current_function,"ERROR: Failed doing alchemy")
   EndIf


EndFunc