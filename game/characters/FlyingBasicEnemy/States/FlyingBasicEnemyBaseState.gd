extends State
class_name FlyingBasicEnemyBaseState

onready var enemy = get_parent().get_parent()
onready var playerDetector = enemy.get_node("PlayerDetector")