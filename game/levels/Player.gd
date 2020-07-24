extends KinematicBody2D

export var MAX_SPEED = 200
export var GRAVITY = 98
export var JUMP_POWER = 100

var velocity = Vector2.ZERO
var direction = Vector2.ZERO

func _physics_process(delta):
    direction.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
    direction = direction.normalized()

    if direction.x < 0:
        $Sprite.flip_h = true
    elif direction.x > 0:
        $Sprite.flip_h = false
    
    var target_velocity = Vector2(direction.x * MAX_SPEED, GRAVITY)

    if Input.is_action_just_pressed("jump") and is_on_floor():
        velocity.y = -JUMP_POWER

    velocity = velocity.linear_interpolate(target_velocity, delta)

    velocity = move_and_slide(velocity, Vector2.UP)