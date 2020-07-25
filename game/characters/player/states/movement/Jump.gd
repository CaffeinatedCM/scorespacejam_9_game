extends PlayerBaseState

export var JUMP_POWER = 15
export var GRAVITY = 12

var has_jumped = false
var velocity = Vector3.ZERO
var initial_velocity = Vector3.ZERO;

func initialize(vel):
    initial_velocity = vel

func enter():
    has_jumped = false
    velocity = initial_velocity
    velocity.y = JUMP_POWER

func update(delta):
    if has_jumped and player.is_on_floor():
        emit_signal("finished", "previous")
    if not has_jumped:
        velocity.y = JUMP_POWER
        has_jumped = true
        player.set_collision_mask_bit(2, false)
    else:
        velocity.y = velocity.linear_interpolate(Vector3(0, -GRAVITY, 0), delta).y 
        if velocity.y < 0:
            player.set_collision_mask_bit(2, true)
    
    velocity = player.move_and_slide(velocity, Vector3.UP)
