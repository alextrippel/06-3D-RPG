extends Node

var timer = 1
var score = 0
var game_paused = false
var gamestarted = false

func _ready():
	pause_mode = Node.PAUSE_MODE_PROCESS
	update_score(0)

func _input(_event):
	if Input.is_action_just_pressed('menu'):
		var Menu = get_node_or_null('/root/Game/UI/Menu')
		if Menu != null :
			var p = get_tree().paused
			if p :
				game_paused = false
				Menu.hide()
				Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
				get_tree().paused = false
			else :
				game_paused = true
				Menu.show()
				Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
				get_tree().paused = true

func update_score(s):
	score += s
	get_node('/root/Game/UI/Score').text = "Score: " + str(score)

func update_time():
	if not game_paused :
		var t_m = floor(timer / 60.0)
		var t_s = timer % 60
		var t = "Time: %02d" % t_m
		t += ":%02d" % t_s
		get_node('/root/Game/UI/Time').text = t

func reset():
	gamestarted = false
	timer = 1
	score = 0
