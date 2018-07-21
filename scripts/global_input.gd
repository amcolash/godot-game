extends Node

# Global Input Handling

signal ui_cancel

func _ready():
    set_process_input(true)

func _input(event):
    # Only send signal on initial press
    if event.is_action_pressed("ui_cancel"):
        self.emit_signal("ui_cancel")