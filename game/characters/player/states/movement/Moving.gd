extends PlayerBaseState

export var MAX_SPEED = 20
export var GRAVITY = 9.8

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

    velocity = velocity.linear_interpolate(target_velocity, delta)

    velocity = player.move_and_slide(velocity, Vector3.UP)
