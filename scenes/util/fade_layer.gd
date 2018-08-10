extends CanvasLayer

signal fade_in
signal fade_out

export var fade_duration = 0.6

func fade_in(caller = null, callback = null):
    $Tween.interpolate_property($Background, "color", Color(0, 0, 0, 0), Color(0, 0, 0, 1),
        fade_duration, Tween.TRANS_QUAD, Tween.EASE_IN_OUT)
    if caller != null && callback != null:
        $Tween.interpolate_callback(caller, fade_duration, callback)
    $Tween.start()

func fade_out(caller = null, callback = null):
    $Tween.interpolate_property($Background, "color", Color(0, 0, 0, 1), Color(0, 0, 0, 0),
        fade_duration, Tween.TRANS_QUAD, Tween.EASE_IN_OUT)
    if caller != null && callback != null:
        $Tween.interpolate_callback(caller, fade_duration, callback)
    $Tween.start()