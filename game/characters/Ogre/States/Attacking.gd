extends BasicEnemyBaseState

var bullet = preload("res://objects/bullet/Bullet.tscn")

export var shoot_speed = 1

onready var pewPlayer = $PewPlayer

var target
var shot_delay = false

func enter():
    target = playerDetector.get_overlapping_bodies()[0]
    playerDetector.connect("body_exited", self, "_on_player_left")
    
func exit():
    playerDetector.disconnect("body_exited", self, "_on_player_left")

func update(_delta):
    var target_direction = enemy.global_transform.origin.direction_to(target.global_transform.origin)

    update_gun_rotation(target_direction)

    if not shot_delay:
        shoot(target_direction)
        shot_delay = true
        yield(get_tree().create_timer(shoot_speed), "timeout")
        shot_delay = false

func update_gun_rotation(target_direction):
    var aim_degrees = rad2deg(Vector2.RIGHT.angle_to(Vector2(target_direction.x, target_direction.y)))
    gunPivot.rotation_degrees.z = aim_degrees

func shoot(direction):
    var b = bullet.instance()
    b.initialize(stats.DAMAGE, Vector3(direction.x, direction.y, 0).normalized())
    get_tree().root.add_child(b)
    b.global_transform.origin = gunPivot.get_node("Gun").global_transform.origin
    var aim_degrees = rad2deg(Vector2.RIGHT.angle_to(Vector2(direction.x, direction.y)))
    b.rotation_degrees.z = aim_degrees
    pewPlayer.play()

func _on_player_left(_player):
    target = null
    emit_signal("finished", "idle")
