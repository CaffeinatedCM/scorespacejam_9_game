extends FlyingBasicEnemyBaseState

export var MAX_ATTACK_SPEED = 20

var target
var velocity
var currently_attacking = false

func enter():
    animationState.travel("attack")
    target = playerDetector.get_overlapping_bodies()[0]
    playerDetector.connect("body_exited", self, "_on_player_left")
    hurtbox.connect("body_entered", self, "_on_player_hit")
    velocity = Vector3.ZERO
    currently_attacking = true
    hurtbox.set_deferred("monitoring", true)
    
func exit():
    playerDetector.disconnect("body_exited", self, "_on_player_left")
    hurtbox.disconnect("body_entered", self, "_on_player_hit")
    currently_attacking = false
    hurtbox.set_deferred("monitoring", false)

func update(delta):
    var direction = enemy.global_transform.origin.direction_to(target.global_transform.origin)

    # TODO : Rotate mesh to point to player vertically 
    if direction.x < 0:
        mesh.rotation_degrees.y = -90
        # var mesh_rot_z = Vector2.LEFT.angle_to(Vector2(direction.x, direction.y))
        # mesh.rotation_degrees.x = rad2deg(mesh_rot_z)
    elif direction.x > 0:
        mesh.rotation_degrees.y = 90
        # var mesh_rot_z = Vector2.RIGHT.angle_to(Vector2(direction.x, direction.y))
        # mesh.rotation_degrees.x = rad2deg(mesh_rot_z)

    velocity = velocity.linear_interpolate(direction * MAX_ATTACK_SPEED, delta)
    velocity = enemy.move_and_slide(velocity, Vector3.UP)

func _on_player_hit(player):
    player.take_damage(stats.DAMAGE)
    emit_signal("finished", "recharging")

func _on_player_left(_player):
    target = null
    emit_signal("finished", "idle")
