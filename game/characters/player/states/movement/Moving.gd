extends PlayerBaseState

export var MAX_SPEED = 10
export var GRAVITY = 24.8
export var ACCELERATION = 4.5
export var DEACCELERATION = 16


var velocity = Vector3.ZERO
var direction = Vector3.ZERO 

func enter():
    velocity = Vector3.ZERO

func update(delta):
    direction.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
    direction = direction.normalized()

    var target_velocity = Vector3(direction.x * MAX_SPEED, -GRAVITY, 0)

    if Input.is_action_just_pressed("jump") and player.is_on_floor():
        emit_signal("finished", "jump")

    var accel
    if direction.dot(target_velocity):
        accel = ACCELERATION
    else:
        accel = DEACCELERATION

    velocity = velocity.linear_interpolate(target_velocity, accel * delta)

    velocity = player.move_and_slide(velocity, Vector3.UP)
