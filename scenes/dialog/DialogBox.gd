# DialogBox.gd
extends Node

signal dialog_complete

export (Array, String) var dialog
var page = 0

func _ready():
    set_process_input(true)
    set_page(0)

func _input(event):
    # Close the game on ESC
    if event is InputEventKey && event.get_scancode() == KEY_ESCAPE:
        get_tree().quit()
        return
    
    if (event is InputEventMouseButton || event is InputEventKey) && event.is_pressed():
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