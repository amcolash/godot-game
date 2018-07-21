extends Node

signal ui_select
signal ui_cancel

func _ready():
    set_process_input(true)

func _input(event):
    check_input(event, "ui_select")
    check_input(event, "ui_cancel")

func check_input(event, name):
    if not event.is_action_pressed(name):
        return

    var connections = get_signal_connection_list(name)
    if connections.size() > 0:
        emit_signal(name)
        get_tree().set_input_as_handled()