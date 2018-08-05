extends Control

export var ui_action = ""

func _on_TextureButton_button_down():
    if ui_action.length() > 0:
        Input.action_press(ui_action)

func _on_TextureButton_button_up():
    if ui_action.length() > 0:
        Input.action_release(ui_action)