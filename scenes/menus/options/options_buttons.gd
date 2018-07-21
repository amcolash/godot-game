extends VBoxContainer

func _ready():
    get_state($Music, "music")
    get_state($SFX, "sfx")

func get_state(button, name):
    button.pressed = global_state.options[name]

func set_state(pressed, name):
    global_state.options[name] = pressed
    save_manager.save_data(global_state.options)