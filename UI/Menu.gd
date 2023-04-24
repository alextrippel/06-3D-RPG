extends Control


func _ready():
	pass


func _on_Continue_pressed():
	Global.game_paused = false
	hide()
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	get_tree().paused = false


func _on_Quit_pressed():
	get_tree().quit()
