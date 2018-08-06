extends KinematicBody2D

signal collision_event

const SPEED = 2 # powers of two: 1, 2, 4, 8, 16

const UP = Vector2(0, -1)
const DOWN = Vector2(0, 1)
const LEFT = Vector2(-1, 0)
const RIGHT = Vector2(1, 0)
const STOP = Vector2(0, 0)

const CELL_SIZE = 16

var step = 0
var direction = STOP

func _physics_process(delta):
    step_move("ui_up", UP)
    step_move("ui_down", DOWN)
    step_move("ui_left", LEFT)
    step_move("ui_right", RIGHT)

func step_move(action, dir):
    if (Input.is_action_pressed(action) && direction == STOP) || dir == direction:
        direction = dir
        step += 1

        var collision = move_and_collide(direction * SPEED)
        handle_collisions(collision)

        $Camera2D.align()

        if step == CELL_SIZE / SPEED:
            direction = STOP
            step = 0

func handle_collisions(collision):
    if (collision != null &&
        collision.collider != null &&
        collision.collider.get_meta_list().size() > 0):
            emit_signal("collision_event", collision)