extends BossBaseState

export var shot_delay = 0.1
export var recharge = 2
export var shots = 3
export var changePlatformChance = 0.6

var bullet = preload("res://objects/bullet/Bullet.tscn")
var shooting = false

func enter():
    shooting = false
    runAwayDetector.connect("body_entered", self, "change_platform")

func exit():
    runAwayDetector.disconnect("body_entered", self, "change_platform")

func update(_delta):
    if not shooting:
        shooting = true
        var direction = boss.global_transform.origin.direction_to(player.global_transform.origin)
        mesh.rotation_degrees.y = -90 if direction.x < 0 else 90
        for i in range(shots):
            shoot(boss.global_transform.origin.direction_to(player.global_transform.origin))
            yield(get_tree().create_timer(shot_delay), "timeout")
        yield(get_tree().create_timer(recharge), "timeout")
        shooting = false
        if randf() >= changePlatformChance:
            emit_signal("finished", "changePlatform")

func shoot(direction):
    var b = bullet.instance()
    b.initialize(stats.DAMAGE, Vector3(direction.x, direction.y, 0).normalized())
    get_tree().root.add_child(b)
    var bulletSpawnPos = boss.global_transform.origin + direction * 2
    b.global_transform.origin = bulletSpawnPos
    var aim_degrees = rad2deg(Vector2.RIGHT.angle_to(Vector2(direction.x, direction.y)))
    b.rotation_degrees.z = aim_degrees
