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

HotKeySet("{ESC}", "Terminate")

Func Terminate()
    Exit
 EndFunc   ;==>Terminate


Func Exit_if_game_not_found_or_unexpected_event($problem)
   ;not used anywhere, can delete later
   If $problem Then
	  problemExit()
   EndIf
EndFunc

Func problemExit()
   MsgBox($MB_SYSTEMMODAL, "", "Huiston we have a problem")
   Exit
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

   If not $game_scenario_found Then
	  problemExit()
   EndIf

EndFunc


Func main()


While 1


   ; - Search for scenarios
   search_for_game_scenario()
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