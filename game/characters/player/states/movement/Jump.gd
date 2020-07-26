extends MovementBaseState

export var JUMP_POWER = 15
export var MAX_SPEED = 5


var has_jumped = false
var initial_velocity = Vector3.ZERO;

func initialize(vel):
    initial_velocity = vel

func enter():
    has_jumped = false
    velocity = initial_velocity
    velocity.y = JUMP_POWER

func update(delta):
    get_player_direction()
    velocity.x = detect_player_velocity(MAX_SPEED).x
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

    if Input.is_action_just_released("jump"):
        print('wtf')
        velocity.y = velocity.linear_interpolate(Vector3(0, -GRAVITY, 0), delta).y 
        if velocity.y < 0:
            player.set_collision_mask_bit(2, true)
    velocity = player.move_and_slide(velocity, Vector3.UP)
