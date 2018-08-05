extends VBoxContainer

func _ready():
    get_state($Music, "music")
    get_state($SFX, "sfx")
    get_state($"V-Sync", "vsync")

func get_state(button, name):
    button.pressed = global_state.options[name]

func set_state(pressed, name):
    global_state.options[name] = pressed
    save_manager.save_data(global_state.options)

func _on_VSync_toggled(button_pressed):
    set_state(button_pressed, "vsync")
    OS.set_use_vsync(button_pressed);
