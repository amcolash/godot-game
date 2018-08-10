extends Node

export var use_grid = true

func _ready():
    global_state.Root = self
    global_state.Player = $Player

    var current_scene = global_state.save.current_scene
    var position = global_state.save.position

    if current_scene == null:
        current_scene = "res://scenes/game/maps/map1.tscn"

    switch_scene(current_scene, null, false)
    $FadeLayer.emit_signal("fade_out")

func switch_scene(scene_path, teleport_id = null, fade = true):
    global_state.save.current_scene = scene_path
    global_state.save.teleport_id = teleport_id

    $Player.scene_pause()

    if fade:
        $FadeLayer.emit_signal("fade_in", self, "_switch_scene")
    else:
        _switch_scene()

func _switch_scene():
    if $Scene.get_child_count() > 0:
        for n in $Scene.get_children():
            n.queue_free()

    var scene_path = global_state.save.current_scene
    var teleport_id = global_state.save.teleport_id

    var scene = load(scene_path)
    var scene_instance = scene.instance()
    scene_instance.set_name("MainScene")
    $Scene.add_child(scene_instance)

    if use_grid:
        var grid = load("res://scenes/util/tilemap_grid.tscn")
        var grid_instance = grid.instance()
        scene_instance.add_child(grid_instance)

    var position = Vector2(0, 0)
    if teleport_id != null:
        position = get_teleporter_position(scene_instance, teleport_id)
    else:
        var start = scene_instance.find_node("Start")
        if start != null:
            position = start.position

    # Snap player to the grid
    $Player.position.x = round(position.x / 16) * 16
    $Player.position.y = round(position.y / 16) * 16

    $FadeLayer.emit_signal("fade_out")

func get_teleporter_position(scene_instance, teleport_id):
    var teleporter = find_teleporter(scene_instance, teleport_id)
    if teleporter != null:
        var offset = Vector2(0, -1)
        match teleporter.get_meta("TeleportOffset"):
            "N":
                offset.y = -1
            "S":
                offset.y = 1
            "E":
                offset.x = 1
            "W":
                offset.s = -1
        return teleporter.position + (offset * 16)

    return null

# This function makes the assumption we only have one object layer that is
# always named with the default title "Object Layer"
func find_teleporter(scene_instance, teleport_id):
    var objects = scene_instance.find_node("Object Layer")
    if objects != null:
        for node in objects.get_children():
            if node.get_meta("TeleportID") == teleport_id:
                return node

    return null