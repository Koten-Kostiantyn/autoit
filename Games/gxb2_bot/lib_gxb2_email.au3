Func email()

   GUICtrlSetData ($current_function,"Checking email")
   $status = True
   $claim_or_read = 0
   $new_mail = False

   $status = wait_for_image($email, "Searching for email button...")

   If IsArray(findImage($email_red_dot)) Then

      If $status Then
         $status = clickwait_image($email_red_dot,  "Searching for email red dot...", "Email red dot found! Clicking...")
      EndIf

      If $status Then
         $status = wait_one_of_two_images($email_claim_all, $email_read_all, "Searching for ""claim\read all"" button...")
		 $claim_or_read = $status
		 $status = clickwait_one_of_two_images($email_claim_all, $email_read_all, "Searching for ""claim\read all"" button....", """claim\read all"" button found! Clicking...")
      EndIf

	  If $claim_or_read = 1  Then
		 If $status  Then
			clickwait_image($email_ok, "Searching for ""ok"" button...", """ok"" button found! Clicking...")
		 EndIf
	  EndIf

      If $status Then
         $status = clickwait_image($email_x, "Searching for ""x"" button...", """x"" button found! Clicking...")
      EndIf

   EndIf


   If $status Then
	   GUICtrlSetData ($current_function,"Done")
	   GUICtrlSetData ($current_task,"Done")
   Else
		GUICtrlSetData ($current_function,"ERROR: Failed checking email!")
   EndIf

EndFunc