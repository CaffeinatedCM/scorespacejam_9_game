extends State
class_name BasicEnemyBaseState

onready var enemy = get_parent().get_parent()
onready var enemyMesh = enemy.get_node("enemychar")
onready var animationTree = enemy.get_node("enemychar/AnimationTree")
onready var animationState = animationTree.get("parameters/playback")
onready var stats = enemy.get_node("Stats")
onready var playerDetector = enemy.get_node("PlayerDetection")
onready var gunPivot = enemy.get_node("GunPivot")