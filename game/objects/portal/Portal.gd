extends Area

export (PackedScene) var next_level

func _on_Portal_body_entered(player):
    get_tree().change_scene_to(next_level)