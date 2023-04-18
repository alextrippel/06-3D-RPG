extends Control

func _ready():
	$Label.text = "You won! Your score was " + str(Global.score)
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


func _on_Replay_pressed():
	var _scene = get_tree().change_scene('res://Game.tscn')
	Global.reset()

func _on_Quit_pressed():
	get_tree().quit()
