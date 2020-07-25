extends State
class_name PlayerBaseState

onready var player = get_parent().get_parent()
onready var animationTree = player.get_node("playerchar/AnimationTree")
onready var animationState = animationTree.get("parameters/playback")
onready var playerMesh = player.get_node("playerchar")
