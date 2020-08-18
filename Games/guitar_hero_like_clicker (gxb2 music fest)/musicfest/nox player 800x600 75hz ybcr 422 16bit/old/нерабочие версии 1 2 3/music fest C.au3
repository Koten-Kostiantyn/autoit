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
   $piempty1=1121838
   $piclicked1=1519947
   $pitile1=5861029
   $pitile1_2=2175077
   $pitile1_3=2175077
   $pitileclicked1_1=5403051
   $pitileclicked1_2=2441335
   $pitileclicked1_3=2441335
   $piblueline1_1=2704254
   $piblueline1_2=2638202
   $piblueline1_3=2506614
   $piblueline1_4=2440562
   $piblueline1_5=2374766
   $piblueline1_6=2374766
   $pibluelineclick1_1=2838411
   $pibluelineclick1_2=2772360
   $pibluelineclick1_3=2706565
   $pibluelineclick1_4=2640514
   $pibluelineclick1_5=2574718
   $pibluelineclick1_6=2574718
   $pibluelineclick1_7=2574718

; END Block of color variables

Func pixelget1()
   $fcolor = PixelGetColor(1032, 380)
   Return $fcolor
EndFunc;

Func debug1colum()
   while 1
	  $fcolor = pixelget1()
	  if $fcolor = $piempty1 Then
		 ConsoleWrite  ("empty" & @LF)
	  ElseIf $fcolor = $piclicked1 Then
		 ConsoleWrite  ("clicked" & @LF)
	  ElseIf $fcolor = $pitile1 Or $fcolor = $pitile1_2 or $fcolor = $pitile1_3 Then
		 ConsoleWrite  ("tile!!!!!!!!!!!!!!!" & @LF & "!!!!!!!!!!!!!!!!!!" & @LF)
	  ElseIf $fcolor = $pitileclicked1_1 Or $fcolor = $pitileclicked1_2 or $fcolor = $pitileclicked1_3 Then
		 ConsoleWrite  ("~~~~~~~~~~~~~~" & @LF & "clicked tile ~~~~~~" & @LF)
	  ElseIf $fcolor = $piblueline1_1 or $fcolor = $piblueline1_2 or $fcolor = $piblueline1_3 or $fcolor = $piblueline1_4 or $fcolor = $piblueline1_5 or $fcolor = $piblueline1_6 Then
		 ConsoleWrite  ("blue??" & @LF)
	  ElseIf $fcolor = $pibluelineclick1_1 or $fcolor = $pibluelineclick1_2 or $fcolor = $pibluelineclick1_3 or $fcolor = $pibluelineclick1_4 or $fcolor = $pibluelineclick1_5 or $fcolor = $pibluelineclick1_6 or $fcolor = $pibluelineclick1_7 Then
		 ConsoleWrite  ("&& clicked blue" & @LF)
	  Else
		 ConsoleWrite  ($fcolor & @LF)
	  EndIf
   WEnd
EndFunc;

Func debug1colum2()
   $object_1=0
   $object_2=0
   While 1
	  $fcolor_1 = pixelget1()

	  If $fcolor_1 = $piempty1 Then
		 $object_1=0 ; empty empty
	  ElseIf $fcolor_1 = $piclicked1 Then
		 $object_1=1 ; clicked empty
	  ElseIf $fcolor_1 = $pitile1 Or $fcolor_1 = $pitile1_2 or $fcolor_1 = $pitile1_3 Then
		 $object_1=2 ; empty tile
	  ElseIf $fcolor_1 = $pitileclicked1_1 Or $fcolor_1 = $pitileclicked1_2 or $fcolor_1 = $pitileclicked1_3 Then
		 $object_1=3 ; clicked tile
	  ElseIf $fcolor_1 = $piblueline1_1 or $fcolor_1 = $piblueline1_2 or $fcolor_1 = $piblueline1_3 or $fcolor_1 = $piblueline1_4 or $fcolor_1 = $piblueline1_5 or $fcolor_1 = $piblueline1_6 Then
		 $object_1=4 ; empty blue
	  ElseIf $fcolor_1 = $pibluelineclick1_1 or $fcolor_1 = $pibluelineclick1_2 or $fcolor_1 = $pibluelineclick1_3 or $fcolor_1 = $pibluelineclick1_4 or $fcolor_1 = $pibluelineclick1_5 or $fcolor_1 = $pibluelineclick1_6 or $fcolor_1 = $pibluelineclick1_7 Then
		 $object_1=5 ; clicked blue
	  Else
		 ContinueLoop ; some trash
	  EndIf


	  if $object_1 <> $object_2 Then
		 ConsoleWrite  ("1st object   " & $object_1 & @LF)
		 ConsoleWrite  ("2st object   " & $object_2 & @LF)
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


debug1colum2()

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

Func delayed_click()
   Sleep(250)
;~    Send("c")
MouseClick("left", 1007, 801, 1)
EndFunc

Func delayed_holdclick()
   Sleep(250)
;~    Send("{c down}")
MouseMove(1007, 801, 1)
MouseDown("left")
EndFunc

Func delayed_unclick()
   Sleep(250)
;~    Send("{c up}")
MouseMove(1007, 801, 1)
MouseUp("left")
EndFunc
