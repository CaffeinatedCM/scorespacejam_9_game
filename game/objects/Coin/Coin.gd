extends Area

export var VALUE = 1


func _on_player_entered(player):
    player.collect_coin(VALUE)
    queue_free()
