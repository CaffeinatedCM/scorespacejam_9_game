extends State
class_name BasicEnemyBaseState

onready var enemy = get_parent().get_parent()
onready var stats = enemy.get_node("Stats")
onready var playerDetector = enemy.get_node("PlayerDetection")
onready var gunPivot = enemy.get_node("GunPivot")