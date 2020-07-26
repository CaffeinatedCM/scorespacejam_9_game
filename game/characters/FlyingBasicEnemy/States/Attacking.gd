extends FlyingBasicEnemyBaseState

export var MAX_ATTACK_SPEED = 20

var target
var velocity

func enter():
    target = playerDetector.get_overlapping_bodies()[0]
    playerDetector.connect("body_exited", self, "_on_player_left")
    velocity = Vector3.ZERO
    
func exit():
    playerDetector.disconnect("body_exited", self, "_on_player_left")

func update(delta):
    var direction = enemy.global_transform.origin.direction_to(target.global_transform.origin)
    
    velocity = velocity.linear_interpolate(direction * MAX_ATTACK_SPEED, delta)
    velocity = enemy.move_and_slide(velocity, Vector3.UP)
