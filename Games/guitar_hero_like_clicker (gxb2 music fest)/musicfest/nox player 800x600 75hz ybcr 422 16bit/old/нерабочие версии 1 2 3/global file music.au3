#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
#include <Constants.au3>
#include <authread.au3>

HotKeySet("{ESC}", "Terminate")
;HotKeySet("{f}", "fast")

_AuThread_Startup()

Func Terminate()
    Exit
 EndFunc   ;==>Terminate

; Block of pixel variables
   $piempty1=1716040
   $piclicked1=2047840
   $pitile1=4211839
   $pitile1_2=9227261
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

; Block of pixel variables
   $piempty2=858666
   $piclicked2=1322568
   $pitile2=3029103
   $pitile2_2=1384755
   $pitile2_3=16711423
   $pitileclicked2_1=3098239
   $pitileclicked2_2=14083571
   $pitileclicked2_3=1717071
   $piblueline2_1=2901116
   $piblueline2_2=2572669
   $piblueline2_3=2506617
   $piblueline2_4=2440565
   $piblueline2_5=2308976
   $piblueline2_6=2243180
   $pibluelineclick2_1=3035017
   $pibluelineclick2_2=2706567
   $pibluelineclick2_3=2640516
   $pibluelineclick2_4=3231889
   $pibluelineclick2_5=9884145
   $pibluelineclick2_6=2767718
   $pibluelineclick2_7=2443389
; END Block of color variables

; Block of pixel variables
   $piempty3=1121838
   $piclicked3=1519947
   $pitile3=5861029
   $pitile3_2=2175077
   $pitile3_3=2175077
   $pitileclicked3_1=5403051
   $pitileclicked3_2=2441335
   $pitileclicked3_3=2441335
   $piblueline3_1=2704254
   $piblueline3_2=2638202
   $piblueline3_3=2506614
   $piblueline3_4=2440562
   $piblueline3_5=2374766
   $piblueline3_6=2374766
   $pibluelineclick3_1=2838411
   $pibluelineclick3_2=2772360
   $pibluelineclick3_3=2706565
   $pibluelineclick3_4=2640514
   $pibluelineclick3_5=2574718
   $pibluelineclick3_6=2574718
   $pibluelineclick3_7=2574718
; END Block of color variables

; Block of pixel variables
   $piempty4=1782346
   $piclicked4=2113889
   $pitile4=5861029
   $pitile4_2=2175077
   $pitile4_3=8689858
   $pitileclicked4_1=5403051
   $pitileclicked4_2=2441335
   $pitileclicked4_3=7640002
   $piblueline4_1=2968457
   $piblueline4_2=2902406
   $piblueline4_3=2506614
   $piblueline4_4=2440562
   $piblueline4_5=2374766
   $piblueline4_6=2836611
   $piblueline4_7=2770816
   $piblueline4_8=2705020
   $pibluelineclick4_1=3036564
   $pibluelineclick4_2=2970770
   $pibluelineclick4_3=2970511
   $pibluelineclick4_4=2904717
   $pibluelineclick4_5=2838922
   $pibluelineclick4_6=2838922
   $pibluelineclick4_7=2838922
; END Block of color variables

Func pixelget1()
   $fcolor = PixelGetColor(720, 380)
   Return $fcolor
EndFunc;

Func pixelget2()
   $fcolor = PixelGetColor(857, 380)
   Return $fcolor
EndFunc;

Func pixelget3()
   $fcolor = PixelGetColor(1032, 380)
   Return $fcolor
EndFunc;

Func pixelget4()
   $fcolor = PixelGetColor(1165, 380)
   Return $fcolor
EndFunc;

Func debug1colum2C()
   $object1_1=0
   $object1_2=0
   $object2_1=0
   $object2_2=0
   $object3_1=0
   $object3_2=0
   $object4_1=0
   $object4_2=0

   While 1
   $fcolor_1 = pixelget1()
   $fcolor_2 = pixelget2()
   $fcolor_3 = pixelget3()
   $fcolor_4 = pixelget4()

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

								  If $fcolor_2 = $piempty2 Then
									 $object_1=0 ; empty empty
								  ElseIf $fcolor_2 = $piclicked2 Then
									 $object_1=1 ; clicked empty
								  ElseIf $fcolor_2 = $pitile2 Or $fcolor_2 = $pitile2_2 or $fcolor_2 = $pitile2_3 Then
									 $object_1=2 ; empty tile
								  ElseIf $fcolor_2 = $pitileclicked2_1 Or $fcolor_2 = $pitileclicked2_2 or $fcolor_2 = $pitileclicked2_3 Then
									 $object_1=3 ; clicked tile
								  ElseIf $fcolor_2 = $piblueline2_1 or $fcolor_2 = $piblueline2_2 or $fcolor_2 = $piblueline2_3 or $fcolor_2 = $piblueline2_4 or $fcolor_2 = $piblueline2_5 or $fcolor_2 = $piblueline2_6 Then
									 $object_1=4 ; empty blue
								  ElseIf $fcolor_2 = $pibluelineclick2_1 or $fcolor_2 = $pibluelineclick2_2 or $fcolor_2 = $pibluelineclick2_3 or $fcolor_2 = $pibluelineclick2_4 or $fcolor_2 = $pibluelineclick2_5 or $fcolor_2 = $pibluelineclick2_6 or $fcolor_2 = $pibluelineclick2_7 Then
									 $object_1=5 ; clicked blue
								  Else
									 ContinueLoop ; some trash
								  EndIf

								  If $fcolor_3 = $piempty3 Then
									 $object3_1=0 ; empty empty
								  ElseIf $fcolor_3 = $piclicked3 Then
									 $object3_1=1 ; clicked empty
								  ElseIf $fcolor_3 = $pitile3 Or $fcolor_3 = $pitile3_2 or $fcolor_3 = $pitile3_3 Then
									 $object3_1=2 ; empty tile
								  ElseIf $fcolor_3 = $pitileclicked3_1 Or $fcolor_3 = $pitileclicked3_2 or $fcolor_3 = $pitileclicked3_3 Then
									 $object3_1=3 ; clicked tile
								  ElseIf $fcolor_3 = $piblueline3_1 or $fcolor_3 = $piblueline3_2 or $fcolor_3 = $piblueline3_3 or $fcolor_3 = $piblueline3_4 or $fcolor_3 = $piblueline3_5 or $fcolor_3 = $piblueline3_6 Then
									 $object3_1=4 ; empty blue
								  ElseIf $fcolor_3 = $pibluelineclick3_1 or $fcolor_3 = $pibluelineclick3_2 or $fcolor_3 = $pibluelineclick3_3 or $fcolor_3 = $pibluelineclick3_4 or $fcolor_3 = $pibluelineclick3_5 or $fcolor_3 = $pibluelineclick3_6 or $fcolor_3 = $pibluelineclick3_7 Then
									 $object3_1=5 ; clicked blue
								  Else
									 ContinueLoop ; some trash
								  EndIf

								  If $fcolor_4 = $piempty4 Then
									 $object_1=0 ; empty empty
								  ElseIf $fcolor_4 = $piclicked4 Then
									 $object_1=1 ; clicked empty
								  ElseIf $fcolor_4 = $pitile4 Or $fcolor_4 = $pitile4_2 or $fcolor_4 = $pitile4_3 Then
									 $object_1=2 ; empty tile
								  ElseIf $fcolor_4 = $pitileclicked4_1 Or $fcolor_4 = $pitileclicked4_2 or $fcolor_4 = $pitileclicked4_3 Then
									 $object_1=3 ; clicked tile
								  ElseIf $fcolor_4 = $piblueline4_1 or $fcolor_4 = $piblueline4_2 or $fcolor_4 = $piblueline4_3 or $fcolor_4 = $piblueline4_4 or $fcolor_4 = $piblueline4_5 or $fcolor_4 = $piblueline4_6 or $fcolor_4 = $piblueline4_7 or $fcolor_4 = $piblueline4_8 Then
									 $object_1=4 ; empty blue
								  ElseIf $fcolor_4 = $pibluelineclick4_1 or $fcolor_4 = $pibluelineclick4_2 or $fcolor_4 = $pibluelineclick4_3 or $fcolor_4 = $pibluelineclick4_4 or $fcolor_4 = $pibluelineclick4_5 or $fcolor_4 = $pibluelineclick4_6 or $fcolor_4 = $pibluelineclick4_7 Then
									 $object_1=5 ; clicked blue
								  Else
									 ContinueLoop ; some trash
								  EndIf

	  if $object1_1 <> $object1_2 Then
		 ConsoleWrite  ("1st object   " & $object1_1 & @LF)
		 ConsoleWrite  ("2st object   " & $object1_2 & @LF)
		 if ($object1_1 = 0 or $object1_1 = 1) and ($object1_2 = 2 or $object1_2 = 3) Then  ; was tile became empty
			$hThread = _AuThread_StartThread("delayed_click_Z")
			ConsoleWrite  ("Normal clickZ" & @LF)
		 EndIf
		 if ($object1_1 = 4 or $object1_1 = 5) and ($object1_2 = 2 or $object1_2 = 3) Then ; was tile became blue
			$hThread = _AuThread_StartThread("delayed_holdclick_Z")
			ConsoleWrite  ("Click and holdZ" & @LF)
		 EndIf
		 if ($object1_1 = 1 or $object1_1 = 2 or $object1_1 = 3) and ($object1_2 = 4 or $object1_2 = 5) Then ; was blue became tile
			$hThread = _AuThread_StartThread("delayed_unclick_Z")
			ConsoleWrite  ("UNclickZ" & @LF)
		 EndIf
	  EndIf

	  if $object2_1 <> $object2_2 Then
		 ConsoleWrite  ("1st object   " & $object2_1 & @LF)
		 ConsoleWrite  ("2st object   " & $object2_2 & @LF)
		 if ($object2_1 = 0 or $object2_1 = 1) and ($object2_2 = 2 or $object2_2 = 3) Then  ; was tile became empty
			$hThread = _AuThread_StartThread("delayed_clickX")
			ConsoleWrite  ("Normal clickX" & @LF)
		 EndIf
		 if ($object2_1 = 4 or $object2_1 = 5) and ($object2_2 = 2 or $object2_2 = 3) Then ; was tile became blue
			$hThread = _AuThread_StartThread("delayed_holdclickX")
			ConsoleWrite  ("Click and holdX" & @LF)
		 EndIf
		 if ($object2_1 = 1 or $object2_1 = 2 or $object2_1 = 3) and ($object2_2 = 4 or $object2_2 = 5) Then ; was blue became tile
			$hThread = _AuThread_StartThread("delayed_unclickX")
			ConsoleWrite  ("UNclickX" & @LF)
		 EndIf
	  EndIf

	  if $object3_1 <> $object3_2 Then
		 ConsoleWrite  ("1st object   " & $object3_1 & @LF)
		 ConsoleWrite  ("2st object   " & $object3_2 & @LF)
		 if ($object3_1 = 0 or $object3_1 = 1) and ($object3_2 = 2 or $object3_2 = 3) Then  ; was tile became empty
			$hThread = _AuThread_StartThread("delayed_click_C")
			ConsoleWrite  ("Normal clickC" & @LF)
		 EndIf
		 if ($object3_1 = 4 or $object3_1 = 5) and ($object3_2 = 2 or $object3_2 = 3) Then ; was tile became blue
			$hThread = _AuThread_StartThread("delayed_holdclick_C")
			ConsoleWrite  ("Click and holdC" & @LF)
		 EndIf
		 if ($object3_1 = 1 or $object3_1 = 2 or $object3_1 = 3) and ($object3_2 = 4 or $object3_2 = 5) Then ; was blue became tile
			$hThread = _AuThread_StartThread("delayed_unclick_C")
			ConsoleWrite  ("UNclickC" & @LF)
		 EndIf
	  EndIf

	  if $object4_1 <> $object4_2 Then
		 ConsoleWrite  ("1st object   " & $object4_1 & @LF)
		 ConsoleWrite  ("2st object   " & $object4_2 & @LF)
		 if ($object4_1 = 0 or $object4_1 = 1) and ($object4_2 = 2 or $object4_2 = 3) Then  ; was tile became empty
			$hThread = _AuThread_StartThread("delayed_click_V")
			ConsoleWrite  ("Normal clickV" & @LF)
		 EndIf
		 if ($object4_1 = 4 or $object4_1 = 5) and ($object4_2 = 2 or $object4_2 = 3) Then ; was tile became blue
			$hThread = _AuThread_StartThread("delayed_holdclick_V")
			ConsoleWrite  ("Click and holdV" & @LF)
		 EndIf
		 if ($object4_1 = 1 or $object4_1 = 2 or $object4_1 = 3) and ($object4_2 = 4 or $object4_2 = 5) Then ; was blue became tile
			$hThread = _AuThread_StartThread("delayed_unclick_V")
			ConsoleWrite  ("UNclickV" & @LF)
		 EndIf
	  EndIf


	  $object1_2 = $object1_1
	  $object2_2 = $object2_1
	  $object3_2 = $object3_1
	  $object4_2 = $object4_1
   WEnd
EndFunc;

Func debug1colum2Z()
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

	  if $object_1 <> $object_2 Then
		 ConsoleWrite  ("1st object   " & $object_1 & @LF)
		 ConsoleWrite  ("2st object   " & $object_2 & @LF)
		 if ($object_1 = 0 or $object_1 = 1) and ($object_2 = 2 or $object_2 = 3) Then  ; was tile became empty
			$hThread = _AuThread_StartThread("delayed_click_Z")
			ConsoleWrite  ("Normal click" & @LF)
		 EndIf
		 if ($object_1 = 4 or $object_1 = 5) and ($object_2 = 2 or $object_2 = 3) Then ; was tile became blue
			$hThread = _AuThread_StartThread("delayed_holdclick_Z")
			ConsoleWrite  ("Click and hold" & @LF)
		 EndIf
		 if ($object_1 = 1 or $object_1 = 2 or $object_1 = 3) and ($object_2 = 4 or $object_2 = 5) Then ; was blue became tile
			$hThread = _AuThread_StartThread("delayed_unclick_Z")
			ConsoleWrite  ("UNclick" & @LF)
		 EndIf
	  EndIf
	  $object_2 = $object_1
   WEnd
EndFunc;

Func debug1colum2V()
   $object_1=0
   $object_2=0
   While 1
	  $fcolor_1 = pixelget4()

	  If $fcolor_1 = $piempty4 Then
		 $object_1=0 ; empty empty
	  ElseIf $fcolor_1 = $piclicked4 Then
		 $object_1=1 ; clicked empty
	  ElseIf $fcolor_1 = $pitile4 Or $fcolor_1 = $pitile4_2 or $fcolor_1 = $pitile4_3 Then
		 $object_1=2 ; empty tile
	  ElseIf $fcolor_1 = $pitileclicked4_1 Or $fcolor_1 = $pitileclicked4_2 or $fcolor_1 = $pitileclicked4_3 Then
		 $object_1=3 ; clicked tile
	  ElseIf $fcolor_1 = $piblueline4_1 or $fcolor_1 = $piblueline4_2 or $fcolor_1 = $piblueline4_3 or $fcolor_1 = $piblueline4_4 or $fcolor_1 = $piblueline4_5 or $fcolor_1 = $piblueline4_6 or $fcolor_1 = $piblueline4_7 or $fcolor_1 = $piblueline4_8 Then
		 $object_1=4 ; empty blue
	  ElseIf $fcolor_1 = $pibluelineclick4_1 or $fcolor_1 = $pibluelineclick4_2 or $fcolor_1 = $pibluelineclick4_3 or $fcolor_1 = $pibluelineclick4_4 or $fcolor_1 = $pibluelineclick4_5 or $fcolor_1 = $pibluelineclick4_6 or $fcolor_1 = $pibluelineclick4_7 Then
		 $object_1=5 ; clicked blue
	  Else
		 ContinueLoop ; some trash
	  EndIf


	  if $object_1 <> $object_2 Then
		 ConsoleWrite  ("1st object   " & $object_1 & @LF)
		 ConsoleWrite  ("2st object   " & $object_2 & @LF)
		 if ($object_1 = 0 or $object_1 = 1) and ($object_2 = 2 or $object_2 = 3) Then  ; was tile became empty
			$hThread = _AuThread_StartThread("delayed_click_V")
			ConsoleWrite  ("Normal click" & @LF)
		 EndIf
		 if ($object_1 = 4 or $object_1 = 5) and ($object_2 = 2 or $object_2 = 3) Then ; was tile became blue
			$hThread = _AuThread_StartThread("delayed_holdclick_V")
			ConsoleWrite  ("Click and hold" & @LF)
		 EndIf
		 if ($object_1 = 1 or $object_1 = 2 or $object_1 = 3) and ($object_2 = 4 or $object_2 = 5) Then ; was blue became tile
			$hThread = _AuThread_StartThread("delayed_unclick_V")
			ConsoleWrite  ("UNclick" & @LF)
		 EndIf
	  EndIf
	  $object_2 = $object_1
   WEnd
EndFunc;

Func debug1colum2X()
   $object_1=0
   $object_2=0
   While 1
	  $fcolor_1 = pixelget2()

	  If $fcolor_1 = $piempty2 Then
		 $object_1=0 ; empty empty
	  ElseIf $fcolor_1 = $piclicked2 Then
		 $object_1=1 ; clicked empty
	  ElseIf $fcolor_1 = $pitile2 Or $fcolor_1 = $pitile2_2 or $fcolor_1 = $pitile2_3 Then
		 $object_1=2 ; empty tile
	  ElseIf $fcolor_1 = $pitileclicked2_1 Or $fcolor_1 = $pitileclicked2_2 or $fcolor_1 = $pitileclicked2_3 Then
		 $object_1=3 ; clicked tile
	  ElseIf $fcolor_1 = $piblueline2_1 or $fcolor_1 = $piblueline2_2 or $fcolor_1 = $piblueline2_3 or $fcolor_1 = $piblueline2_4 or $fcolor_1 = $piblueline2_5 or $fcolor_1 = $piblueline2_6 Then
		 $object_1=4 ; empty blue
	  ElseIf $fcolor_1 = $pibluelineclick2_1 or $fcolor_1 = $pibluelineclick2_2 or $fcolor_1 = $pibluelineclick2_3 or $fcolor_1 = $pibluelineclick2_4 or $fcolor_1 = $pibluelineclick2_5 or $fcolor_1 = $pibluelineclick2_6 or $fcolor_1 = $pibluelineclick2_7 Then
		 $object_1=5 ; clicked blue
	  Else
		 ContinueLoop ; some trash
	  EndIf


	  if $object_1 <> $object_2 Then
		 ConsoleWrite  ("1st object   " & $object_1 & @LF)
		 ConsoleWrite  ("2st object   " & $object_2 & @LF)
		 if ($object_1 = 0 or $object_1 = 1) and ($object_2 = 2 or $object_2 = 3) Then  ; was tile became empty
			$hThread = _AuThread_StartThread("delayed_clickX")
			ConsoleWrite  ("Normal click" & @LF)
		 EndIf
		 if ($object_1 = 4 or $object_1 = 5) and ($object_2 = 2 or $object_2 = 3) Then ; was tile became blue
			$hThread = _AuThread_StartThread("delayed_holdclickX")
			ConsoleWrite  ("Click and hold" & @LF)
		 EndIf
		 if ($object_1 = 1 or $object_1 = 2 or $object_1 = 3) and ($object_2 = 4 or $object_2 = 5) Then ; was blue became tile
			$hThread = _AuThread_StartThread("delayed_unclickX")
			ConsoleWrite  ("UNclick" & @LF)
		 EndIf
	  EndIf
	  $object_2 = $object_1
   WEnd
EndFunc;

debug1colum2C()


Func delayed_click_Z()
   Sleep(250)
   Send("z")
EndFunc

Func delayed_holdclick_Z()
   Sleep(250)
   Send("{z down}")
EndFunc

Func delayed_unclick_Z()
   Sleep(250)
   Send("{z up}")
EndFunc

Func delayed_click_C()
   Sleep(250)
   Send("c")
EndFunc

Func delayed_clickX()
   Sleep(250)
   Send("x")
EndFunc

Func delayed_holdclickX()
   Sleep(250)
   Send("{x down}")
EndFunc

Func delayed_unclickX()
   Sleep(250)
   Send("{x up}")
EndFunc

Func delayed_holdclick_C()
   Sleep(250)
   Send("{c down}")
EndFunc

Func delayed_unclick_C()
   Sleep(250)
   Send("{c up}")
EndFunc

Func delayed_click_V()
   Sleep(250)
   Send("v")
EndFunc

Func delayed_holdclick_V()
   Sleep(250)
   Send("{v down}")
EndFunc

Func delayed_unclick_V()
   Sleep(250)
   Send("{v up}")
EndFunc
