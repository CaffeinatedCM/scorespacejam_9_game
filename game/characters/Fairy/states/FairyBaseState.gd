extends State
class_name FairyBaseState

onready var enemy = get_parent().get_parent()
onready var mesh = enemy.get_node("CSGMesh") # TODO: use real mesh
onready var playerDetection = enemy.get_node("PlayerDetection")
onready var stats = enemy.get_node("Stats")

func connect_to_playerdetection(target_signal = "body_entered", target_func = "switch_to_attack"):
    playerDetection.connect(target_signal, self, target_func)

func disconnect_from_playerdetection(target_signal = "body_entered", target_func = "switch_to_attack"):
    playerDetection.disconnect(target_signal, self, target_func)

func switch_to_attack(_body):
    emit_signal("finished", "attacking")