extends StateMachine

func _ready():
    states_map = {
        "idle": $Idle,
        "wandering": $Wandering,
        "attacking": $Attacking,
        "recharging": $Recharging
    }

func _change_state(state_name):
    if not _active:
        return

    if state_name == "attacking":
        states_stack.push_front(states_map[state_name])
    ._change_state(state_name)
