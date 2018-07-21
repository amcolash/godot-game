extends Node

func _ready():
    set_process_input(true)
    $Buttons/Start.grab_focus()
    $Shader.show()

func _input(event):
    if event.is_action_pressed("ui_cancel"):
        confirm_quit()

func open_options():
    scene_stack.push_scene("res://scenes/menus/options.tscn")

func confirm_quit():
    $CenterContainer/ExitConfirmation.popup()

func quit_game():
    get_tree().quit()