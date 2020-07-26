extends StateMachine

func _ready():
    states_map = {
        "idle": $Idle,
        "attacking": $Attacking,
        "wandering": $Wandering
    }