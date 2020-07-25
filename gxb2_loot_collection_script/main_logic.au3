#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         Koten_Kostiantyn

 Script Function:
	GXB2 Loot auto-collection bot.
	Script logic:

	- Check topBar(avoid red dot on blue plus), backButton,
	  Michael, Book, Leaves, Earth to make sure
	  it's GXB2 loot collecting page and not an capsule draw page LUL
   - click on "collect loot" (pepsi and gold)

	- Check if  loot red dot is present, if yes:
	  - click on loot button
	  - wait ~10~30 sec
	  - check if there loot preview window is on a screen
	  - click "Claim"
	  - wait ~10~30 sec
	  loop is done
    - wait for ~1~5~watever minute and repeat this script

	(this script will brake on level UP, would be nice to add reaction to levelups)

	would be nice to output logs in command line
	in logs show how much time was between red dots
	how many times loot was collected

	Script should instantly terminate if there is something different on screen

----------------------------------------------------------------------------
Script v2

While 1 do:
- scenario 1: check if we are in the game (loot collecting tab)
- scenario 2: check if lootbox window is open and we are on loot collecting tab
- scenario 3: check red dot


Check if any scenario exist(except 3rd), if none - exit with error

For each scenario - make it own actions
scenario 2 - close loot window
scenario 1 - nothing or collect loot
scenario 3 - check scenario 1 and click on lootbox

repeat
----------------------------------------------------------------------------

#ce ----------------------------------------------------------------------------

#include <MsgBoxConstants.au3>
#include "detecting_gxb2_campaign_tab.au3"
#include "detecting_gxb2_loot_red_dot.au3"
#include "detecting_gxb2_loot_claim_window.au3"
#include "detecting_gxb2_function_lib.au3"

HotKeySet("{ESC}", "Terminate")

Func Terminate()
    Exit
 EndFunc   ;==>Terminate

Func problemExit()
   MsgBox($MB_SYSTEMMODAL, "", "Huiston we have a problem")
   Exit
EndFunc

Global $hTimer = TimerInit()

Func TimerDiffSeconds()
   Local $fDiff = TimerDiff($hTimer)
   $fDiff = Round($fDiff/1000)
   Return $fDiff
EndFunc

Func TimerDiffHuman()
   Local $nr_sec = TimerDiffSeconds()
   $sec2time_hour = Int($nr_sec / 3600)
   $sec2time_min = Int(($nr_sec - $sec2time_hour * 3600) / 60)
   $sec2time_sec = $nr_sec - $sec2time_hour * 3600 - $sec2time_min * 60
   Return StringFormat('%02dh %02dmin %02dsec', $sec2time_hour, $sec2time_min, $sec2time_sec)
EndFunc

Func search_for_game_scenario()
   ;failsafe func, halt script if nothing to do

   Local $game_scenario_found = 0
   ;ConsoleWrite ( "Scenario 1_ " & $game_scenario_found & @CRLF )

   ; scenario 1: check if we are in the game (loot collecting tab)
   If is_gxb2_campaingn_tab() Then
	  $game_scenario_found = 1
   EndIf
   ;ConsoleWrite ( "Scenario 2_ " & $game_scenario_found & @CRLF )

   ; scenario 2: check if lootbox window is open and we are on loot collecting tab
   If is_gxb2_loot_claim_window() Then
	  $game_scenario_found = 1
   EndIf
   ;ConsoleWrite ( "Scenario 3_ " & $game_scenario_found & @CRLF )

   ; scenario 3: check red dot
   If is_gxb2_loot_red_dot() Then
	  1; do nothing
   EndIf

   ;ConsoleWrite ( "Scenario 4_ " & $game_scenario_found & @CRLF )

   If $game_scenario_found Then
	  Return 1
   Else
	  Return 0
   EndIf

EndFunc

Func multiple_search_for_game_scenario()

   Local $times_to_recheck_scenarios = 3

   Local $scenario_found = 0

   For $i = 0 to ($times_to_recheck_scenarios - 1)

	  ;ConsoleWrite ( "RECHECK outside " & $rechecks_counter & @CRLF)
	  ;ConsoleWrite ( "times to recheck  " & $times_to_recheck_scenarios & @CRLF)

	  If not $scenario_found Then
		 ConsoleWrite ( "RECHECK inside " & $i + 1 & @CRLF)
		 $scenario_found = search_for_game_scenario()
	  EndIf

   Next

   If not $scenario_found Then
	  Beep(5000,100)
	  Beep(5000,100)
	  Beep(5000,100)
	  Beep(5000,100)
	  Beep(5000,100)
	  Beep(5000,100)
	  Beep(5000,100)
	  Beep(5000,100)
	  Beep(5000,100)
	  Beep(5000,100)
	  problemExit()
   EndIf

EndFunc


Func make_a_loot_screenshot()
   Local $current_timestamp = @YEAR & "_" & @MON & "_" & @MDAY  & " " & @HOUR & "." & @MIN & "." & @SEC
   Local $time_from_script_start = TimerDiffHuman()
   Local $loot_screenshot_filename = $current_timestamp & " loot " & $time_from_script_start & " .png"
   Local $loot_screenshot_filepath = @ScriptDir & "\loot\" & $loot_screenshot_filename
   _ScreenCapture_Capture($loot_screenshot_filepath, 266, 336, 783, 778)
   1; do nothing for now
EndFunc


Func main()


While 1


   ; - Search for scenarios
   multiple_search_for_game_scenario()
   ConsoleWrite ( "Game scenario existance checked" & @CRLF )


   ; scenario 1 - do nothing or collect loot, check red dot and click on lootbox
   If is_gxb2_campaingn_tab() Then

	  ; - click on "collect loot" (pepsi and gold)
	  ConsoleWrite ( "Attempting click on Collect" & @CRLF)
	  MouseClick("left", 739, 601, 1);

	  ; - wait ~5~30 sec
	  Sleep( 5000 );

	  ; - scenario 3: check red dot and click on lootbox
	  If is_gxb2_loot_red_dot() Then
		 ConsoleWrite ( "Found a loot in lootbox" & @CRLF )

		 ; - click on loot button
		 ConsoleWrite ( "Attempting click on lootbox" & @CRLF)
		 MouseClick("left", 740, 899, 1);

		 ; - wait ~5~30 sec
		 Sleep( 5000 );
	  EndIf

   EndIf


   ; scenario 2 - close loot window
   If is_gxb2_loot_claim_window() Then

	  ; - make a loot screenshot
	  make_a_loot_screenshot()

	  ; - close loot window
	  ConsoleWrite ( "Attempting click on Claim" & @CRLF)
	  $lootClaim_pixel_color_present = 0
	  MouseClick("left", 523, 741, 1); - click "Claim"

	  ; - wait ~5~30 sec
	  Sleep( 5000 );

   EndIf

WEnd

EndFunc

main()

;Local $i = StringCompare( $topBar_pixel_1, Hex($iColor, 6) )


#cs ----------------------------------------------------------------------
If -1 Then
   MsgBox($MB_SYSTEMMODAL, "", "The -1 " ) ;this works
EndIf
If 1 Then
   MsgBox($MB_SYSTEMMODAL, "", "The 1 " ) ; this works
EndIf
If 0 Then
   MsgBox($MB_SYSTEMMODAL, "", "The 0 " ) ; this one does NOT Execute
EndIf
#ce-----------------------------------------------------------------------