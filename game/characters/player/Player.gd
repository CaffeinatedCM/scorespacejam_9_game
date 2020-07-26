extends KinematicBody

onready var stats = $Stats
onready var HUD = $CanvasLayer/HUD
onready var oofPlayer = $OofPlayer
onready var bigOofPlayer = $BigOofPlayer
onready var baDingPlayer = $BaDingPlayer

var coins = 0

func _ready():
    stats.connect("on_no_health", self, "die")
    stats.connect("health_changed", self, "update_health_display")
    GameState.connect("total_kills_updated", self, "update_total_kills_text")
    update_health_display(stats.health)
    HUD.get_node("CoinValue").text = "%s" % [str(coins)]
    HUD.get_node("TotalKills").text = "%s" % [str(GameState.totalKills)]
    $playerchar/AnimationTree.active = true

func update_total_kills_text():
    HUD.get_node("TotalKills").text = "%s" % [str(GameState.totalKills)]

func take_damage(damage):
    print("I got hurt")
    stats.health -= damage
    oofPlayer.play()

func collect_coin(value):
    coins += value
    baDingPlayer.play()
    HUD.get_node("CoinValue").text = "%s" % [str(coins)]

func die():
    bigOofPlayer.play()
    yield(bigOofPlayer, "finished")
    get_tree().reload_current_scene()

func update_health_display(value):
    HUD.get_node("Health").rect_size.x = value * 16
