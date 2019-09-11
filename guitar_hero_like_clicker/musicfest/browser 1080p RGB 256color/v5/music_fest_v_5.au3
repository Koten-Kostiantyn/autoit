#cs ----------------------------------------------------------------------------


#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
#include <Constants.au3>
#include <authread.au3>
#include <Array.au3>
#include <arrays_pixels_win7_global.au3>

HotKeySet("{ESC}", "Terminate")

Global $delay = 1750000

Local $iArrayLength = 300

Global $global_click_time_array[$iArrayLength]
Global $global_unclick_time_array[$iArrayLength]
Global $global_click_button_array[$iArrayLength]
Global $global_unclick_button_array[$iArrayLength]

For $i = 0 to $iArrayLength - 1
    $global_click_time_array[$i] = 993460354967
	$global_unclick_time_array[$i] = 993460354967
	$global_click_button_array[$i] = 0
	$global_unclick_button_array[$i] = 0
Next

Func Terminate()
    Exit
EndFunc   ;==>Terminate


Func pixelget1()
   $fcolor = PixelGetColor(737, 173)
   Return $fcolor
EndFunc;

Func pixelget2()
   $fcolor = PixelGetColor(872, 173)
   Return $fcolor
EndFunc;

Func pixelget3()
   $fcolor = PixelGetColor(1007, 173)
   Return $fcolor
EndFunc;

Func pixelget4()
   $fcolor = PixelGetColor(1141, 173)
   Return $fcolor
EndFunc;

Func get_current_pixel_state($button)
	If $button = 1 Then
		$pixel = pixelget1()
	ElseIf $button = 2 Then
		$pixel = pixelget2()
	ElseIf $button = 3 Then
	$pixel = pixelget3()
	ElseIf $button = 4 Then
		$pixel = pixelget4()
	Else
		MsgBox(0, "Error", "Seems your button parameter is incorrect!")
	EndIf

	If $arr_empty_empty_first.Contains($pixel) Then
		$object = 'empty_empty'
	ElseIf $arr_clicked_empty_first.Contains($pixel) Then
		$object = 'clicked_empty'
	Else
		$object = $pixel
	EndIf
Return $object
EndFunc;



Func count_pixel_and_otput_to_console_and_do_action( _
	$button, _ 														;
	$action, _ 														;
	$pixel_in_memory_new, _ 										;0
	$pixel_in_memory_old, _ 										;1
	$new_memory_pixel_counter, _ 									;2
	$old_memory_pixel_counter, _ 									;3
	$future_click_counter, _ 										;4
	$future_unclick_counter, _										;5
	$actual_click_counter, _ 										;6
	$actual_unclick_counter)										;7

	Global $global_time = TimerInit()

	$current_pixel_state = get_current_pixel_state($button)
	Local $future_click_counter_array[2] = [$future_click_counter, $future_unclick_counter]
	Local $actual_click_counter_array[2] = [$actual_click_counter, $actual_unclick_counter]

	If $current_pixel_state = $pixel_in_memory_new Then
		$new_memory_pixel_counter = $new_memory_pixel_counter + 1
	Else
		$pixel_in_memory_new = $current_pixel_state
		$new_memory_pixel_counter = 0
	EndIf
	;Local $timermarker = TimerInit() - $global_time
	;ConsoleWrite  ("! " & @ScriptLineNumber & "Marker 1: execution time = " & $timermarker & @LF)
	If $new_memory_pixel_counter > 5 Then

		If $pixel_in_memory_old = $pixel_in_memory_new Then
			$old_memory_pixel_counter = $old_memory_pixel_counter + 1
		Else
			ConsoleWrite  ($button & ": " & $pixel_in_memory_old & " was " & $old_memory_pixel_counter & @LF)
			$future_click_counter_array = state_change_reaction($pixel_in_memory_new, _
																$pixel_in_memory_old, _
																$button, _
																$action, _
																$future_click_counter, _
																$future_unclick_counter _
																)

			$pixel_in_memory_old = $pixel_in_memory_new
			$old_memory_pixel_counter = 5

			ConsoleWrite  ($button & ": " & $pixel_in_memory_new & @LF)
		EndIf
	EndIf
	;$timermarker = TimerInit() - $global_time - $timermarker
	;ConsoleWrite  ("! " & @ScriptLineNumber & "Marker 2: execution time = " & $timermarker & @LF)
	$new_memory_pixel_counter = $new_memory_pixel_counter + 1

	$actual_click_counter_array = check_action_time_and_do_action_if_it_is_time($actual_click_counter, $actual_unclick_counter)
	;$timermarker = TimerInit() - $global_time - $timermarker
	;ConsoleWrite  ("! " & @ScriptLineNumber & "Marker 3: execution time = " & $timermarker & @LF)
	; Now transform vars to array so we can return that values (IDK any other solution)
	Local $func_array[8]
	$func_array[0] = $pixel_in_memory_new
	$func_array[1] = $pixel_in_memory_old
	$func_array[2] = $new_memory_pixel_counter
	$func_array[3] = $old_memory_pixel_counter
	$func_array[4] = $future_click_counter_array[0]
	$func_array[5] = $future_click_counter_array[1]
	$func_array[6] = $actual_click_counter_array[0]
	$func_array[7] = $actual_click_counter_array[1]
	Return $func_array
EndFunc;


Func check_action_time_and_do_action_if_it_is_time($actual_click_counter, $actual_unclick_counter)
	
	Global $c_button = $global_click_button_array[$actual_click_counter]



	Local $timermarker = TimerInit() - $global_time
	ConsoleWrite  ("! " & @ScriptLineNumber & "Marker 2___1: execution time = " & $timermarker & @LF)


	$actual_click_counter = check_action_time_and_do_action_if_it_is_time_CLICK($actual_click_counter)
	

	$timermarker = TimerInit() - $global_time - $timermarker
	ConsoleWrite  ("! " & @ScriptLineNumber & "Marker 2___2: execution time = " & $timermarker & @LF)




	$actual_unclick_counter = check_action_time_and_do_action_if_it_is_time_UNCLICK($actual_unclick_counter)
	;$timermarker = TimerInit() - $global_time - $timermarker
	;ConsoleWrite  ("! " & @ScriptLineNumber & "Marker 2___3: execution time = " & $timermarker & @LF)
	Local $func_array[2]
	$func_array[0] = $actual_click_counter
	$func_array[1] = $actual_unclick_counter
	Return $func_array
EndFunc


Func check_action_time_and_do_action_if_it_is_time_CLICK($actual_click_counter)

	

	If  $global_time > $global_click_time_array[$actual_click_counter] Then
		ConsoleWrite ("! " & @ScriptLineNumber &  "Here an execution of a click number " & $actual_click_counter - 4 & " button: " & $global_click_button_array[$actual_click_counter] & _
		" time defference: " & $global_time - $global_click_time_array[$actual_click_counter] &  @LF)
		;$timermarker = TimerInit() - $global_time - $timermarker
		;ConsoleWrite  ("! " & @ScriptLineNumber & "Marker 2___1___4___1: execution time = " & $timermarker & @LF)
		execute_click($c_button)
		;$timermarker = TimerInit() - $global_time - $timermarker
		;ConsoleWrite  ("! " & @ScriptLineNumber & "Marker 2___1___4___2: execution time = " & $timermarker & @LF)
		$actual_click_counter = $actual_click_counter + 1
		$actual_click_counter = check_action_time_and_do_action_if_it_is_time_CLICK($actual_click_counter)
	EndIf

	Return $actual_click_counter
EndFunc


Func check_action_time_and_do_action_if_it_is_time_UNCLICK($actual_unclick_counter)

	Local $u_button = $global_unclick_button_array[$actual_unclick_counter]

	If $global_time > $global_unclick_time_array[$actual_unclick_counter] Then
		ConsoleWrite ("! " & @ScriptLineNumber &  "Here an execution of a UNclick number " & $actual_unclick_counter - 4 & " button: " & $global_unclick_button_array[$actual_unclick_counter] & _
		" time defference: " & $global_time - $global_unclick_time_array[$actual_unclick_counter] &  @LF)
		execute_unclick($u_button)
		$actual_unclick_counter = $actual_unclick_counter + 1
		$actual_unclick_counter = check_action_time_and_do_action_if_it_is_time_UNCLICK($actual_unclick_counter)
	EndIf
	Return $actual_unclick_counter
EndFunc


Func state_change_reaction($current_pixel_state, $old_pixel_state, $button, $action, $future_click_counter, $future_unclick_counter)
	if ($current_pixel_state <> 'empty_empty' and $current_pixel_state <> 'clicked_empty') and _
	   ($old_pixel_state = 'empty_empty' or $old_pixel_state = 'clicked_empty') Then ; was empty became something
	    If $action Then
			hold_click_action($button, $future_click_counter)
			$future_click_counter = $future_click_counter + 1
		EndIf
		ConsoleWrite  ("! " & @ScriptLineNumber & $button & ": Click and hold, future action count = " & $future_click_counter - 4 & @LF)
	EndIf
	if ($old_pixel_state <> 'empty_empty' and $old_pixel_state <> 'clicked_empty') and _
	   ($current_pixel_state = 'empty_empty' or $current_pixel_state = 'clicked_empty') Then ; was something became empty
	    If $action Then
			unclick_action($button, $future_unclick_counter)
			$future_unclick_counter = $future_unclick_counter + 1
		EndIf
		ConsoleWrite  ("- " & @ScriptLineNumber & $button & ": UNclick, future action count = " & $future_unclick_counter - 4 & @LF)
	EndIf

	Local $return_array[2]
	$return_array[0] = $future_click_counter
	$return_array[1] = $future_unclick_counter
	Return $return_array
EndFunc;


Func loop_all_buttons_and_do_actions_count_and_etc()


	Local $first_func_array[8] = [0,0,0,0,0,0,1,1]
	Local $second_func_array[8] = [0,0,0,0,0,0,1,1]
	Local $third_func_array[8] = [0,0,0,0,0,0,1,1]
	Local $four_func_array[8] = [0,0,0,0,0,0,1,1]
	While 1
		$first_func_array = count_pixel_and_otput_to_console_and_do_action(1, True, _
			$first_func_array[0], _
			$first_func_array[1], _
			$first_func_array[2], _
			$first_func_array[3], _
			$first_func_array[4], _
			$first_func_array[5], _
			$first_func_array[6], _
			$first_func_array[7])
		$second_func_array = count_pixel_and_otput_to_console_and_do_action(2, True, _
			$second_func_array[0], _
			$second_func_array[1], _
			$second_func_array[2], _
			$second_func_array[3], _
			$first_func_array[4], _
			$first_func_array[5], _
			$first_func_array[6], _
			$first_func_array[7])
		$third_func_array = count_pixel_and_otput_to_console_and_do_action(3, True, _
			$third_func_array[0], _
			$third_func_array[1], _
			$third_func_array[2], _
			$third_func_array[3], _
			$second_func_array[4], _
			$second_func_array[5], _
			$second_func_array[6], _
			$second_func_array[7])
		$four_func_array = count_pixel_and_otput_to_console_and_do_action(4, True, _
			$four_func_array[0], _
			$four_func_array[1], _
			$four_func_array[2], _
			$four_func_array[3], _
			$third_func_array[4], _
			$third_func_array[5], _
			$third_func_array[6], _
			$third_func_array[7])
		; magic for counters memory goes like 1->2->3->4->1 etc...
		$first_func_array[4] = $four_func_array[4]
		$first_func_array[5] = $four_func_array[5]
		$first_func_array[6] = $four_func_array[6]
		$first_func_array[7] = $four_func_array[7]
	WEnd
EndFunc


loop_all_buttons_and_do_actions_count_and_etc()



; todo add 2 levels of logging

Func execute_click($button)
	If $button = 1 Then
		hold_click_first()
	ElseIf $button = 2 Then
		hold_click_second()
	ElseIf $button = 3 Then
		hold_click_third()
	ElseIf $button = 4 Then
		hold_click_four()
	EndIf
EndFunc

Func execute_unclick($button)
	If $button = 1 Then
		unclick_first()
	ElseIf $button = 2 Then
		unclick_second()
	ElseIf $button = 3 Then
		unclick_third()
	ElseIf $button = 4 Then
		unclick_four()
	EndIf
EndFunc

Func hold_click_action($button, $future_click_counter)
	Local $future_time = $global_time + $delay
	$global_click_time_array[$future_click_counter] = $future_time
	$global_click_button_array[$future_click_counter] = $button
EndFunc

Func unclick_action($button, $future_unclick_counter)
	Local $future_time = $global_time + $delay
	$global_unclick_time_array[$future_unclick_counter] = $future_time
	$global_unclick_button_array[$future_unclick_counter] = $button
EndFunc

Func hold_click_first()
	;Sleep(450)
	;ConsoleWrite  ("- " & @ScriptLineNumber & "hold click first starto " & @LF)
	ControlSend("NoxPlayer", "centralWidgetWindow", "" , "{z down}")
	;ConsoleWrite  ("- " & @ScriptLineNumber & "hold click first stoped " & @LF)
	; MouseMove(737, 800, 1)
	;MouseDown("left")
EndFunc

Func unclick_first()
	;Sleep(450)
	ControlSend("NoxPlayer", "centralWidgetWindow", "" , "{z up}")
	; MouseMove(737, 800, 1)
	;MouseUp("left")
EndFunc

Func hold_click_second()
	;Sleep(450)
	ControlSend("NoxPlayer", "centralWidgetWindow", "" , "{x down}")
	; MouseMove(872, 800, 1)
	;MouseDown("left")
EndFunc

Func unclick_second()
	;Sleep(450)
	ControlSend("NoxPlayer", "centralWidgetWindow", "" , "{x up}")
	; MouseMove(872, 800, 1)
	;MouseUp("left")
EndFunc

Func hold_click_third()
	;Sleep(450)
	ControlSend("NoxPlayer", "centralWidgetWindow", "" , "{c down}")
	; MouseMove(1007, 800, 1)
	;MouseDown("left")
EndFunc

Func unclick_third()
	;Sleep(450)
	ControlSend("NoxPlayer", "centralWidgetWindow", "" , "{c up}")
	; MouseMove(1007, 800, 1)
	;MouseUp("left")
EndFunc

Func hold_click_four()
	;Sleep(450)
	ControlSend("NoxPlayer", "centralWidgetWindow", "" , "{v down}")
	; MouseMove(1141, 800, 1)
	;MouseDown("left")
EndFunc

Func unclick_four()
	;Sleep(450)
	ControlSend("NoxPlayer", "centralWidgetWindow", "" , "{v up}")
	; MouseMove(1141, 800, 1)
	;MouseUp("left")
EndFunc

