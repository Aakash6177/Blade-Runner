extends Control


func _process(delta):
	$"Label".text = "Game Over\nscore: " + str(Global.score) + "\nhit space bar to play again"
	
	if Input.is_action_pressed("start_game"):
		get_tree().change_scene("res://Level/Level.tscn")
		Global.score = 0


