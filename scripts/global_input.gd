extends Node

# Global Input Handling

signal ui_cancel

func _ready():
    set_process_input(true)

func _input(event):
    if event is InputEventKey && event.get_scancode() == KEY_Z:
        get_tree().quit()
        return

    if event.is_action("ui_cancel"):
        self.emit_signal("ui_cancel")