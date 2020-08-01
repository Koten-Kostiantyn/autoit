#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         Koten Kostiantyn
 Github:         https://github.com/Koten-Kostiantyn/autoit/tree/master/gxb2_loot_collection_script

 Script Function:
   GXB2 Loot auto-collection bot.
----------------------------------------------------------------------------
 Script logic:

   Continiously search for one of these scenarios:
	  - scenario 1: We are on loot collecting tab
	  - scenario 2: We are on loot collecting tab but lootbox window is open
	  - scenario 3: We are on loot collecting tab and lootbox red dot is present

	  - fail scenario 1: If 1st or 2nd scenario is not found
	  - fail scenario 2: If 1st or 2nd scenario is not found 3 TIMES IN A ROW

   Scenario acrions:
	  - scenario 1: Click on "collect" button
	  - scenario 2: Screenshot a lootbox window, click on "claim" button
	  - scenario 3: Click on lootbox

	  - fail scenario 1: Make a screenshot and write a debug logs         (also make a low beep)
	  - fail scenario 2: Terminate script                                 (also make a series of hi beeps)
----------------------------------------------------------------------------
 Known bugs:
	  - 1: If relogin window appears, this will cause making screenshots every 5 seconds and script won't stop
	  - 2: If game freeze, script wil also make a screenchot and constantly click on place where "claim" button should be
	  - 3: Sometimes pixels maps randomly changes it's colors, thus it triggers 'fail scenario 1', this is the reason why 'fail scenario 2' exist
	  - 4: If the game ask for restart - skript will terminate
	  - 5: Unknown behaviour at level up or other unexpected scenarios
----------------------------------------------------------------------------
 TBD:
	  - Nicer logs output
	  - Fix bug №1 №2
	  - Add more scenarios
	  - More detailed log for loot drop (time between loot drops, times loot collected, loot drop rate)
#ce ------------------------------------------------------------------------

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
		 ConsoleWrite ( "Scenario search attempt - " & $i + 1 & @CRLF)
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