extends State
class_name FlyingBasicEnemyBaseState

onready var enemy = get_parent().get_parent()
onready var stats = enemy.get_node("Stats")
onready var playerDetector = enemy.get_node("PlayerDetector")
onready var hurtbox = enemy.get_node("Hurtbox")
onready var mesh = enemy.get_node("CybatMesh")
onready var animationTree = enemy.get_node("CybatMesh/AnimationTree")
onready var animationState = animationTree.get("parameters/playback")