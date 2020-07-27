extends StateMachine

func _ready():
    states_map = {
        "idle": $Idle,
        "changePlatform": $ChangePlatform,
        "attack": $Attack
    }