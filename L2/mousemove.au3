#cs ----------------------------------------------------------------------------

 AutoIt Version: ???
 Author:         ЯФВТОР

 Script Function:
	ЛОМАЕМ  Руофф. Calibrovka

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
	  MsgBox(64,"Монстр -->" & $hp1,$hp2 & " <--ВОЛК || ГЕРОЙ--> " & $hp3);
   WEnd;
EndFunc;

Func PIXELS_COLORS_ARE_UNDER_THIS_FUNCTION()
   EndFunc;
;ЖИВОЙ МОНСТР(ЦЕЛЬ)
;PixelGetColor(20, 51)); Пиксель ХП(последний писксель) монстра, когда окно в левом верхнем углу, нужно проверить мертв или нет
Global $AM[1] = ["7280403"];
;МЕРТВЫЙ МОНСТР(ЦЕЛЬ)
Global $DM[1] = ["3021335"];
;ЖИВОЙ ВОЛК
;PixelGetColor(61, 95); Пиксель ХП(15-20%)волка, если окошко прилеплено к окошку монстра, слева сверху
Global $AM[2] = ["8341060","8406596"];
;МЕРТВЫЙ ВОЛК
Global $DM[3] = ["3878188","3943981","3878444"];
;ЖИВОЙ ГЕРОЙ
;PixelGetColor(1794, 41); Пиксель ХП(25%) героя, справа сверху, вверх пока СП и ХП не сблизятся(оставить после сблиза), а справа пока желтая линия не пропадет с концами...
Global $AM[1] = ["7937041"];
;МЕРТВЫЙ ГЕРОЙ
Global $DM[1] = ["3284506"];

  while 1
   Sleep(3000);
   MouseMove(596, 350);
   Sleep(3000);
   MouseMove(1590, 352);
   WEnd;