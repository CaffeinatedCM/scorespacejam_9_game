extends KinematicBody

var bullet = preload("res://objects/bullet/Bullet.tscn")

var aim_direction = Vector2.RIGHT

onready var stats = $Stats

func _ready():
    $Stats.connect("on_no_health", self, "queue_free")

func take_damage(value):
    print("Damage", value)
    $Stats.health -= value

func shoot():
    var b = bullet.instance()
    b.initialize(stats.DAMAGE, Vector3(aim_direction.x, aim_direction.y, 0).normalized())
    get_tree().root.add_child(b)
    b.global_transform.origin = global_transform.origin + Vector3(2, 0, 0)
    var aim_degrees = rad2deg(Vector2.RIGHT.angle_to(aim_direction))
    b.rotation_degrees.z = aim_degrees
