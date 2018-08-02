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

    var start = scene_instance.get_node("Start")
    if start != null:
        position = start.position

    if position != null:
        $Player.position = position

    var grid = load("res://scenes/util/tilemap_grid.tscn")
    var grid_instance = grid.instance()
    scene_instance.add_child(grid_instance)