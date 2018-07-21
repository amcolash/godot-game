extends Node

func _ready():
    set_process_input(true)
    $CenterContainer/Buttons/Back.grab_focus()

func _input(event):
    if event.is_action_pressed("ui_cancel"):
        back()

func back():
    scene_stack.pop_scene()