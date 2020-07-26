extends KinematicBody

onready var stats = $Stats

func _ready():
    stats.connect("on_no_health", self, "queue_free")

func take_damage(value):
    stats.health -= value

func _on_Hurtbox_body_entered(player):
    player.take_damage($Stats.DAMAGE)