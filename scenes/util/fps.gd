extends CanvasLayer

func _process(delta):
    $Label.set_text("FPS: " + str(Engine.get_frames_per_second()))