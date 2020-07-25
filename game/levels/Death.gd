extends Area

func _on_Death_body_entered(_player):
    get_tree().reload_current_scene()