extends KinematicBody

export var direction = Vector3.RIGHT
export var distance = 10
export var speed = 5

var start_position
var end_position
var current_direction

func _ready():
    start_position = global_transform.origin
    end_position = global_transform.origin + direction * distance

func _physics_process(delta):

    if is_zero_approx(global_transform.origin.distance_to(end_position)):
        direction.x = - direction.x
        direction.y = - direction.y
        start_position = global_transform.origin
        end_position = global_transform.origin + direction * distance

    var velocity = direction * speed
    global_transform.origin = global_transform.origin + velocity * delta
