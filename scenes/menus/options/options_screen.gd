extends Node

func _ready():
    input_handler.connect("ui_cancel", self, "back")
    $VBoxContainer/Back.grab_focus()
    $Shader.show()

func back():
    scene_stack.pop_scene()