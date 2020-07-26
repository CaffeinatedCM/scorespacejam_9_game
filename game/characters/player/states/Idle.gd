extends MovementBaseState

func enter():
    animationState.travel("Idle")

func update(_delta):
    get_player_direction()
    if Input.is_action_just_pressed("jump"):
        if Input.get_action_strength("move_down") > 0:
            print("Help I've falling and I can't get up")
            emit_signal("finished", "falling")
            return
        else:
            emit_signal("finished", "jump")
            return
    if direction.x != 0:
        emit_signal("finished", "moving")
        return
    
    velocity = detect_player_velocity(30)
    velocity = player.move_and_slide(velocity, Vector3.UP)
