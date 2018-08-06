extends CanvasLayer

func _ready():
    input_handler.connect("ui_cancel", self, "hide")
    input_handler.connect("ui_pause", self, "toggle")

# Handle input since the options are dumb and don't know if they are hidden/shown
func toggle():
    if $PopupDialog.visible:
        hide()
    else:
        show()

func show():
    get_tree().paused = true
    $PopupDialog.show()
    $PopupDialog/MarginContainer/VBoxContainer/Resume.grab_focus()

func hide():
    $PopupDialog.hide()
    get_tree().paused = false

func exit():
    get_tree().paused = false
    scene_stack.pop_scene()