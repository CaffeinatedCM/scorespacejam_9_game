extends KinematicBody

onready var stats = $Stats

func _ready():
    $Stats.connect("on_no_health", self, "die")
    $enemychar/AnimationTree.active = true

func die():
	GameState.increase_total_kills()
	queue_free()

func take_damage(value):
	$Stats.health -= value


