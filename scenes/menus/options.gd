extends Node

func _ready():
    global_input.connect("ui_cancel", self, "back")
    $CenterContainer/Buttons/Back.grab_focus()

func back():
    scene_stack.pop_scene()