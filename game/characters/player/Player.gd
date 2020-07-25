extends KinematicBody

onready var stats = $Stats
onready var HUD = $CanvasLayer/HUD
onready var oofPlayer = $OofPlayer
onready var bigOofPlayer = $BigOofPlayer


var coins = 0

func _ready():
    stats.connect("on_no_health", self, "die")
    stats.connect("health_changed", self, "update_health_display")
    update_health_display(stats.health)
    collect_coin(0)
    $playerchar/AnimationTree.active = true

func take_damage(damage):
    stats.health -= damage
    oofPlayer.play()

func collect_coin(value):
    coins += value
    HUD.get_node("CoinValue").text = "%s" % [str(coins)]

func die():
    bigOofPlayer.play()
    yield(bigOofPlayer, "finished")
    get_tree().reload_current_scene()

func update_health_display(value):
    HUD.get_node("Health").rect_size.x = value * 16
