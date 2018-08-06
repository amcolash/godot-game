extends Node

export var use_grid = true

func _ready():
    var current_scene = global_state.game.current_scene
    var position = global_state.game.position

    if current_scene == null:
        current_scene = "res://scenes/game/maps/map1.tscn"

    var scene = load(current_scene)
    var scene_instance = scene.instance()
    scene_instance.set_name("MainScene")
    $Scene.add_child(scene_instance)

    if position == null:
        var start = scene_instance.find_node("Start")
        if start != null:
            position = start.position

    if position != null:
        # Snap player to the grid
        $Player.position.x = round(position.x / 16) * 16
        $Player.position.y = round(position.y / 16) * 16

    if use_grid:
        var grid = load("res://scenes/util/tilemap_grid.tscn")
        var grid_instance = grid.instance()
        scene_instance.add_child(grid_instance)
