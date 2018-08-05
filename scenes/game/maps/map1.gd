extends Node2D

func _ready():
    var player = get_node("/root/Game Root/Player")
    if player != null:
        player.connect("collision_event", self, "_on_collision")

func _on_collision(collision):
    pass