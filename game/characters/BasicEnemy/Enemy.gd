extends KinematicBody

onready var stats = $Stats

func _ready():
    $Stats.connect("on_no_health", self, "i_died")
    $enemychar/AnimationTree.active = true

func i_died():
	GameState.increase_total_kills()
	queue_free()

func take_damage(value):
	$Stats.health -= value


