#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.12.0
 Author:         ﬂ‘¬“Œ–

 Script Function:
	ÀŒÃ¿≈Ã  –Œ¡Œ –¿‘“.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here

#include <Constants.au3>
HotKeySet("{END}", "Terminate")
;HotKeySet("{f}", "fast")

Func Terminate()
    Exit
 EndFunc   ;==>Terminate

$WW = 16777215;
;1P 0,43  MAIN WINDOW
$ESC = 16679953;
;2P  12,12 TAB MENU


;3P  0, 29 AND NOT TAB
$BSC = 16711422;
;4P 1,1 BATTLE START COUNTER
$BA = 623854;
;5P 0,18 BATTLE I AM ALIVE
;6P DEAD STILL BATTLE
$NE=11053224
$BE = 7171180
$OK = 16745745; ok orange space 1061, 682
;7P NOT 0,18 ENDED BATTLE PRESS OK or 810,281 GREY BATTLE STATS1
;7.1 OK BUTTON 958, 691
$DWL = 4605510;
;8P 7,378 WIN OR  LOOSE OR DESTROYED GRAY WIMDOW
$HRB = 16758563;
 ;8.1P   HEROBONUS!! 14, 417
$BEND = 14352384; RED BUTTOIN ESC IN MIDDLE BATTLE
 $BEND2 =9768719; RED ESCAPE BUTTON IN END OF BATTLE
 $INB = 623854; IN battle blue ribbon

Global $k1=1;
Global $k2=1;
Global $k3=1;

Func Allexe()

EndFunc;

;Local $i = 0
;Local $counter = 0
;Do
  ;MsgBox(0, "Value of $i is:", $WW);
  ;MsgBox(0, "Value of $i is:", PixelGetColor(1,43));
;  $counter = $counter + 1
;Until $counter = 10
;~ while (($WW <> PixelGetColor(1,43)) OR ($k3<10))
;~    MsgBox(0, "Value of $i is:", $k3)
;~ 	    MouseMove(1,1);
;~ 		sleep(100);
;~ 		MouseClick("left", 1,1, 1);
;~ 	   $k3=$k3+1;
;~   WEnd;



;~ while ($WW <> PixelGetColor(1,43))
;~ 	   sleep(1);
;~ 																						  ;MsgBox(0, "1 sleep work", $k3);
;~ 	WEnd;




 while 1
	 $k1=1;
     $k2=1;
	 $k3=1;
																						  ;MsgBox(0, "1 while started", $k3);
	if ($WW == PixelGetColor(1,43)) Then
	   Send("{TAB}");
	   sleep(100);
	EndIf;

;~    while ($ESC <> PixelGetColor(12,12))
;~ 	   sleep(1);
;~ 	   $k1=$k1+1;
;~ 	   if ($k1>1000) Then
;~ 		  ExitLoop;
;~ 	   EndIf;
;~ 																							 ;MsgBox(0, "k1 w8 for menu", $k1);
;~ 	   WEnd;

	if ($ESC == PixelGetColor(12,12)) Then
	   MouseMove(868, 733);
	   sleep(100);
	   MouseClick("left", 868, 733, 1);
																							 ;MsgBox(0, "click work", $k3);
	   EndIf;

;~ 	while ($BE <> PixelGetColor(810,281))
;~ 	   sleep(1);
;~ 	   $k2=$k2+1;

;~ 	   if ($k2>1000) Then
;~ 		  ExitLoop;
;~ 	   EndIf;

;~ 	   if ($NE <> PixelGetColor(728, 430)) Then
;~ 		  ExitLoop;
;~ 	   EndIf;

;~ 																								;MsgBox(0, "k2 ingame counter", $k2);
;~ 	WEnd;

	if ($NE == PixelGetColor(728, 430)) Then
	   MouseMove(972, 625);
	   sleep(100);
	   MouseClick("left", 972, 625, 1);
																							 ;MsgBox(0, "Ne", $k3);
	   EndIf;

	if ($INB == PixelGetColor(3,17)) Then
	  ; MouseClick("left");
	  sleep(100);																						;MsgBox(0, "GAME End", $k3);
	   EndIf;

	  if ($BEND == PixelGetColor(1735, 1033)) Then
	   Send("{ESC}");
	   sleep(100);
	   MouseClick("left");
	   sleep(100);
	EndIf;

	  if ($OK == PixelGetColor(1061, 682)) Then
	   MouseMove(958, 691);
	   sleep(100);
	   MouseClick("left",958, 691, 1);
	   sleep(100);
	EndIf;

	if ($OK == PixelGetColor(1061, 634)) Then
	   MouseMove(959, 651);
	   sleep(100);
	   MouseClick("left",959, 651, 1);
	   sleep(100);
	EndIf;

   if ($OK == PixelGetColor(1044, 478)) Then ;ok 3 team vs megabot
	   MouseMove(960, 492);
	   sleep(100);
	   MouseClick("left",960, 492, 1);
	   sleep(100);
	EndIf;

   if ($OK == PixelGetColor(1052, 767)) Then ;ok 3 10vs10
	   MouseMove(959, 771);
	   sleep(100);
	   MouseClick("left",959, 771, 1);
	   sleep(100);
	EndIf;

	  if ($BEND2 == PixelGetColor(1735, 1033)) Then
	   MouseMove(958, 691);
	   sleep(100);
	   MouseClick("left",958, 691, 1);
	   sleep(100);
	EndIf;

	if ($DWL == PixelGetColor(7,378)) Then
	   MouseClick("left");
	  sleep(100);																						;MsgBox(0, "GAME End", $k3);
   EndIf;

   if ($HRB == PixelGetColor(14, 417)) Then
	   MouseClick("left");
	  sleep(100);																						;MsgBox(0, "GAME End", $k3);
	   EndIf;

;~    while ($WW <> PixelGetColor(1,43))
;~ 		 sleep(100);
;~ 	   MouseClick("left");
;~ 	   $k3=$k3+1;
;~ 	   if ($k3<10) Then
;~ 		  ExitLoop;
;~ 	   EndIf;
;~ 	   Send("{LCTRL}");
;~ 																									 ; MsgBox(0, "shit func work k3", $k3);
;~    WEnd;


WEnd;




