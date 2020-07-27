extends FairyBaseState

export var idle_time = 3
export var wander_chance = 0.9
onready var timer = get_node("IdleTimer")

func enter():
    animationState.travel("Idle")
    connect_to_playerdetection()
    reset_timer()

func exit():
    disconnect_from_playerdetection()

func update(_delta):
    if timer.time_left <= 0:
        var next_state = choose_next_state()
        if next_state == 'idle':
            reset_timer()
        else:
            emit_signal("finished", next_state)
            return

func choose_next_state():
    return "wandering" if randf() <= wander_chance else "idle"

func reset_timer():
    timer.start(idle_time)
