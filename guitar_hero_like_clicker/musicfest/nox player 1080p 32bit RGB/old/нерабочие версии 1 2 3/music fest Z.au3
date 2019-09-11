#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
#include <Constants.au3>
#include <authread.au3>
#include <Array.au3>

HotKeySet("{ESC}", "Terminate")
;HotKeySet("{f}", "fast")

_AuThread_Startup()

Func Terminate()
    Exit
 EndFunc   ;==>Terminate

; Block of color variables
   ;1 colum
   $empty1=0x172940
   $clicked1=0x1B3754
   $blueline1=0x2A4785
   $bluelineclick1=0x2C508F
   ;END 1 colum
   ;2 colum
   $empty2=0x122133
   $clicked2=0x18324D
   $blueline2=0x27417D
   $bluelineclick2=0x294B88
   ;END 2 colum
   ;3 colum
   $empty3=0x0F1D2E
   $clicked3=0x183350
   $blueline3=0x28427E
   $bluelineclick3=0x294C8A
   ;END 3 colum
   ;4 colum
   $empty4=0x1C334C
   $clicked4=0x1A3554
   $blueline4=0x2C4887
   $bluelineclick4=0x2B508F
   ;END 4 colum
   $tilecolor=0x94DAFC
   $tileclickedcolor=0x81C8F1
; END Block of color variables

; Block of ranges
   $limittop=358
   $limitbottom=418
   $serchbox1x=690
   $serchbox1y=730
   $serchbox2x=830
   $serchbox2y=870
   $serchbox3x=960
   $serchbox3y=1000
   $serchbox4x=1090
   $serchbox4y=1140
; END Block of ranges

Global $delay=180;

; Block of pixel variables
   $piempty1=1716039
   $piclicked1=2047839
   $pitile1=7321597
   $pitile1_2=3554678
   $pitile1_3=5860502
   $pitile1_4=13757693
   $pitile1_5=4344451
   $pitile1_6=9227261
   $pitile1_7=4211839
   $pitile1_8=1715782
   $pitile1_9=3620471
   $pitile1_10=2175076
   $pitile1_11=11189196
   $pitile1_12=12052733
   $pitileclicked1_1=4083852
   $pitileclicked1_2=8109297
   $piblueline1_1=2902408
   $piblueline1_2=2902665
   $piblueline1_3=2836614
   $piblueline1_4=2836354
   $piblueline1_5=2770559
   $piblueline1_6=2704508
   $pibluelineclick1_1=2970771
   $pibluelineclick1_2=2970772
   $pibluelineclick1_3=2970513
   $pibluelineclick1_4=2970254
   $pibluelineclick1_5=2904460
   $pibluelineclick1_6=2838665

; END Block of color variables

Func Search1colum($fcolor)
   PixelSearch($serchbox1x, $limittop, $serchbox1y, $limitbottom, $fcolor)
   If Not @error Then
	   Return 1
	EndIf
   If @error Then
	   Return 0
	EndIf
EndFunc;

Func Search2colum($fcolor)
   PixelSearch($serchbox2x, $limittop, $serchbox2y, $limitbottom, $fcolor)
   If Not @error Then
	   Return 1
	EndIf
   If @error Then
	   Return 0
	EndIf
 EndFunc;

 Func Search3colum($fcolor)
   PixelSearch($serchbox3x, $limittop, $serchbox3y, $limitbottom, $fcolor)
   If Not @error Then
	   Return 1
	EndIf
   If @error Then
	   Return 0
	EndIf
 EndFunc;

 Func Search4colum($fcolor)
   PixelSearch($serchbox4x, $limittop, $serchbox4y, $limitbottom, $fcolor)
   If Not @error Then
	   Return 1
	EndIf
   If @error Then
	   Return 0
	EndIf
 EndFunc;

Func pixelget1()
   $fcolor = PixelGetColor(720, 380)
   Return $fcolor
EndFunc;

Func debug1colum()
   while 1
	  $fcolor = pixelget1()
	  if $fcolor = $piempty1 Then
		 ConsoleWrite  ("empty" & @LF)
;~ 		 $hThread = _AuThread_StartThread("delayed_unclick")
	  ElseIf $fcolor = $piclicked1 Then
		 ConsoleWrite  ("clicked" & @LF)
;~ 		 $hThread = _AuThread_StartThread("delayed_unclick")
	  ElseIf $fcolor = $pitile1 Or $fcolor = $pitile1_2 Then
		 ConsoleWrite  ("tile!!!!!!!!!!!!!!!" & @LF & "!!!!!!!!!!!!!!!!!!" & @LF)
;~ 		 $hThread = _AuThread_StartThread("delayed_holdclick")
	  ElseIf $fcolor = $pitileclicked1_1 Or $fcolor = $pitileclicked1_2 Then
		 ConsoleWrite  ("~~~~~~~~~~~~~~" & @LF & "clicked tile ~~~~~~" & @LF)
;~ 		 $hThread = _AuThread_StartThread("delayed_holdclick")
	  ElseIf $fcolor = $piblueline1_1 or $fcolor = $piblueline1_2 or $fcolor = $piblueline1_3 or $fcolor = $piblueline1_4 or $fcolor = $piblueline1_5 or $fcolor = $piblueline1_6 Then
		 ConsoleWrite  ("blue??" & @LF)
	  ElseIf $fcolor = $pibluelineclick1_1 or $fcolor = $pibluelineclick1_2 or $fcolor = $pibluelineclick1_3 or $fcolor = $pibluelineclick1_4 or $fcolor = $pibluelineclick1_5 or $fcolor = $pibluelineclick1_6 Then
		 ConsoleWrite  ("&& clicked blue" & @LF)
	  Else
		 ConsoleWrite  ($fcolor & @LF)
	  EndIf
   WEnd
EndFunc;

Func colorcount()
   $f11=0
   $f12=0
   $fcounter=0
   $object_1=0
   $object_2=0
   while 1
	  $f11 = pixelget1()
	  if $f11 = $f12 Then
		 $fcounter = $fcounter + 1
	  ElseIf $f12 = $piempty1 Then
		 ConsoleWrite  ("empty was " & $fcounter & @LF)
		 $f12 = $f11
		 $fcounter = 0
		 $object_1=0 ; empty empty
	  ElseIf $f12 = $piclicked1 Then
		 ConsoleWrite  ("empty CLICKED was " & $fcounter & @LF)
		 $f12 = $f11
		 $fcounter = 0
		 $object_1=1 ; clicked empty
	  ElseIf $f12 = $pitile1 or $f12 = $pitile1_2 or $f12 = $pitile1_3 or $f12 = $pitile1_4 or $f12 = $pitile1_5 or $f12 = $pitile1_6 or $f12 = $pitile1_7 or $f12 = $pitile1_8 or $f12 = $pitile1_9 or $f12 = $pitile1_10 or $f12 = $pitile1_11 or $f12 = $pitile1_12 Then
		 ConsoleWrite  ("TILE! was " & $fcounter & @LF)
		 $f12 = $f11
		 $fcounter = 0
		 $object_1=2 ; empty tile
	  ElseIf $f12 = $piblueline1_1 or $f12 = $piblueline1_2 or $f12 = $piblueline1_3 or $f12 = $piblueline1_4 or $f12 = $piblueline1_5 or $f12 = $piblueline1_6 Then
		 ConsoleWrite  ("Blue was " & $fcounter & @LF)
		 $f12 = $f11
		 $fcounter = 0
		 $object_1=4 ; empty blue
	  ElseIf $f12 = $pibluelineclick1_1 or $f12 = $pibluelineclick1_2 or $f12 = $pibluelineclick1_3 or $f12 = $pibluelineclick1_4 or $f12 = $pibluelineclick1_5 or $f12 = $pibluelineclick1_6 Then
		 ConsoleWrite  ("Blue CLICKED was " & $fcounter & @LF)
		 $f12 = $f11
		 $fcounter = 0
		 $object_1=5 ; clicked blue
	  Else
		 ConsoleWrite  ($f12 & " was " & $fcounter & @LF)
		 $f12 = $f11
		 $fcounter = 0
	  EndIf

	  if $object_1 <> $object_2 Then
		 if ($object_1 = 0 or $object_1 = 1) and ($object_2 = 2 or $object_2 = 3) Then  ; was tile became empty
			$hThread = _AuThread_StartThread("delayed_click")
			ConsoleWrite  ("Normal click" & @LF)
		 EndIf
		 if ($object_1 = 4 or $object_1 = 5) and ($object_2 = 2 or $object_2 = 3) Then ; was tile became blue
			$hThread = _AuThread_StartThread("delayed_holdclick")
			ConsoleWrite  ("Click and hold" & @LF)
		 EndIf
		 if ($object_1 = 1 or $object_1 = 2 or $object_1 = 3) and ($object_2 = 4 or $object_2 = 5) Then ; was blue became tile
			$hThread = _AuThread_StartThread("delayed_unclick")
			ConsoleWrite  ("UNclick" & @LF)
		 EndIf
	  EndIf
	  $object_2 = $object_1
   WEnd
EndFunc;


Func debug1colum3()
   $object_1=0
   $object_2=0
   While 1
	  $fcolor_1 = pixelget1()

	  If $fcolor_1 = $piempty1 Then
		 $object_1=0 ; empty empty
	  ElseIf $fcolor_1 = $piclicked1 Then
		 $object_1=1 ; clicked empty
	  ElseIf $fcolor_1 = $pitile1 Or $fcolor_1 = $pitile1_2 Then
		 $object_1=2 ; empty tile
	  ElseIf $fcolor_1 = $pitileclicked1_1 Or $fcolor_1 = $pitileclicked1_2 Then
		 $object_1=3 ; clicked tile
	  ElseIf $fcolor_1 = $piblueline1_1 or $fcolor_1 = $piblueline1_2 or $fcolor_1 = $piblueline1_3 or $fcolor_1 = $piblueline1_4 or $fcolor_1 = $piblueline1_5 or $fcolor_1 = $piblueline1_6 Then
		 $object_1=4 ; empty blue
	  ElseIf $fcolor_1 = $pibluelineclick1_1 or $fcolor_1 = $pibluelineclick1_2 or $fcolor_1 = $pibluelineclick1_3 or $fcolor_1 = $pibluelineclick1_4 or $fcolor_1 = $pibluelineclick1_5 or $fcolor_1 = $pibluelineclick1_6 Then
		 $object_1=5 ; clicked blue
	  Else
		 ContinueLoop ; some trash
	  EndIf

#CS 	  $fcolor_2 = pixelget1()
### 	  If $fcolor_2 = $piempty1 Then
### 		 $object_2=0 ; empty empty
### 	  ElseIf $fcolor_2 = $piclicked1 Then
### 		 $object_2=1 ; clicked empty
### 	  ElseIf $fcolor_2 = $pitile1 Or $fcolor_2 = $pitile1_2 Then
### 		 $object_2=2 ; empty tile
### 	  ElseIf $fcolor_2 = $pitileclicked1_1 Or $fcolor_2 = $pitileclicked1_2 Then
### 		 $object_2=3 ; clicked tile
### 	  ElseIf $fcolor_2 = $piblueline1_1 or $fcolor_2 = $piblueline1_2 or $fcolor_2 = $piblueline1_3 or $fcolor_2 = $piblueline1_4 or $fcolor_2 = $piblueline1_5 or $fcolor_2 = $piblueline1_6 Then
### 		 $object_2=4 ; empty blue
### 	  ElseIf $fcolor_2 = $pibluelineclick1_1 or $fcolor_2 = $pibluelineclick1_2 or $fcolor_2 = $pibluelineclick1_3 or $fcolor_2 = $pibluelineclick1_4 or $fcolor_2 = $pibluelineclick1_5 or $fcolor_2 = $pibluelineclick1_6 Then
### 		 $object_2=5 ; clicked blue
### 	  Else
### 		 $object_2=3 ; clicked tile blue? maybe
### 	  EndIf
 #CE

	  if $object_1 <> $object_2 Then
		 if ($object_1 = 0 or $object_1 = 1) and ($object_2 = 2 or $object_2 = 3) Then  ; was tile became empty
			$hThread = _AuThread_StartThread("delayed_click")
			ConsoleWrite  ("Normal click" & @LF)
		 EndIf
		 if ($object_1 = 4 or $object_1 = 5) and ($object_2 = 2 or $object_2 = 3) Then ; was tile became blue
			$hThread = _AuThread_StartThread("delayed_holdclick")
			ConsoleWrite  ("Click and hold" & @LF)
		 EndIf
		 if ($object_1 = 1 or $object_1 = 2 or $object_1 = 3) and ($object_2 = 4 or $object_2 = 5) Then ; was blue became tile
			$hThread = _AuThread_StartThread("delayed_unclick")
			ConsoleWrite  ("UNclick" & @LF)
		 EndIf
	  EndIf
	  $object_2 = $object_1
   WEnd
EndFunc;

Func click_1_colum()
   while 1
	  $fcolor = pixelget1()
	  if $fcolor = $piempty1 Then
		 ConsoleWrite  ("empty" & @LF)
	  ElseIf $fcolor = $piclicked1 Then
		 ConsoleWrite  ("clicked" & @LF)
	  ElseIf $fcolor = $pitile1 Or $fcolor = $pitile1_2 Then
		 ConsoleWrite  ("tile!!!!!!!!!!!!!!!" & @LF & "!!!!!!!!!!!!!!!!!!" & @LF)
	  ElseIf $fcolor = $pitileclicked1_1 Or $fcolor = $pitileclicked1_2 Then
		 ConsoleWrite  ("~~~~~~~~~~~~~~" & @LF & "clicked tile ~~~~~~" & @LF)
	  ElseIf $fcolor = $piblueline1_1 or $fcolor = $piblueline1_2 or $fcolor = $piblueline1_3 or $fcolor = $piblueline1_4 or $fcolor = $piblueline1_5 or $fcolor = $piblueline1_6 Then
		 ConsoleWrite  ("blue??" & @LF)
	  ElseIf $fcolor = $pibluelineclick1_1 or $fcolor = $pibluelineclick1_2 or $fcolor = $pibluelineclick1_3 or $fcolor = $pibluelineclick1_4 or $fcolor = $pibluelineclick1_5 or $fcolor = $pibluelineclick1_6 Then
		 ConsoleWrite  ("&& clicked blue" & @LF)
	  Else
		 ConsoleWrite  ($fcolor & @LF)
	  EndIf
   WEnd
EndFunc;

colorcount()

Func tester()
   while 1
	  $mssg1 = Search1colum($tilecolor)
	  $mssg2 = Search2colum($tilecolor)
	  $mssg3 = Search3colum($tilecolor)
	  $mssg4 = Search4colum($tilecolor)
	  $summ=$mssg1+$mssg2+$mssg3+$mssg4
	  If $summ > 0 Then
		 ConsoleWrite  ($mssg1)
		 ConsoleWrite  ($mssg2)
		 ConsoleWrite  ($mssg3)
		 ConsoleWrite  ($mssg4)
		 ConsoleWrite  (@LF)
	  EndIf
   WEnd
EndFunc

Func clicker()
   while 1
	  $mssg1 = Search1colum($tilecolor)
	  If $mssg1 Then
		 Sleep($delay)
		 Send("Z")
	  EndIf
	  $mssg2 = Search2colum($tilecolor)
	  If $mssg2 Then
		 Sleep($delay)
		 Send("X")
	  EndIf
	  $mssg3 = Search3colum($tilecolor)
	  If $mssg3 Then
		 Sleep($delay)
		 Send("C")
	  EndIf
	  $mssg4 = Search4colum($tilecolor)
	  If $mssg4 Then
		 Sleep($delay)
		 Send("V")
	  EndIf
   WEnd
EndFunc

Func delayed_click()
   MsgBox(0, "Ne", "dfg");
   Sleep(200)
   Send("z")
EndFunc

Func delayed_holdclick()
   Sleep(200)
   Send("{z down}")
EndFunc

Func delayed_unclick()
   Sleep(200)
   Send("{z up}")
EndFunc
#CS  while 1
### 	 $k1=1;
###      $k2=1;
### 	 $k3=1;
### 																						  ;MsgBox(0, "1 while started", $k3);
### 	if ($WW == PixelGetColor(1,43)) Then
### 	   Send("{TAB}");
### 	   sleep(100);
### 	EndIf;
###
### ;~    while ($ESC <> PixelGetColor(12,12))
### ;~ 	   sleep(1);
### ;~ 	   $k1=$k1+1;
### ;~ 	   if ($k1>1000) Then
### ;~ 		  ExitLoop;
### ;~ 	   EndIf;
### ;~ 																							 ;MsgBox(0, "k1 w8 for menu", $k1);
### ;~ 	   WEnd;
###
### 	if ($ESC == PixelGetColor(12,12)) Then
### 	   MouseMove(868, 733);
### 	   sleep(100);
### 	   MouseClick("left", 868, 733, 1);
### 																							 ;MsgBox(0, "click work", $k3);
### 	   EndIf;
###
### ;~ 	while ($BE <> PixelGetColor(810,281))
### ;~ 	   sleep(1);
### ;~ 	   $k2=$k2+1;
###
### ;~ 	   if ($k2>1000) Then
### ;~ 		  ExitLoop;
### ;~ 	   EndIf;
###
### ;~ 	   if ($NE <> PixelGetColor(728, 430)) Then
### ;~ 		  ExitLoop;
### ;~ 	   EndIf;
###
### ;~ 																								;MsgBox(0, "k2 ingame counter", $k2);
### ;~ 	WEnd;
###
### 	if ($NE == PixelGetColor(728, 430)) Then
### 	   MouseMove(972, 625);
### 	   sleep(100);
### 	   MouseClick("left", 972, 625, 1);
### 																							 ;MsgBox(0, "Ne", $k3);
### 	   EndIf;
###
### 	if ($INB == PixelGetColor(3,17)) Then
### 	   MouseClick("left");
### 	  sleep(100);																						;MsgBox(0, "GAME End", $k3);
### 	   EndIf;
###
### 	  if ($BEND == PixelGetColor(1735, 1033)) Then
### 	   Send("{ESC}");
### 	   sleep(100);
### 	   MouseClick("left");
### 	   sleep(100);
### 	EndIf;
###
### 	  if ($OK == PixelGetColor(1061, 682)) Then
### 	   MouseMove(958, 691);
### 	   sleep(100);
### 	   MouseClick("left",958, 691, 1);
### 	   sleep(100);
### 	EndIf;
###
### 	if ($OK == PixelGetColor(1061, 634)) Then
### 	   MouseMove(959, 651);
### 	   sleep(100);
### 	   MouseClick("left",959, 651, 1);
### 	   sleep(100);
### 	EndIf;
###
###    if ($OK == PixelGetColor(1044, 478)) Then ;ok 3 team vs megabot
### 	   MouseMove(960, 492);
### 	   sleep(100);
### 	   MouseClick("left",960, 492, 1);
### 	   sleep(100);
### 	EndIf;
###
###    if ($OK == PixelGetColor(1052, 767)) Then ;ok 3 10vs10
### 	   MouseMove(959, 771);
### 	   sleep(100);
### 	   MouseClick("left",959, 771, 1);
### 	   sleep(100);
### 	EndIf;
###
### 	  if ($BEND2 == PixelGetColor(1735, 1033)) Then
### 	   MouseMove(958, 691);
### 	   sleep(100);
### 	   MouseClick("left",958, 691, 1);
### 	   sleep(100);
### 	EndIf;
###
### 	if ($DWL == PixelGetColor(7,378)) Then
### 	   MouseClick("left");
### 	  sleep(100);																						;MsgBox(0, "GAME End", $k3);
###    EndIf;
###
###    if ($HRB == PixelGetColor(14, 417)) Then
### 	   MouseClick("left");
### 	  sleep(100);																						;MsgBox(0, "GAME End", $k3);
### 	   EndIf;
###
### ;~    while ($WW <> PixelGetColor(1,43))
### ;~ 		 sleep(100);
### ;~ 	   MouseClick("left");
### ;~ 	   $k3=$k3+1;
### ;~ 	   if ($k3<10) Then
### ;~ 		  ExitLoop;
### ;~ 	   EndIf;
### ;~ 	   Send("{LCTRL}");
### ;~ 																									 ; MsgBox(0, "shit func work k3", $k3);
### ;~    WEnd;
###
###
### WEnd;
 #CE
