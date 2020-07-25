extends MovementBaseState

func enter():
    animationState.travel("Idle")

func update(_delta):
    if Input.is_action_just_pressed("jump"):
        emit_signal("finished", "jump")
    if abs(Input.get_action_strength("move_right") - Input.get_action_strength("move_left")) > 0:
        emit_signal("finished", "moving")
    
    velocity = detect_player_velocity(0)
    velocity = player.move_and_slide(velocity)
