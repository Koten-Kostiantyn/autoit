#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         oookotooo

 Script Function:
	Crab wars(game) android emulator clicker.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here

HotKeySet("{ESC}", "Terminate")
HotKeySet("{2}", "Asleep")
HotKeySet("{1}", "Click")
HotKeySet("{3}", "ContlClick")
HotKeySet("{4}", "Rec")
HotKeySet("{5}", "Rec2")
HotKeySet("{6}", "Rec3")

Func Terminate()
    Exit
 EndFunc   ;==>Terminate

Func Asleep()
   While 1
    Sleep(10)
   WEnd
 EndFunc

Func Rec3() ; click top
   ; player left top
   ; rec window right down
   MouseClick("left", 36, 719, 1, 0) ; start rec
   MouseClick("left", 1606, 99, 50, 0) ; click on gold 50
   MouseClick("left", 1740, 15, 1, 0) ; stop
 EndFunc

Func Rec2() ; click top+update+close
   ; player left top
   ; rec window right down
   MouseClick("left", 36, 719, 1, 0) ; start rec
   MouseClick("left", 1413, 611, 1, 0) ; close
   MouseClick("left", 1606, 99, 50, 0) ; click on gold 50
   MouseClick("left", 1811, 672, 3, 0) ; levelup
   MouseClick("left", 1740, 15, 1, 0) ; stop
 EndFunc

Func Rec() ; click down , outdated
   MouseClick("left", 36, 719, 1, 0) ; start rec
   MouseClick("left", 716, 602, 50, 0)
   MouseClick("left", 1030, 16, 1, 0)
 EndFunc

Func Click()
   While 1
	  MouseClick("left")
   WEnd
 EndFunc

Func ContlClick()
   While 1
	  Sleep(100)
	  ControlClick("MEmu", "" , "" , "left" , 50 , 98, 513)
	  ControlClick("zopa — Блокнот", "" , "" , "left" , 2 , 69, 117)
   WEnd
 EndFunc

While 1
WEnd

