extends KinematicBody

onready var LeftPlatformPosition = get_node("/root/BossLevel/LeftPlatform/Position3D").global_transform.origin
onready var RightPlatformPosition = get_node("/root/BossLevel/RightPlatform/Position3D").global_transform.origin

func _ready():
    print("Left Position", LeftPlatformPosition)
    print("Right Position", RightPlatformPosition)
    #global_transform.origin = LeftPlatformPosition + Vector3(0,1,0)
    $Stats.connect("on_no_health", self, "die")

func take_damage(value):
    $Stats.health -= value

func die():
    # TODO: Spawn portal
    queue_free()

func _on_Hurtbox_body_entered(player):
    player.take_damage(3)
