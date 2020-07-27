extends Node

var coins = 0
var highestScore = 0
var totalKills = 0
var totalScore = 0
var playerName = ''
signal total_kills_updated()

func _ready():
	SilentWolf.configure({
		"api_key": "dm4pUZRlg11BHMSWWeVIlOiLATbYLc47gKeQ9Zmc",
		"game_id": "gamejam",
		"game_version": "1.0.0",
		"log_level": 1
	  })

	#   SilentWolf.configure_scores({
	# 	"open_scene_on_close": "res://scenes/MainPage.tscn"
	#   })

func increase_total_kills():
	totalKills += 1
	emit_signal("total_kills_updated")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
