#cs ----------------------------------------------------------------------------

 AutoIt Version: ???
 Author:         ������

 Script Function:
	������  �����.

#ce ----------------------------------------------------------------------------
#include <Constants.au3>
HotKeySet("{END}", "Terminate")

Func Terminate()
    Exit
 EndFunc   ;==>Terminate

Func Calibration()
     while 1
  	  $hp1=1;
	  $hp2=1;
 	  $hp3=1;
	   sleep(3000);
	  $hp1=PixelGetColor(20, 51);
	  $hp2=PixelGetColor(61, 95);
	  $hp3=PixelGetColor(1794, 41);
	  MsgBox(64,$hp1,$hp2 & " lol " & $hp3);
   WEnd;
EndFunc;

Func GetActiveKeyboardLayout($hWnd)
    Local $aRet = DllCall('user32.dll', 'long', 'GetWindowThreadProcessId', 'hwnd', $hWnd, 'ptr', 0)
    $aRet = DllCall('user32.dll', 'long', 'GetKeyboardLayout', 'long', $aRet[0])
    Return '0000' & Hex($aRet[0], 4)
EndFunc   ;==>GetActiveKeyboardLayout

Func SetENGLISH()
    If (GetActiveKeyboardLayout(WinGetHandle(''))==00000419) Then
	   MouseMove(273, 1049);
	   MouseClick("left", 273, 1049, 1);
	   MouseClick("left", 689, 1050, 1);
	EndIf;
EndFunc;
Func PIXELS_COLORS_ARE_UNDER_THIS_FUNCTION()
   EndFunc;
;����� ������(����)
;PixelGetColor(20, 51)); ������� ��(��������� ��������) �������, ����� ���� � ����� ������� ����, ����� ��������� ����� ��� ���
Global $AM[1] = ["7280403"];
;������� ������(����)
Global $DM[1] = ["3021335"];
;����� ����
;PixelGetColor(61, 95); ������� ��(15-20%)�����, ���� ������ ���������� � ������ �������, ����� ������
Global $AW[2] = ["8341060","8406596"];
;������� ����
Global $DW[3] = ["3878188","3943981","3878444"];
;����� �����
;PixelGetColor(1794, 41); ������� ��(25%) �����, ������ ������, ����� ���� �� � �� �� ���������(�������� ����� ������), � ������ ���� ������ ����� �� �������� � �������...
Global $AH[1] = ["7937041"];
;������� �����
Global $DH[1] = ["3284506"];

$hTimer = TimerInit() ; ��������� ������ � ������ ���������� � ����������
$iDiff = TimerDiff($hTimer) ; ���������� ������� �� �������, �� ����������� ������� TimerInit, ���������� �������� ������ � ����������
$timeCount = 1000*60*55; ���� ������ 55 �����
$min = 60000; ���� ������ 1 ������
  while $iDiff < $timeCount;
	 Sleep(2000);
     SetENGLISH();
	 if ((($AW[0] == PixelGetColor(61, 95)) or ($AW[1] == PixelGetColor(61, 95))) and ($AH[0] == PixelGetColor(1794, 41))) Then;���������, ���� �� ���� � �����, ���� �� �� �������� ������, ������ ������ ����

	  EndIf;
   $iDiff = TimerDiff($hTimer);
   WEnd;

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


;~  	EndIf;
 #CS
###
;~    while ($ESC <> PixelGetColor(20, 51))  ; ������� �� �������, ����� ���� � ����� ������� ����, ����� ��������� ����� ��� ���
### ;~ 	   sleep(1);
### ;~ 	   $k1=$k1+1;
### ;~ 	   if ($k1>1000) Then
### ;~ 		  ExitLoop;
### ;~ 	   EndIf;
### ;~ 																							 ;MsgBox(0, "k1 w8 for menu", $k1);
### ;~ 	   WEnd;
###
### 	if ($ESC == PixelGetColor(61, 95)) Then ; ������� �� �����, ���� ������ ���������� � ������ �������, ����� ������
### 	   MouseMove(868, 733);
### 	   sleep(100);
### 	   MouseClick("left", 868, 733, 1);
### 																							 ;MsgBox(0, "click work", $k3);
### 	   EndIf;
###
### ;~ 	while ($BE <> PixelGetColor(1794, 41)) ; ������� �� �����, ������ ������, ����� ���� �� � �� �� ���������(�������� ����� ������), � ������ ���� ������ ����� �� �������� � �������...
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
### 	  ; MouseClick("left");
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
#CE


