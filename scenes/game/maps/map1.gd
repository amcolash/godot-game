extends Node2D

func _ready():
    global_state.Player.connect("collision_event", self, "_on_collision")

func _on_collision(collision):
    pass