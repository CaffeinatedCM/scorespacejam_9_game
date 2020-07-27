extends BossBaseState

func enter():
    $PlayerDetector.connect("body_entered", self, "_on_player_enter")

func exit():
    $PlayerDetector.disconnect("body_entered", self, "_on_player_enter")

func _on_player_enter(_player):
    emit_signal("finished", "changePlatform")