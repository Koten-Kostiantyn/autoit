#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

Func collect_loot()

   GUICtrlSetData ($current_function,"Collecting loot")
   $status = True

   $status = clickwait_image($loot_campaign_button, "Searching campaign button...", "Campaign button found! Clicking...")

   If $status Then
	  $status = wait_for_image($loot_box, "Searching for campaing loot box...")
   EndIf


   If IsArray(findImage($loot_box_with_red_dot)) Then

	  If $status Then
		 $status = click_image($loot_box,  "Searching for campaing loot box....", "Loot box button found! Clicking...")
	  EndIf

	  If $status Then
		 $status = clickwait_image($loot_popup_claim, "Searching for ""claim"" button...", """claim"" button found! Clicking...")
	  EndIf


   EndIf

   If $status Then
	  $status = clickwait_image($loot_collect_non_shiny, "Searching for ""collect"" button...", """collect"" button found! Clicking...")
   EndIf

   If $status Then
	  $status = clickwait_image($loot_back, "Searching for ""back"" button...", """back"" button found! Clicking...")
   EndIf

   If $status Then
	  GUICtrlSetData ($current_function,"Done")
	  GUICtrlSetData ($current_task,"Done")
   Else
	  GUICtrlSetData ($current_function,"ERROR: Failed collecting loot")
   EndIf


EndFunc
