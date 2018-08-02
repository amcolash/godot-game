extends Node

func _ready():
    var current_scene = global_state.game.current_scene
    var position = global_state.game.position

    if current_scene == null:
        current_scene = "res://scenes/game/maps/map1.tscn"

    # TODO: Safely load
    var scene = load(current_scene)
    var scene_instance = scene.instance()
    scene_instance.set_name("MainScene")
    $Scene.add_child(scene_instance)

    if position == null:
        var start = scene_instance.get_node("Start")
        if start != null:
            position = start.position

    $Player.position = position

func _process(delta):
    $RotationTest.rotation += delta
