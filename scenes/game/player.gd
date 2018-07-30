extends KinematicBody2D

var velocity = Vector2(0, 0)
var max_speed = 200

func _process(delta):
    velocity.x = 0
    velocity.y = 0

    if Input.is_action_pressed("ui_up"):
        velocity.y = -1
    if Input.is_action_pressed("ui_down"):
        velocity.y = 1
    if Input.is_action_pressed("ui_left"):
        velocity.x = -1
    if Input.is_action_pressed("ui_right"):
        velocity.x = 1

    if velocity.length() > 1.0:
        velocity = velocity.normalized()

    move_and_collide(velocity * delta * max_speed)