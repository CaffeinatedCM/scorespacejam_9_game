extends Node

var coins = 0
var highestScore = 0
var totalKills = 0
signal total_kills_updated()

func increase_total_kills():
	totalKills += 1
	emit_signal("total_kills_updated")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
