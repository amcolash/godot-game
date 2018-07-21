extends Node

func _ready():
    global_input.connect("ui_cancel", self, "confirm_quit")
    $Buttons/Start.grab_focus()
    $Shader.show()

func open_options():
    scene_stack.push_scene("res://scenes/menus/options.tscn")

func confirm_quit():
    $CenterContainer/ExitConfirmation.popup()

func quit_game():
    get_tree().quit()