#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.12.0
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here

$tw = 16777215;
while (PixelGetColor(1139,499) <> $tw)
   sleep(10);
wend;
mousemove(1111,579);
sleep(500);
mouseclick("left",1111,579);
sleep(500);
mousemove(446, 1062);
sleep(500);
MouseClick("left", 446, 1062);
sleep(500);
