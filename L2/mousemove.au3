#cs ----------------------------------------------------------------------------

 AutoIt Version: ???
 Author:         ������

 Script Function:
	������  �����. Calibrovka

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
	  MsgBox(64,"������ -->" & $hp1,$hp2 & " <--���� || �����--> " & $hp3);
   WEnd;
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
Global $AM[2] = ["8341060","8406596"];
;������� ����
Global $DM[3] = ["3878188","3943981","3878444"];
;����� �����
;PixelGetColor(1794, 41); ������� ��(25%) �����, ������ ������, ����� ���� �� � �� �� ���������(�������� ����� ������), � ������ ���� ������ ����� �� �������� � �������...
Global $AM[1] = ["7937041"];
;������� �����
Global $DM[1] = ["3284506"];

  while 1
   Sleep(3000);
   MouseMove(596, 350);
   Sleep(3000);
   MouseMove(1590, 352);
   WEnd;