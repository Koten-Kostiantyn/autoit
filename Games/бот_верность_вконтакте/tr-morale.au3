#include <Constants.au3>
HotKeySet("{ESC}", "Terminate")

Func Terminate()
    Exit
 EndFunc   ;==>Terminate

while 1
MouseClick("left", 1884, 1032, 1);
MouseClick("left", 962, 747, 1);
Sleep(1000);
MouseClick("left", 1469, 910, 1);
MouseClick("left", 1884, 1059, 1);
MouseClick("left", 958, 790, 1);
WEnd;