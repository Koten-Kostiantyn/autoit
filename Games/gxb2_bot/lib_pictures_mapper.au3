#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------


Func set_picture_folder($folder_setting = 1)
   Global $pictures_folder
   Switch $folder_setting
	   Case 1
		   $pictures_folder = @ScriptDir & "\pictures_web_side_fullhd\"
	   Case 2
		   $pictures_folder = @ScriptDir & "\pictures_web_center_fullhd\"
	   Case 3
		   $pictures_folder = @ScriptDir & "\pictures_nox_1280x720\"
   EndSwitch
EndFunc

set_picture_folder(1)

;
; LOOT SECTION
;
Global $loot_back = $pictures_folder & "loot_back.png"
Global $loot_box = $pictures_folder & "loot_box.png"
Global $loot_box_with_red_dot = $pictures_folder & "loot_box_with_red_dot.png"
Global $loot_campaign_button = $pictures_folder & "loot_campaign_button.png"
Global $loot_collect_non_shiny = $pictures_folder & "loot_collect_non_shiny.png"
Global $loot_popup_claim = $pictures_folder & "loot_popup_claim.png"
;
; QUIZ SECTION
;
Global $quiz = $pictures_folder & "quiz.png"
Global $quiz_blue_ok = $pictures_folder & "quiz_blue_ok.png"
Global $quiz_claim = $pictures_folder & "quiz_claim.png"
Global $quiz_FF = $pictures_folder & "quiz_FF.png"
Global $quiz_ok_grey_middle = $pictures_folder & "quiz_ok_grey_middle.png"
Global $quiz_ok_grey_side = $pictures_folder & "quiz_ok_grey_side.png"
Global $quiz_plus = $pictures_folder & "quiz_plus.png"
Global $quiz_window = $pictures_folder & "quiz_window.png"
Global $quiz_x = $pictures_folder & "quiz_x.png"
;
; ALCHEMY SECTION
;
Global $alchemy_claim_grey = $pictures_folder & "alchemy_claim_grey.png"
Global $alchemy_coin = $pictures_folder & "alchemy_coin.png"
Global $alchemy_free = $pictures_folder & "alchemy_free.png"
Global $alchemy_x = $pictures_folder & "alchemy_x.png"
Global $alchemy_ok = $pictures_folder & "alchemy_ok.png"
;
; EMAIL SECTION
;
Global $email_red_dot = $pictures_folder & "email_red_dot.png"
Global $email_claim_all = $pictures_folder & "email_claim_all.png"
Global $email_read_all = $pictures_folder & "email_read_all.png"
Global $email_x = $pictures_folder & "email_x.png"
Global $email = $pictures_folder & "email.png"
Global $email_ok = $pictures_folder & "email_ok.png"
