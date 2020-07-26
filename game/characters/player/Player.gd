extends KinematicBody

onready var stats = $Stats
onready var HUD = $CanvasLayer/HUD
onready var oofPlayer = $OofPlayer
onready var bigOofPlayer = $BigOofPlayer
onready var baDingPlayer = $BaDingPlayer
onready var ughPlayer = $UghPlayer

func _ready():
    stats.connect("on_no_health", self, "die")
    stats.connect("health_changed", self, "update_health_display")
    GameState.connect("total_kills_updated", self, "update_total_kills_text")
    update_health_display(stats.health)
    HUD.get_node("CoinValue").text = "%s" % [str(GameState.coins)]
    HUD.get_node("TotalKills").text = "%s" % [str(GameState.totalKills)]
    $playerchar/AnimationTree.active = true

func update_total_kills_text():
    ughPlayer.play()
    HUD.get_node("TotalKills").text = "%s" % [str(GameState.totalKills)]

func take_damage(damage):
    stats.health -= damage
    oofPlayer.play()

func collect_coin(value):
    GameState.coins += 1
    baDingPlayer.play()
    HUD.get_node("CoinValue").text = "%s" % [str(GameState.coins)]

func die():
    bigOofPlayer.play()
    yield(bigOofPlayer, "finished")
    get_tree().change_scene("res://menus/GameOver.tscn")

func update_health_display(value):
    HUD.get_node("Health").rect_size.x = value * 16
