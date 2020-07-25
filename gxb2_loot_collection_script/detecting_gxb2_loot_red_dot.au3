#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         Koten_Kostiantyn

 Script Function:
	Just a lib containing pixel data for GXB2 game loot collection tab (campaign tab) ONLY RED DOT ON LOOTBOX.
	Main purpose of this file is to make sure we have a RED DOT

	To do that we will check
	- RED DOT only


	result of this function would be this:
	0 - nothing
	1 - RED DOT

#ce ----------------------------------------------------------------------------

Global $Loot_Red_Dot_pixel_color_present = 0
Define_constant_Loot_Red_Dot_pixel_colors()

;=========== LOOT RED DOT ===============================
Func Get_current_Loot_Red_Dot_pixel_colors()
   Global $Loot_Red_Dot_pixel_1 = Hex(PixelGetColor(775, 859), 6)
EndFunc

Func Define_constant_Loot_Red_Dot_pixel_colors()
   Global $Loot_Red_Dot_color_1 = "FC5C9E"
EndFunc

Func Compare_current_and_constant_Loot_Red_Dot_pixel_colors()
   ;ConsoleWrite ( "Comparing 2 strings: " & $Loot_Red_Dot_pixel_1 & "  " & $Loot_Red_Dot_color_1 & @CRLF)
   ConsoleWrite ( "Checking if we have loot...")
   If not StringCompare( $Loot_Red_Dot_pixel_1, $Loot_Red_Dot_color_1 ) Then
	  $Loot_Red_Dot_pixel_color_present = 1
	  ConsoleWrite ( "TRUE" & @CRLF)
   Else
	  $Loot_Red_Dot_pixel_color_present = 0
	  ConsoleWrite ( "FALSE" & @CRLF)
   EndIf
EndFunc

;================ GAME BLUE TOP BAR =======================

Func is_gxb2_loot_red_dot()
   Get_current_Loot_Red_Dot_pixel_colors()
   Compare_current_and_constant_Loot_Red_Dot_pixel_colors()
   Return $Loot_Red_Dot_pixel_color_present
EndFunc

is_gxb2_loot_red_dot()