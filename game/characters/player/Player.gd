extends KinematicBody

onready var stats = $Stats

func _ready():
    stats.connect("on_no_health", self, "die")

func take_damage(damage):
    print("I got hurt")
    stats.health -= damage

func die():
    get_tree().quit()