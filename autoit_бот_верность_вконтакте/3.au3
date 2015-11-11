#include <Constants.au3>
HotKeySet("{ESC}", "Terminate")

Func Terminate()
    Exit
 EndFunc   ;==>Terminate

Local $Emp = 6112297;
Local $3 = PixelGetColor(1300, 227);
while $Emp == $3
; 1295-1296 - 4 energy
;1303-1304 - 5 enerdy
MouseMove(1305, 220);
MouseMove(1305, 234);
MouseMove(1295, 234);
MouseMove(1295, 220);
MsgBox($MB_SYSTEMMODAL, "My  3  =  " & $3,"3 = " & $3 & "  3 = " & $3  & "  3 = " & $3);  & "  c = " & $c  & "  Brush = " & $Brush  & "  Hemlet = " & $Hemlet  & "  Buckler = " & $Buckler )
WEnd;
Local $BGR = 10932709;
;MouseMove(1476, 912);
;MsgBox($MB_SYSTEMMODAL, "My  BGR  =  " & $BGR,"3 = " & $3);
;While $BGR == PixelGetColor(1480, 902);
;WEnd
;SoundPlay(@WindowsDir & "\media\ring02.wav", 1);


;SoundPlay(@WindowsDir & "\media\ring02.wav", 1);
;TrayTip("THIS IS "," ERROR, PGC = " & (PixelGetColor(1326, 247)), 0,  $TIP_ICONHAND);
   ;$i = 0;
   MouseClick("left",1246, 622,1);

   MouseClick("left",1125, 851,1);
 While ($BGR == PixelGetColor(1125, 851))
	  Sleep(1);
   WEnd;
   MouseMove(1015, 974);
   While NOT (16638349 == PixelGetColor(1125, 851))
	  Sleep(1);
   WEnd
   ;MsgBox($MB_SYSTEMMODAL, "My  BGR  =  " & $BGR,"HURRAY");
