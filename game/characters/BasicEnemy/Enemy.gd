extends KinematicBody

onready var stats = $Stats

func _ready():
    $Stats.connect("on_no_health", self, "queue_free")

func take_damage(value):
    $Stats.health -= value


