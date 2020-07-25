#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         Koten_Kostiantyn

 Script Function:
	Just a lib containing pixel data for GXB2 game loot collection tab (campaign tab).
	Main purpose of this file is to make sure we are in game and not on a wrong tab

	To do that we will check
	- topBar
	- Michael
	- Leaves
	- Book
	- Box

	result of this function woul be this:
	0 - this is not loot campaign tab
	1 - it is campaign tab, everythinh OK

#ce ----------------------------------------------------------------------------

; topBar variables
Global $topBar_pixel_count = 5
Define_constant_topBar_pixel_colors()

; Michael variables
Global $michael_pixel_count = 8
Define_constant_michael_pixel_colors()

; leaves variables
Global $leaves_pixel_count = 5
Define_constant_leaves_pixel_colors()

; theBook variables
Global $theBook_pixel_count = 5
Define_constant_theBook_pixel_colors()

; theBox variables
Global $theBox_pixel_count = 5
Define_constant_theBox_pixel_colors()

;================ GAME BLUE TOP BAR =======================
Func Get_current_topBar_pixel_colors()
   Global $topBar_pixel[$topBar_pixel_count]
   $topBar_pixel[0] = Hex(PixelGetColor(255, 102), 6)
   $topBar_pixel[1] = Hex(PixelGetColor(295, 116), 6)
   $topBar_pixel[2] = Hex(PixelGetColor(497, 103), 6)
   $topBar_pixel[3] = Hex(PixelGetColor(694, 115), 6)
   $topBar_pixel[4] = Hex(PixelGetColor(894, 84), 6)
EndFunc

Func Define_constant_topBar_pixel_colors()
   Global $topBar_color[$topBar_pixel_count]
   $topBar_color[0] = "BACFE5"
   $topBar_color[1] = "C1D5E9"
   $topBar_color[2] = "509FE7"
   $topBar_color[3] = "C1D5E8"
   $topBar_color[4] = "B2CAE2"
EndFunc
;=========================================================


;================ MICHAEL =======================

Func Get_current_michael_pixel_colors()
   Global $michael_pixel[$michael_pixel_count]
   $michael_pixel[0] = Hex(PixelGetColor(413, 869), 6)
   $michael_pixel[1] = Hex(PixelGetColor(499, 889), 6)
   $michael_pixel[2] = Hex(PixelGetColor(526, 869), 6)
   $michael_pixel[3] = Hex(PixelGetColor(531, 847), 6)
   $michael_pixel[4] = Hex(PixelGetColor(589, 872), 6)
   $michael_pixel[5] = Hex(PixelGetColor(540, 894), 6)
   $michael_pixel[6] = Hex(PixelGetColor(574, 903), 6)
   $michael_pixel[7] = Hex(PixelGetColor(530, 902), 6)
EndFunc

Func Define_constant_michael_pixel_colors()
   Global $michael_color[$michael_pixel_count]
   $michael_color[0] = "559FF8"
   $michael_color[1] = "EFD5A6"
   $michael_color[2] = "95E2F9"
   $michael_color[3] = "E9E7D3"
   $michael_color[4] = "A4B0C4"
   $michael_color[5] = "8EE1F9"
   $michael_color[6] = "DAAE88"
   $michael_color[7] = "DDF0FA"
EndFunc
;=========================================================


;================ LEAVES =======================
Func Get_current_leaves_pixel_colors()
   Global $leaves_pixel[$leaves_pixel_count]
   $leaves_pixel[0] = Hex(PixelGetColor(157, 551), 6)
   $leaves_pixel[1] = Hex(PixelGetColor(160, 592), 6)
   $leaves_pixel[2] = Hex(PixelGetColor(889, 593), 6)
   $leaves_pixel[3] = Hex(PixelGetColor(893, 632), 6)
   $leaves_pixel[4] = Hex(PixelGetColor(156, 568), 6)
EndFunc

Func Define_constant_leaves_pixel_colors()
   Global $leaves_color[$leaves_pixel_count]
   $leaves_color[0] = "4A6E2C"
   $leaves_color[1] = "243019"
   $leaves_color[2] = "293420"
   $leaves_color[3] = "2A3221"
   $leaves_color[4] = "385722"
EndFunc
;=========================================================

;================ BOOK =======================
Func Get_current_theBook_pixel_colors()
   Global $theBook_pixel[$theBook_pixel_count]
   $theBook_pixel[0] = Hex(PixelGetColor(294, 868), 6)
   $theBook_pixel[1] = Hex(PixelGetColor(309, 910), 6)
   $theBook_pixel[2] = Hex(PixelGetColor(276, 901), 6)
   $theBook_pixel[3] = Hex(PixelGetColor(336, 894), 6)
   $theBook_pixel[4] = Hex(PixelGetColor(308, 924), 6)
EndFunc

Func Define_constant_theBook_pixel_colors()
   Global $theBook_color[$theBook_pixel_count]
   $theBook_color[0] = "D3AB84"
   $theBook_color[1] = "F7C7B5"
   $theBook_color[2] = "74385F"
   $theBook_color[3] = "FFF6E9"
   $theBook_color[4] = "5568A4"
EndFunc
;=========================================================

;================ LOOT BOX ===============================
Func Get_current_theBox_pixel_colors()
   Global $theBox_pixel[$theBox_pixel_count]
   $theBox_pixel[0] = Hex(PixelGetColor(720, 893), 6)
   $theBox_pixel[1] = Hex(PixelGetColor(777, 911), 6)
   $theBox_pixel[2] = Hex(PixelGetColor(726, 891), 6)
   $theBox_pixel[3] = Hex(PixelGetColor(765, 915), 6)
   $theBox_pixel[4] = Hex(PixelGetColor(749, 892), 6)
EndFunc

Func Define_constant_theBox_pixel_colors()
   Global $theBox_color[$theBox_pixel_count]
   $theBox_color[0] = "6376B6"
   $theBox_color[1] = "AEB3B7"
   $theBox_color[2] = "556FC0"
   $theBox_color[3] = "4C5EAB"
   $theBox_color[4] = "F3D6D3"
EndFunc
;=========================================================


Func is_gxb2_campaingn_tab()
   Local $problem = 0

   ; checking topBar ================================
   $array_pixel_color_problem = 0
   Get_current_topBar_pixel_colors()
   compare_current_and_constant_pixel_colors($topBar_pixel, $topBar_color, "top Bar")
   if $array_pixel_color_problem Then
	  $problem = 1
   EndIf

   ; checking michael ================================
   $array_pixel_color_problem = 0
   Get_current_michael_pixel_colors()
   compare_current_and_constant_pixel_colors($michael_pixel, $michael_color, "Michael")
   if $array_pixel_color_problem Then
	  $problem = 1
   EndIf

   ; checking leaves ================================
   $array_pixel_color_problem = 0
   Get_current_leaves_pixel_colors()
   compare_current_and_constant_pixel_colors($leaves_pixel, $leaves_color, "Leaves")
   if $array_pixel_color_problem Then
    $problem = 1
   EndIf

   ; checking theBook ================================
   $array_pixel_color_problem = 0
   Get_current_theBook_pixel_colors()
   compare_current_and_constant_pixel_colors($theBook_pixel, $theBook_color, "the Book")
   if $array_pixel_color_problem Then
    $problem = 1
   EndIf

   ; checking theBox ================================
   $array_pixel_color_problem = 0
   Get_current_theBox_pixel_colors()
   compare_current_and_constant_pixel_colors($theBox_pixel, $theBox_color, "the Box")
   if $array_pixel_color_problem Then
    $problem = 1
   EndIf

   Return not $problem
EndFunc

;is_gxb2_campaingn_tab()
