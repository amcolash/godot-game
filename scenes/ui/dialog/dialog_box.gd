# DialogBox.gd
extends Node

signal dialog_complete

export (Array, String) var dialog
export (Texture) var avatar

var page = 0

func _ready():
    if (avatar != null):
        load(avatar.resource_path)
        $Canvas/Avatar.set_texture(avatar)

    set_page(0)

func _input(event):
    if event is InputEventMouseButton || event.is_action_pressed("ui_accept"):
        if $Canvas/Text.get_visible_characters() > $Canvas/Text.get_total_character_count():
            set_page(page + 1)
        else:
            $Canvas/Text.set_visible_characters($Canvas/Text.get_total_character_count())

func set_page(page):
    if page == 0:
        fade_background(true)

    if page < dialog.size():
        self.page = page
        $Canvas/Text.set_bbcode(dialog[page])
        $Canvas/Text.set_visible_characters(0)
    else:
        self.page = -1
        fade_background(false)
        emit_signal("dialog_complete")

func fade_background(fadeIn):
    var start = Color(1, 1, 1, 0 if fadeIn else 1)
    var end = Color(1, 1, 1, 1 if fadeIn else 0)

    $Tween.interpolate_property($Canvas/CanvasModulate, "color", start, end, 1,
                    Tween.TRANS_QUAD, Tween.EASE_IN_OUT)
    $Tween.start()

func _on_TextTimer_timeout():
    $Canvas/Text.set_visible_characters($Canvas/Text.get_visible_characters() + 1)

func _on_Tween_tween_completed(object, key):
    $TextTimer.start()