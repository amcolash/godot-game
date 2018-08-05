extends Node

func _ready():
    input_handler.connect("ui_cancel", self, "move_cursor")
    input_handler.connect("ui_pause", self, "quit_game")
    $Buttons/Start.grab_focus()
    $Shader.show()

func start_game():
    scene_stack.push_scene("res://scenes/game/game.tscn")

func open_options():
    scene_stack.push_scene("res://scenes/ui/menus/options/options_screen.tscn")

func move_cursor():
    $Buttons/Exit.grab_focus()

func quit_game():
    get_tree().quit()