extends FairyBaseState

export var shot_delay = 0.1
export var shots = 3

var bullet = preload("res://objects/bullet/Bullet.tscn")

var target
var shooting = false

func enter():
    shooting = false
    target = playerDetection.get_overlapping_bodies()[0]
    connect_to_playerdetection("body_exited", "_on_player_left")

func exit():
    disconnect_from_playerdetection("body_exited", "_on_player_left")

func update(_delta):
    if not shooting:
        shooting = true
        for i in range(shots):
            shoot(enemy.global_transform.origin.direction_to(target.global_transform.origin))
            yield(get_tree().create_timer(shot_delay), "timeout")
        emit_signal("finished", "recharging")

func shoot(direction):
    var b = bullet.instance()
    b.initialize(stats.DAMAGE, Vector3(direction.x, direction.y, 0).normalized())
    get_tree().root.add_child(b)
    var bulletSpawnPos = enemy.global_transform.origin + direction * 2
    b.global_transform.origin = bulletSpawnPos
    var aim_degrees = rad2deg(Vector2.RIGHT.angle_to(Vector2(direction.x, direction.y)))
    b.rotation_degrees.z = aim_degrees
    #pewPlayer.play()

func _on_player_left(_body):
    emit_signal("finished", "previous")
