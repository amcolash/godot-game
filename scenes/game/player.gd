extends KinematicBody2D

signal collision_event

export var max_speed = 150

var velocity = Vector2(0, 0)

func _physics_process(delta):
    var up = 1 if Input.is_action_pressed("ui_up") else 0
    var down = 1 if Input.is_action_pressed("ui_down") else 0
    var left = 1 if Input.is_action_pressed("ui_left") else 0
    var right = 1 if Input.is_action_pressed("ui_right") else 0

    if (up + down + left + right) == 0:
        velocity = velocity * 0.8
    else:
        velocity.x = right - left
        velocity.y = down - up
        if velocity.length() > 1:
            velocity = velocity.normalized()

    var offset = Vector2(velocity * delta * max_speed)

    var collision = move_and_collide(offset)
    if has_metadata(collision):
        emit_signal("collision_event", collision)

    $Camera2D.align()

func has_metadata(collision):
    return (collision != null &&
        collision.collider != null &&
        collision.collider.get_meta_list().size() > 0)