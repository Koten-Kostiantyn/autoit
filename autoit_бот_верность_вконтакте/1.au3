#include <Constants.au3>
HotKeySet("{ESC}", "Terminate")

Func Terminate()
    Exit
 EndFunc   ;==>Terminate

while 1
MouseClick("left", 1676, 491, 1);
Send("{F5}");
Sleep(3000);
Local $BGR = 2718847;
Local $BGR2 = 2653054;
;MouseMove(1476, 912);
;MsgBox($MB_SYSTEMMODAL, "My  BGR  =  " & $BGR,"3 = " & $3);
While NOT (($BGR == PixelGetColor(1480, 902)) OR ($BGR2 == PixelGetColor(1480, 902))) ;
   Sleep(1);
WEnd
MouseClick("left", 893, 440, 1);
sleep(1500);

Local $X = 16777137;
Local $X2 = 16777141;
If NOT ((PixelGetColor(1326, 247) == $X) OR (PixelGetColor(1326, 247) == $X2)) Then
  TrayTip("THIS IS "," ERROR, PGC = " & (PixelGetColor(1326, 247)), 0,  $TIP_ICONHAND);
EndIf;
Local $i = 0;
;MouseMove ( 1171, 547 );
Local $Brush = Hex(13339218);
Local $Hemlet = Hex(16426608);
Local $Buckler = Hex(9077625);
Local $Brush2 = Hex(13931354);
Local $Hemlet2 = Hex(15571560);
Local $Buckler2 = Hex(15059893);
;sleep(300);
;Send("^!c");
Local $a = Hex((PixelGetColor ( 1171, 547 )));ClipGet()));
If $a == $Brush or $a == $Brush2 Then
   $i = $i + 1;
   Beep(200, 300);
   EndIf;
;MouseMove ( 1241, 621 )
;sleep(300);
;Send("^!c");
Local $b = Hex((PixelGetColor ( 1241, 621 )));ClipGet()));
If $b == $Hemlet or $b == $Hemlet2 Then
   $i = $i + 1;
   Beep(200, 300);
   EndIf;
;MouseMove ( 1269, 677 )
;sleep(300);
;Send("^!c");
Local $c = Hex((PixelGetColor (1269, 677 )));ClipGet()));
If $c == $Buckler or $c == $Buckler2 Then
   $i = $i +1;
   Beep(200, 300);
   EndIf;
If $i >= 1 Then
   SoundPlay(@WindowsDir & "\media\ring03.wav", 1);
   ;Beep(500, 3000);
   Exit;
   EndIf;

;MsgBox($MB_SYSTEMMODAL, "My  I  =  " & $i,"I = " & $i & "  a = " & $a  & "  b = " & $b  & "  c = " & $c  & "  Brush = " & $Brush  & "  Hemlet = " & $Hemlet  & "  Buckler = " & $Buckler )
WEnd;