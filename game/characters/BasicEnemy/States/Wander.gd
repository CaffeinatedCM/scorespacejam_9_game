extends BasicEnemyBaseState

export var MAX_SPEED = 10
export var MAX_WANDER = 3
export var ACCELERATION = 4.5
export var DEACCELERATION = 16
export var GRAVITY = 10

var original_position
var wander_target
var velocity

func _ready():
    original_position = enemy.global_transform.origin

func enter():
    playerDetector.connect("body_entered", self, "_on_player_detected" )
    wander_target = original_position + Vector3(rand_range(-MAX_WANDER, MAX_WANDER), original_position.y, original_position.z)
    velocity = Vector3.ZERO

func exit():
    playerDetector.disconnect("body_entered", self, "_on_player_detected")

func update(delta):
    if abs(wander_target.x - enemy.global_transform.origin.x) < 0.1:
        emit_signal("finished", "idle")

    var direction = Vector3.LEFT if wander_target.x < enemy.global_transform.origin.x else Vector3.RIGHT

    var target_velocity = Vector3(direction.x * MAX_SPEED, -GRAVITY, 0)

    var accel
    if direction.dot(target_velocity):
        accel = ACCELERATION
    else:
        accel = DEACCELERATION

    velocity = velocity.linear_interpolate(target_velocity, accel * delta)

    velocity = enemy.move_and_slide(velocity, Vector3.UP)

func _on_player_detected(_player):
    emit_signal("finished", "attacking")
    
