extends CanvasLayer

var is_hovered = false
var initial_pos
var max_dist = 64
var control
var active = true
export var always_show = false

func _ready():
    control = $Directional
    initial_pos = control.rect_position

    if not OS.has_touchscreen_ui_hint() && !always_show:
        active = false
        for child in get_children():
            if child.get("visible") != null:
                child.visible = false

func _process(delta):
    if not active:
        return

    # Clear previous press state
    _simulate_action("ui_right", false)
    _simulate_action("ui_left", false)
    _simulate_action("ui_down", false)
    _simulate_action("ui_up", false)

    if is_hovered && Input.is_mouse_button_pressed(BUTTON_LEFT):
        var pos = get_viewport().get_mouse_position()
        pos -= (control.rect_size / 2)

        var offset = (pos - initial_pos)
        var offset_len = offset.length()

        if offset_len < max_dist / 3:
            offset.x = 0
            offset.y = 0
        else:
            if abs(offset.x) > abs(offset.y):
                offset.y = 0
                if offset.x > 0:
                    offset.x = max_dist
                    _simulate_action("ui_right", true)
                else:
                    offset.x = -max_dist
                    _simulate_action("ui_left", true)

            else:
                offset.x = 0
                if offset.y > 0:
                    offset.y = max_dist
                    _simulate_action("ui_down", true)
                else:
                    offset.y = -max_dist
                    _simulate_action("ui_up", true)

        control.set_position(initial_pos + offset)
    else:
        control.set_position(initial_pos)

func _on_TextureRect_mouse_entered():
    is_hovered = true

func _on_TextureRect_mouse_exited():
    is_hovered = false

func _on_Confirm_button_down():
    _simulate_action("ui_accept", true)

func _on_Confirm_button_up():
    _simulate_action("ui_accept", false)

func _on_Cancel_button_down():
    _simulate_action("ui_cancel", true)

func _on_Cancel_button_up():
    _simulate_action("ui_cancel", false)

func _on_Pause_button_down():
    _simulate_action("ui_pause", true)

func _on_Pause_button_up():
    _simulate_action("ui_pause", false)


# Need to do this because of this: https://github.com/godotengine/godot/issues/11868
func _simulate_action(action, pressed):
    var event = InputEventAction.new()
    event.action = action
    event.pressed = pressed
    Input.parse_input_event(event)
