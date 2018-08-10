extends KinematicBody2D

# This code comes almost entirelly from a grid snapping tutorial by
# Airvikar found here: https://www.youtube.com/watch?v=6h79ZiJWZYA

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
    if $SceneTimer.get_time_left() > 0:
        return

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

        # If we will move past our target on next move
        if step == CELL_SIZE / SPEED:
            direction = STOP
            step = 0
            # Snap to grid at end of movement
            position.x = round(position.x / 16) * 16
            position.y = round(position.y / 16) * 16

func handle_collisions(collision):
    if (collision != null &&
        collision.collider != null &&
        collision.collider.get_meta_list().size() > 0):
            if collision.collider.has_meta("TeleportScene") and collision.collider.has_meta("TeleportID"):
                var teleport_scene = collision.collider.get_meta("TeleportScene")
                var teleport_id = collision.collider.get_meta("TeleportID")
                global_state.Root.switch_scene(teleport_scene, teleport_id)
            else:
                emit_signal("collision_event", collision)

func scene_pause():
    direction = STOP
    step = 0
    $SceneTimer.start()