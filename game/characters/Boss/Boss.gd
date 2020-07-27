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
    GameState.increase_total_kills()
    GameState.totalScore = GameState.totalKills * GameState.coins
    GameState.wipe_scores()
    get_tree().change_scene("res://menus/SubmitScore.tscn")

func _on_Hurtbox_body_entered(player):
    player.take_damage(3)
