extends Node

func _ready():
    input_handler.connect("ui_cancel", self, "confirm_quit")
    $Buttons/Start.grab_focus()
    $Shader.show()

func start_game():
    scene_stack.push_scene("res://scenes/game/game.tscn")

func open_options():
    scene_stack.push_scene("res://scenes/menus/options/options_screen.tscn")

func confirm_quit():
    if $CenterContainer/ExitConfirmation.visible:
        $CenterContainer/ExitConfirmation.hide()
    else:
        $CenterContainer/ExitConfirmation.popup()

func quit_game():
    get_tree().quit()