#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         Koten_Kostiantyn

 Script Function:
	Saving functions, used multiple times in different files

#ce ----------------------------------------------------------------------------
#include <ScreenCapture.au3>
#include <FileConstants.au3>

; Global variables
Global $array_pixel_color_problem = 0
Global $error_logfile = "error_logfile.txt"
Global $error_logfile_filepath = @ScriptDir & "\" & $error_logfile

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
		 Local $current_timestamp = @YEAR & "_" & @MON & "_" & @MDAY  & " " & @HOUR & "." & @MIN & "." & @SEC
		 Local $Screenshot_fileName = $current_timestamp & " Problem of " & $name_of_pixel & " " & " .png"
		 _ScreenCapture_Capture(@ScriptDir & "\" & $Screenshot_fileName)
		 Beep(500, 1000)
		 Local $hFileOpen = FileOpen($error_logfile_filepath, $FO_APPEND)
		 FileWriteLine($hFileOpen, "Problem happened in " & $name_of_pixel & " at time " & $current_timestamp )
		 FileWriteLine($hFileOpen, "PROBLEM " & $array_pixel_color_problem & "\" & $arrayLength)
		 For $i=0 to ($arrayLength - 1)
			If StringCompare( $current_array[$i], $constant_array[$i] ) Then
			   FileWriteLine ($hFileOpen, "Comparing 2 strings: [" & $i & "] " & $current_array[$i] & "  " & $constant_array[$i])
			Else
			   FileWriteLine ($hFileOpen, "Comparing 2 strings: [" & $i & "] " &  " OK!" )
			EndIf
		 Next
		 FileWriteLine($hFileOpen, " _ _ _  _ _ _  _ _ _  _ _ _  _ _ _ ")
		 FileWriteLine($hFileOpen, "                                   ")
		 FileWriteLine($hFileOpen, "                                   ")
		 FileClose($hFileOpen)
		 Sleep(500)
	  EndIf
   Else
      ConsoleWrite ( "OK" & @CRLF)
   EndIf
EndFunc