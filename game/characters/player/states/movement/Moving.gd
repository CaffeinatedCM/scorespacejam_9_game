extends MovementBaseState

export var MAX_SPEED = 10



func enter():
    velocity = Vector3.ZERO

func update(delta):
    var target_velocity = Vector3(direction.x * MAX_SPEED, -GRAVITY, 0)

    if Input.is_action_just_pressed("jump") and player.is_on_floor():
        emit_signal("finished", "jump")

    var accel
    if direction.dot(target_velocity):
        accel = ACCELERATION
    else:
        accel = DEACCELERATION
    velocity = detect_player_velocity(MAX_SPEED)
    velocity = player.move_and_slide(velocity, Vector3.UP)
