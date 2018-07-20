extends Node

func _ready():
    $Buttons/Start.grab_focus()

func open_options():
    scene_stack.push_scene("res://scenes/menus/options.tscn")

func end_game():
    get_tree().quit()