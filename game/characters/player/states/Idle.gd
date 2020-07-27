extends MovementBaseState

func enter():
    animationState.travel("Idle")

func update(_delta):
    get_player_direction()
    if Input.is_action_just_pressed("jump") and player.is_on_floor():
        emit_signal("finished", "jump")
        return
    if direction.x != 0:
        emit_signal("finished", "moving")
        return
    
    velocity = detect_player_velocity(30)
    velocity = player.move_and_slide(velocity, Vector3.UP)
