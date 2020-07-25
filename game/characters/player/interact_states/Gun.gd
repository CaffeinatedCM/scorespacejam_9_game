extends PlayerBaseState

onready var gunRayCast = player.get_node("GunPivot/RayCast")
onready var stats = player.get_node("Stats")

func update(_delta):
    var aim_horiziontal = Input.get_action_strength("aim_right") - Input.get_action_strength("aim_left")
    var aim_vertical = Input.get_action_strength("aim_up") - Input.get_action_strength("aim_down")

    var aim_direction = Vector2(aim_horiziontal, aim_vertical)

    var aim_degrees = rad2deg(Vector2.RIGHT.angle_to(aim_direction))
    if aim_horiziontal != 0 or aim_vertical != 0:
        player.get_node("GunPivot").rotation_degrees.z = aim_degrees

    if Input.is_action_just_pressed("shoot"):
        shoot()


func shoot():
    if gunRayCast.is_colliding():
        gunRayCast.get_collider().take_damage(stats.DAMAGE)