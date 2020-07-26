extends Spatial

func _on_SandboxButton_pressed():
    get_tree().change_scene("res://levels/Sandbox.tscn")

func _on_Level1Button_pressed():
    get_tree().change_scene("res://levels/Level1/Level1.tscn")
