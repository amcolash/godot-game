extends VBoxContainer

func _ready():
    get_state($Music, "music")
    get_state($SFX, "sfx")
    get_state($"V-Sync", "vsync")

    hide_buttons()

func get_state(button, name):
    button.pressed = global_state.options[name]

func set_state(pressed, name):
    global_state.options[name] = pressed
    save_manager.save_data(global_state.options)

func hide_buttons():
    var menu_only = [
        $"V-Sync"
    ]

    var name = get_tree().get_current_scene().get_path().get_name(1)
    if name.casecmp_to("Options Screen") != 0:
        for option in menu_only:
            option.visible = false

func _on_VSync_toggled(button_pressed):
    set_state(button_pressed, "vsync")
    OS.set_use_vsync(button_pressed);