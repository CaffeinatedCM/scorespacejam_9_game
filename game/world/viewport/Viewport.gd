extends KinematicBody

export var direction = Vector3.RIGHT
export var distance = 10
export var speed = 5
export var accel = .6
var velocity = Vector3.ZERO
onready var playerDetector = get_node("PlayerDetection")

var start_position
var end_position
var current_direction

func _ready():
	start_position = global_transform.origin
	end_position = global_transform.origin + direction * distance
	playerDetector.connect("body_entered", self, "_on_player_leave_viewport" )

func _on_player_leave_viewport():
	print('uh oh player gone')

func _physics_process(delta):
	var target_velocity = Vector3(direction.x * speed, direction.y * speed, 0)
	velocity = velocity.linear_interpolate(target_velocity, accel * delta)
	global_transform.origin = global_transform.origin + velocity * delta
