extends KinematicBody

onready var LeftPlatformPosition = get_node("/root/BossLevel/LeftPlatform/Position3D").global_transform.origin
onready var RightPlatformPosition = get_node("/root/BossLevel/RightPlatform/Position3D").global_transform.origin

var secondStage = false

func _ready():
    #global_transform.origin = LeftPlatformPosition + Vector3(0,1,0)
    $Stats.connect("on_no_health", self, "die")
    secondStage = false

func take_damage(value):
    $Stats.health -= value

func die():
    # if not secondStage:
    #     $bossmesh/AnimationPlayer.play("TransitionToPhaseTwo")
    #     secondStage = true
    #     $Stats.health = 30
    #     $Stats.MAX_HEALTH = 30
    #     $CollisionShape.scale = Vector3(3, 3, 3)
    #     $CollisionShape.translation += Vector3(0, 3, 0)
    #     $Hurtbox.scale = Vector3(3, 3, 3)
    #     $Hurtbox.translation += Vector3(0, 3, 0)
    #     return
    # TODO: Spawn portal
    queue_free()

func _on_Hurtbox_body_entered(player):
    player.take_damage(3)
