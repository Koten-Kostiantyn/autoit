#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         Koten_Kostiantyn

 Script Function:
	Saving functions, used multiple times in different files

#ce ----------------------------------------------------------------------------
#include <ScreenCapture.au3>

; Global variables
Global $array_pixel_color_problem = 0

Func compare_current_and_constant_pixel_colors($current_array, $constant_array, $name_of_pixel)
   Local Const $arrayLength = UBound($current_array)

   ConsoleWrite ( "Checking the " & $name_of_pixel & "...")
   For $i=0 to ($arrayLength - 1)
      If StringCompare( $current_array[$i], $constant_array[$i] ) Then
		 $array_pixel_color_problem += 1
      EndIf
   Next
   If $array_pixel_color_problem Then
	  If $array_pixel_color_problem == $arrayLength Then
		 ConsoleWrite ( "PROBLEM " & $array_pixel_color_problem & "\" & $arrayLength & @CRLF)
	  Else
		 ConsoleWrite ( "PROBLEM " & $array_pixel_color_problem & "\" & $arrayLength & @CRLF)
		 For $i=0 to ($arrayLength - 1)
			_ScreenCapture_Capture(@ScriptDir & "\Problem.png")
			ConsoleWrite ( "Comparing 2 strings: " & $current_array[$i] & "  " & $constant_array[$i] & @CRLF)
		 Next
	  EndIf
   Else
      ConsoleWrite ( "OK" & @CRLF)
   EndIf
EndFunc