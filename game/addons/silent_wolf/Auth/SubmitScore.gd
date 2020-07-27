extends TextureRect


func _ready():
    $"FormContainer/CodeContainer/PlayerName".text = GameState.playerName
    $"FormContainer/CodeContainer/Score".text = str(GameState.totalScore)
    

    
func _on_score_posted():
    # redirect to configured scene (user is logged in after registration)
    # var scene_name = SilentWolf.auth_config.redirect_to_scene
    print('test')
    get_tree().change_scene("res://menus/GameOver.tscn")
    # get_tree().change_scene(scene_name)
    

func show_processing_label():
    $"FormContainer/ProcessingLabel".show()
    

func hide_processing_label():
    $"FormContainer/ProcessingLabel".hide()

func _on_Cancel_pressed():
    get_tree().change_scene("res://menus/GameOver.tscn")

func _on_ConfirmButton_pressed():
    var username = SilentWolf.Auth.tmp_username
    var player_name = $"FormContainer/CodeContainer/PlayerName".text
    GameState.playerName = player_name
    show_processing_label()
    yield(SilentWolf.Scores.persist_score(player_name, GameState.totalScore), "sw_score_posted")
    get_tree().change_scene("res://menus/GameOver.tscn")

    
