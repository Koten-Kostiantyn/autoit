#include <Constants.au3>
HotKeySet("{ESC}", "Terminate")
HotKeySet("{f}", "fast")

Func Terminate()
    Exit
 EndFunc   ;==>Terminate
 Func fast()
    main(1,1)
 EndFunc
 Func main($x,$y)
    while 1
   Sleep($x);
   MouseClick("left", 428, 575, 1);gold1
   Sleep($x);
   MouseClick("left", 443, 647, 1);
   Sleep($x);
      MouseClick("left", 526, 529, 1);gold2
	  Sleep($x);
   MouseClick("left", 530, 598, 1);
   Sleep($x);
      MouseClick("left", 625, 481, 1);gold3
	  Sleep($x);
   MouseClick("left", 638, 549, 1);
   Sleep($x);
      MouseClick("left", 532, 627, 1);gold4
	  Sleep($x);
   MouseClick("left", 532, 694, 1);
   Sleep($x);
      MouseClick("left", 632, 572, 1);gold5
	  Sleep($x);
   MouseClick("left", 634, 645, 1);
   Sleep($x);
      MouseClick("left", 729, 512, 1);gold6
	  Sleep($x);
   MouseClick("left", 730, 596, 1);
   Sleep($x);
      MouseClick("left", 952, 511, 1);gold7
	  Sleep($x);
   MouseClick("left", 955, 580, 1);
   Sleep($x);
      MouseClick("left", 865, 545, 1);food1
	  Sleep($x);
   MouseClick("left", 875, 626, 1);
   Sleep($x);
      MouseClick("left", 1142, 220, 1);food2
	  Sleep($x);
   MouseClick("left", 1155, 290, 1);
   Sleep($x);
      MouseClick("left", 1242, 169, 1);food3
	  Sleep($x);
   MouseClick("left", 1208, 240, 1);
   Sleep($x);
      MouseClick("left", 1340, 119, 1);food4
	  Sleep($x);
   MouseClick("left", 1358, 196, 1);
   Sleep($x);
      MouseClick("left", 1435, 159, 1);food5
	  Sleep($x);
   MouseClick("left", 1436, 246, 1);
   Sleep($x);
      MouseClick("left", 1338, 205, 1);food6
	  Sleep($x);
   MouseClick("left", 1347, 293, 1);
   Sleep($x);
      MouseClick("left", 1239, 255, 1);food7
	  Sleep($x);
   MouseClick("left", 1236, 342, 1);
;Sleep($x);
;MouseClick("left", 824, 673, 1);
Sleep($x);
MouseClick("left", 1052, 155, 1);
;Sleep($x);
;MouseClick("left", 824, 673, 1);
if $y==1 Then Return;
WEnd;
 EndFunc
Local $x=10000;
main($x,0);