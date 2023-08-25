#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
#CS #include <GUIConstantsEx.au3>
### #include <WindowsConstants.au3>
### #include <EditConstants.au3>
###
### ; Define the size and position of the window
### Global $winWidth = 400, $winHeight = 300
### Global $winXPos = (@DesktopWidth - $winWidth) / 2, $winYPos = (@DesktopHeight - $winHeight) / 2
###
### ; Create the GUI window
### Global $hWnd = GUICreate("Button Demo", $winWidth, $winHeight, $winXPos, $winYPos, BitOR($WS_OVERLAPPEDWINDOW, $WS_VISIBLE, $WS_CLIPSIBLINGS))
###
### ; Create the button array
### Global $buttons[4][2] = [["Button 1", "Func1"], ["Button 2", "Func2"], ["Button 3", "Func3"], ["Button 4", "Func4"]]
###
### ; Create the buttons
### For $i = 0 To UBound($buttons) - 1
###     ; Define the size and position of the button
###     $btnWidth = 50
###     $btnHeight = 50
###     $btnXPos = 10
###     $btnYPos = 10 + ($i * ($btnHeight + 10))
###
###     ; Create the button
###     $buttons[$i][0] = GUICtrlCreateButton($buttons[$i][0], $btnXPos, $btnYPos, $btnWidth, $btnHeight)
### Next
###
### ; Create the text area
### Global $txtWidth = $winWidth - $btnWidth - 30
### Global $txtHeight = $winHeight - 30
### Global $txtXPos = $btnWidth + 20
### Global $txtYPos = 10
### Global $txt
### $txt = GUICtrlCreateEdit("", $txtXPos, $txtYPos, $txtWidth, $txtHeight, BitOR($ES_MULTILINE, $WS_VSCROLL))
###
### ; Set the event handlers for the buttons
### For $i = 0 To UBound($buttons) - 1
###     GUICtrlSetOnEvent($buttons[$i][0], $buttons[$i][1])
### Next
###
### ; Show the GUI window
### GUISetState()
###
### ; Define the functions that the buttons will call
### Func Func1()
###     GUICtrlSetData($txt, "Button 1 was pressed." & @CRLF, 1)
### EndFunc
###
### Func Func2()
###     GUICtrlSetData($txt, "Button 2 was pressed." & @CRLF, 1)
### EndFunc
###
### Func Func3()
###     GUICtrlSetData($txt, "Button 3 was pressed." & @CRLF, 1)
### EndFunc
###
### Func Func4()
###     GUICtrlSetData($txt, "Button 4 was pressed." & @CRLF, 1)
### EndFunc
###
### ; Start the message loop
### While 1
###     Switch GUIGetMsg()
###         Case $GUI_EVENT_CLOSE
###             ExitLoop
###     EndSwitch
### WEnd
###
### ; Clean up
### GUIDelete($hWnd)
 #CE

#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <EditConstants.au3>

Global $btnWidth = 50
Global $btnHeight = 50
Global $btnMargin = 10
Global $txtWidth = 100
Global $txtHeight = 20
Global $txtXPos = $btnWidth + 2 * $btnMargin
Global $txtYPos = $btnMargin

Global $gui = GUICreate("My GUI", 400, 300)
Global $btn1 = GUICtrlCreateButton("Button 1", $btnMargin, $btnMargin, $btnWidth, $btnHeight)
Global $txt1 = GUICtrlCreateLabel("Text 1", $txtXPos, $btnMargin, $txtWidth, $txtHeight)
GUICtrlSetFont($txt1, 10, 800)

Global $btn2 = GUICtrlCreateButton("Button 2", $btnMargin, $btnHeight + 2 * $btnMargin, $btnWidth, $btnHeight)
Global $txt2 = GUICtrlCreateLabel("Text 2", $txtXPos, $btnHeight + 2 * $btnMargin, $txtWidth, $txtHeight)
GUICtrlSetFont($txt2, 10, 800)

Global $btn3 = GUICtrlCreateButton("Button 3", $btnMargin, 2 * ($btnHeight + $btnMargin), $btnWidth, $btnHeight)
Global $txt3 = GUICtrlCreateLabel("Text 3", $txtXPos, 2 * ($btnHeight + $btnMargin), $txtWidth, $txtHeight)
GUICtrlSetFont($txt3, 10, 800)

Global $btn4 = GUICtrlCreateButton("Button 4", $btnMargin, 3 * ($btnHeight + $btnMargin), $btnWidth, $btnHeight)
Global $txt4 = GUICtrlCreateLabel("Text 4", $txtXPos, 3 * ($btnHeight + $btnMargin), $txtWidth, $txtHeight)
GUICtrlSetFont($txt4, 10, 800)

GUISetState(@SW_SHOW)

While 1
    Switch GUIGetMsg()
        Case $GUI_EVENT_CLOSE
            Exit
        Case $btn1
            ; Call function for Button 1
        Case $btn2
            ; Call function for Button 2
        Case $btn3
            ; Call function for Button 3
        Case $btn4
            ; Call function for Button 4
    EndSwitch
WEnd

