extends Node

func _ready():
    input_handler.connect("ui_cancel", self, "toggle")

# Handle input since the options are dumb and don't know if they are hidden/shown
func toggle():
    if $PopupDialog.visible:
        $PopupDialog.hide()
    else:
        $PopupDialog.popup()

# If the actual button is clicked on instead of a key press
func options_back():
    $PopupDialog.hide()

func exit():
    scene_stack.pop_scene()