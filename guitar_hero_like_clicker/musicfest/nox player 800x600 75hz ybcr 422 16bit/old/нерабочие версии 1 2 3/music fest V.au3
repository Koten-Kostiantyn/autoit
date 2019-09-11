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

Func pixelget4()
   $fcolor = PixelGetColor(1165, 380)
   Return $fcolor
EndFunc;

Func debug1colum2()
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


debug1colum2()


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
