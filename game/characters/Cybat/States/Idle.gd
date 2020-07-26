extends FlyingBasicEnemyBaseState

export var idleTime = 3
export var wanderChance = 0.6

onready var idleTimer = enemy.get_node("IdleTimer")

func enter():
    animationState.travel("Normal")
    playerDetector.connect("body_entered", self, "_on_player_detected" )
    reset_timer()

func exit():
    playerDetector.disconnect("body_entered", self, "_on_player_detected")

func update(_delta):
    if idleTimer.time_left <= 0:
        var nextState = "idle" if randf() <= wanderChance else "wandering"
        emit_signal("finished", nextState)

func reset_timer():
    idleTimer.start(rand_range(1, idleTime))

func _on_player_detected(_player):
    emit_signal("finished", "attacking")
    
