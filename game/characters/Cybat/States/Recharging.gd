extends FlyingBasicEnemyBaseState

export var RECHARGE_TIME = 2

onready var timer = $RechargeTimer

func enter():
    animationState.travel("charge-up")
    timer.start(RECHARGE_TIME)
    playerDetector.connect("body_exited", self, "_on_player_left")

func exit():
    playerDetector.disconnect("body_exited", self, "_on_player_left")

func update(_delta):
    if timer.time_left <= 0:
        emit_signal("finished", "attacking")

func _on_player_left(_player):
    emit_signal("finished", "idle")