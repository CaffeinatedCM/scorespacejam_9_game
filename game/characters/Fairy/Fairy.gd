extends KinematicBody

func _ready():
    move_lock_z = true

func take_damage(value):
    queue_free()