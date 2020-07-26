extends KinematicBody

func _ready():
    move_lock_z = true
    $Stats.connect("on_no_health", self, "die")

func take_damage(value):
    $Stats.health -= value

func die():
    GameState.increase_total_kills()
    queue_free()