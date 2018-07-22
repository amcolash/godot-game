extends Node

func _ready():
    input_handler.connect("ui_cancel", self, "toggle")

# Handle input since the options are dumb and don't know if they are hidden/shown
func toggle():
    if $PopupDialog.visible:
        $PopupDialog.hide()
        get_tree().paused = false
    else:
        get_tree().paused = true
        $PopupDialog.show()
        $PopupDialog/VBoxContainer/Resume.grab_focus()

# If the actual button is clicked on instead of a key press
func options_back():
    toggle()

func exit():
    get_tree().paused = false
    scene_stack.pop_scene()