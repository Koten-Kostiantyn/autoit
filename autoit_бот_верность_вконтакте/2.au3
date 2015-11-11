#include <Constants.au3>
HotKeySet("{ESC}", "Terminate")

Func Terminate()
    Exit
 EndFunc   ;==>Terminate


 Local $Fig = InputBox("quantity of fights?","input here:");
 Local $ERRCNT = 0;
 Local $BGR = 2718847;
Local $BGR2 = 2653054;

while $Fig > 0
MouseClick("left", 1676, 491, 1);
Send("{F5}");
While (($BGR == PixelGetColor(1480, 902)) OR ($BGR2 == PixelGetColor(1480, 902)))
	  Sleep(1);
   WEnd;
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
  $ERRCNT = $ERRCNT + 1;
  IF $ERRCNT > 999 Then
	 MsgBox($MB_SYSTEMMODAL, "FATAL ERROR" & ," 100 ERRORRS = " & $ERRCNT);
	 ;Exit;
   EndIf;
EndIf;

Local $Emp = 6112297;
Local $3 = PixelGetColor(1300, 227);
while $Emp == $3
;1295-1296 - 4 energy
;1303-1304 - 5 enerdy
MouseMove(1305, 320);
MouseMove(1305, 334);
MouseMove(1295, 334);
MouseMove(1295, 320);
;MsgBox($MB_SYSTEMMODAL, "My  1  =  " & $1,"2 = " & $2 & "  3 = " & $3  & "  4 = " & $4);  & "  c = " & $c  & "  Brush = " & $Brush  & "  Hemlet = " & $Hemlet  & "  Buckler = " & $Buckler )
WEnd;

;MouseClick("left", 893, 440, 1);
;sleep(2000);
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
   ;Beep(200, 300);
   EndIf;
;MouseMove ( 1241, 621 )
;sleep(300);
;Send("^!c");
Local $b = Hex((PixelGetColor ( 1241, 621 )));ClipGet()));
If $b == $Hemlet or $b == $Hemlet2 Then
   $i = $i + 1;
   ;Beep(200, 300);
   EndIf;
;MouseMove ( 1269, 677 )
;sleep(300);
;Send("^!c");
Local $c = Hex((PixelGetColor (1269, 677 )));ClipGet()));
If $c == $Buckler or $c == $Buckler2 Then
   $i = $i +1;
   ;Beep(200, 300);
   EndIf;
If $i == 3 Then
   ;Beep(500, 3000);
   SoundPlay(@WindowsDir & "\media\ring02.wav", 1);
   ;$i = 0;
   MouseClick("left",1246, 622,1);
   MouseClick("left",1125, 851,1);
   While (10932709 == PixelGetColor(1125, 851))
	  Sleep(1);
   WEnd;
   MouseMove(1015, 974);
   While NOT (16638349 == PixelGetColor(1125, 851))
	  Sleep(1);
   WEnd
   MouseClick("left",1125, 851,1);
   $Fig = $Fig - 1;
   While (($BGR == PixelGetColor(1480, 902)) OR ($BGR2 == PixelGetColor(1480, 902)))
	  Sleep(1);
   WEnd;
   MouseMove(1015, 974);
   While NOT (($BGR == PixelGetColor(1480, 902)) OR ($BGR2 == PixelGetColor(1480, 902))) ;
	  Sleep(1);
   WEnd
   Sleep(500);
   MouseClick("left",1125, 851,1);
   Sleep(500);
   MouseClick("left",1125, 851,1);
   ;Exit;
   EndIf;

;MsgBox($MB_SYSTEMMODAL, "My  I  =  " & $i,"I = " & $i & "  a = " & $a  & "  b = " & $b  & "  c = " & $c  & "  Brush = " & $Brush  & "  Hemlet = " & $Hemlet  & "  Buckler = " & $Buckler )
WEnd;

If $Fig == 0 Then
   MsgBox($MB_SYSTEMMODAL, "Error! 0 ", "0  Figths! okay?");
   Exit;
   EndIf;

