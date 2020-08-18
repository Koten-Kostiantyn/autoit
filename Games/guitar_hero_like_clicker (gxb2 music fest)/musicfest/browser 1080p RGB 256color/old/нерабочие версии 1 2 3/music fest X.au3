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

Func pixelget2()
   $fcolor = PixelGetColor(857, 380)
   Return $fcolor
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


debug1colum2X()


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
