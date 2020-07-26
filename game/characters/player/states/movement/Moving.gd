extends MovementBaseState

export var MAX_SPEED = 10

func enter():
    animationState.travel("Walking")
    velocity = Vector3.ZERO

func update(_delta):
    if Input.is_action_just_pressed("jump"):
        emit_signal("finished", "jump")

    get_player_direction()
    if direction.x < 0:
        playerMesh.rotation_degrees.y = -90
    elif direction.x > 0:
        playerMesh.rotation_degrees.y = 90
    else:
        emit_signal("finished", "idle")

    velocity = detect_player_velocity(MAX_SPEED)    
    velocity = player.move_and_slide(velocity, Vector3.UP)
