extends PlayerBaseState
class_name MovementBaseState

var direction = Vector3.ZERO 
export var GRAVITY = 12
export var ACCELERATION = 4.5
export var DEACCELERATION = 16
var velocity = Vector3.ZERO

func get_player_direction():
    direction.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
    direction = direction.normalized()

func detect_player_velocity(MAX_SPEED):
    var target_velocity = Vector3(direction.x * MAX_SPEED, -GRAVITY, 0)

    var accel
    if direction.dot(target_velocity):
        accel = ACCELERATION
    else:
        accel = DEACCELERATION

    return velocity.linear_interpolate(target_velocity, accel * get_physics_process_delta_time())
