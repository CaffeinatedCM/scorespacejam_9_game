extends FlyingBasicEnemyBaseState

var target

func enter():
    target = playerDetector.get_overlapping_bodies()[0]
    playerDetector.connect("body_exited", self, "_on_player_left")
    
func exit():
    playerDetector.disconnect("body_exited", self, "_on_player_left")

func update(delta):
    # TODO: Attack the player
    pass