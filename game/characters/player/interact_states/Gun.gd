extends PlayerBaseState

onready var stats = player.get_node("Stats")

var bullet = preload("res://objects/bullet/Bullet.tscn")

var aim_direction = Vector2.RIGHT

func update(_delta):
    var aim_horiziontal = Input.get_action_strength("aim_right") - Input.get_action_strength("aim_left")
    var aim_vertical = Input.get_action_strength("aim_up") - Input.get_action_strength("aim_down")

    if aim_horiziontal != 0 or aim_vertical != 0:
        aim_direction = Vector2(aim_horiziontal, aim_vertical)
        var aim_degrees = rad2deg(Vector2.RIGHT.angle_to(aim_direction))
        player.get_node("GunPivot").rotation_degrees.z = aim_degrees

    if Input.is_action_just_pressed("shoot"):
        shoot()


func shoot():
    var b = bullet.instance()
    b.initialize(stats.DAMAGE, Vector3(aim_direction.x, aim_direction.y, 0).normalized())
    get_tree().root.add_child(b)
    b.global_transform.origin = player.get_node("GunPivot/Gun").global_transform.origin
    var aim_degrees = rad2deg(Vector2.RIGHT.angle_to(aim_direction))
    b.rotation_degrees.z = aim_degrees
