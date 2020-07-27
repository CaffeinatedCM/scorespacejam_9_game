extends FairyBaseState

export var RECHARGE_TIME = 3

func enter():
    animationState.travel("Idle")
    reset_timer()
    connect_to_playerdetection("body_exited", "_on_player_left")

func exit():
    disconnect_from_playerdetection("body_exited", "_on_player_left")

func update(delta):
    if $RechargeTimer.time_left <= 0:
        emit_signal("finished", "attacking")

func reset_timer():
    $RechargeTimer.start(RECHARGE_TIME)


func _on_player_left(_body):
    emit_signal("finished", "idle")
    