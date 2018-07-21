extends Node

func _ready():
    input_handler.connect("ui_cancel", self, "quit_game")
    $Buttons/Start.grab_focus()
    $Shader.show()

func start_game():
    scene_stack.push_scene("res://scenes/game/game.tscn")

func open_options():
    scene_stack.push_scene("res://scenes/menus/options/options_screen.tscn")

func quit_game():
    get_tree().quit()