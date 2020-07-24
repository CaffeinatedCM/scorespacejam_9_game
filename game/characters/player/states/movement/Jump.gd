extends PlayerBaseState

export var JUMP_POWER = 100
export var GRAVITY = 98

var has_jumped = false
var velocity = Vector2.ZERO

func enter():
    has_jumped = false
    velocity = Vector2.ZERO

func update(delta):
    if has_jumped and player.is_on_floor():
        emit_signal("finished", "moving")
    if not has_jumped:
        velocity.y = -JUMP_POWER
        has_jumped = true
    else:
        velocity.y = velocity.linear_interpolate(Vector2(0, GRAVITY), delta).y 
    
    print("Velocity", velocity)
    velocity = player.move_and_slide(velocity, Vector2.UP)
