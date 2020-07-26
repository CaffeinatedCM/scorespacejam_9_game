extends FlyingBasicEnemyBaseState

export var MAX_ATTACK_SPEED = 20

var target
var velocity
var currently_attacking = false

func enter():
    target = playerDetector.get_overlapping_bodies()[0]
    playerDetector.connect("body_exited", self, "_on_player_left")
    hurtbox.connect("body_entered", self, "_on_player_hit")
    velocity = Vector3.ZERO
    currently_attacking = true
    hurtbox.monitoring = true
    
func exit():
    playerDetector.disconnect("body_exited", self, "_on_player_left")
    currently_attacking = false
    hurtbox.monitoring = false

func update(delta):
    var direction = enemy.global_transform.origin.direction_to(target.global_transform.origin)
    
    velocity = velocity.linear_interpolate(direction * MAX_ATTACK_SPEED, delta)
    velocity = enemy.move_and_slide(velocity, Vector3.UP)

func _on_player_hit(player):
    player.take_damage(stats.DAMAGE)
    emit_signal("finished", "recharging")

func _on_player_left():
    target = null
    emit_signal("finished", "idle")
