extends State
class_name BossBaseState

onready var player = get_node("/root/BossLevel/Player")

onready var boss = get_parent().get_parent()
onready var stats = boss.get_node("Stats")
onready var mesh = boss.get_node("bossmesh")
onready var runAwayDetector = boss.get_node("RunAwayDetector")

func change_platform(player):
    emit_signal("finished", "changePlatform")