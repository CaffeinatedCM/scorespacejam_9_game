extends PlayerBaseState

export var MAX_SPEED = 200
export var GRAVITY = 98

var velocity = Vector2.ZERO
var direction = Vector2.ZERO

func enter():
    velocity = Vector2.ZERO

func update(delta):
    direction.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
    direction = direction.normalized()

    if direction.x < 0:
        playerSprite.flip_h = true
    elif direction.x > 0:
        playerSprite.flip_h = false
    
    var target_velocity = Vector2(direction.x * MAX_SPEED, GRAVITY)

    if Input.is_action_just_pressed("jump") and player.is_on_floor():
        emit_signal("finished", "jump")

    velocity = velocity.linear_interpolate(target_velocity, delta)

    velocity = player.move_and_slide(velocity, Vector2.UP)