extends MovementBaseState

export var MAX_SPEED = 10

func enter():
    animationState.travel("Walking")
    velocity = Vector3.ZERO

func update(_delta):
    if Input.is_action_just_pressed("jump") and player.is_on_floor():
        emit_signal("finished", "jump")

    velocity = detect_player_velocity(MAX_SPEED)

    if velocity.x < 0:
        playerMesh.rotation_degrees.y = -90
    else:
        playerMesh.rotation_degrees.y = 90

    if is_zero_approx(velocity.x):
        emit_signal("finished", "idle")
    velocity = player.move_and_slide(velocity, Vector3.UP)
