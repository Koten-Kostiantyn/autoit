#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.12.0
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
#include <Constants.au3>
#include <Misc.au3>
HotKeySet("{ESC}", "Terminate")

Func Terminate()
    Exit
 EndFunc   ;==>Terminate

while 1
while _IsPressed(02)
mousemove(961, 556,0);
mousemove(963,558,0);
mousemove(961, 560,0);
mousemove(959, 558,0);
wend
WEnd;