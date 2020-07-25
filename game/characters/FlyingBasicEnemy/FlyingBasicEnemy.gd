extends KinematicBody

func _on_Hurtbox_body_entered(player):
    player.take_damage($Stats.DAMAGE)