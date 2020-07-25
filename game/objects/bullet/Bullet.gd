extends KinematicBody

export var SPEED = 20

var damage
var direction

func initialize(dmg, dir):
    damage = dmg
    direction = dir

func _physics_process(delta):
    var velocity = direction * SPEED

    var collision = move_and_collide(velocity * delta)

    if collision:
        var collider = collision.collider
        if collider.has_method("take_damage"):
            print("Hi?")
            collider.take_damage(damage)
        
        queue_free()
