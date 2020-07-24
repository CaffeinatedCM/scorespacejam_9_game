extends StateMachine

func _ready():
    states_map = {
        "idle": $Idle,
        "moving": $Moving,
        "jump": $Jump
    }