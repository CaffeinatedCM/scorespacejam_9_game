extends BasicEnemyBaseState

func enter():
    playerDetector.connect("body_entered", self, "_on_player_detected" )

func exit():
    playerDetector.disconnect("body_entered", self, "_on_player_detected")

func _on_player_detected(_player):
    emit_signal("finished", "attacking")
    