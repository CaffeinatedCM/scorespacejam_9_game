extends MovementBaseState

func enter():
    animationState.travel("Idle")

func update(_delta):
    get_player_direction()
    if Input.is_action_just_pressed("jump"):
        emit_signal("finished", "jump")
    if direction.x != 0:
        emit_signal("finished", "moving")
    
    velocity = detect_player_velocity(30)
    velocity = player.move_and_slide(velocity, Vector3.UP)
