extends FairyBaseState

export var MIN_WANDER = 2
export var MAX_WANDER = 5
export var MAX_SPEED = 20
export var ACCELERATION = 30
export var DECELERATION  = 60

onready var original_position = enemy.global_transform.origin

var target
var velocity = Vector3.ZERO

func enter():
    # TODO Wandering animation
    connect_to_playerdetection()
    velocity = Vector3.ZERO
    target = Vector3.ZERO
    target.x = original_position.x + rand_range(-MAX_WANDER, MAX_WANDER)
    target.y = original_position.y + rand_range(-MAX_WANDER, MAX_WANDER)

func exit():
    disconnect_from_playerdetection()

func update(delta):
    if abs(target.x - enemy.global_transform.origin.x) < 0.1:
        emit_signal("finished", "idle")
    var direction = enemy.global_transform.origin.direction_to(target)

    if direction.x < 0:
        mesh.rotation_degrees.y = -90
    else:
        mesh.rotation_degrees.y = 90
    
    var accel
    if direction.dot(target):
        accel = ACCELERATION
    else:
        accel = DECELERATION

    velocity = velocity.linear_interpolate(direction * MAX_SPEED, accel * delta)
    velocity = enemy.move_and_slide(velocity, Vector3.UP)
