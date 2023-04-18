extends KinematicBody

onready var Dialogue = get_node('/root/Game/UI/Dialogue')
var visited = false

var dialogue = [
	'Welcome to the game! (Press E to continue)',
	'You need to be quick, your life depends on it',
	"Shoot all 6 targets then destroy the drone before it's too late",
	"Your time starts... now!"
]
func _ready():
	$AnimationPlayer.play('Idle')
	Dialogue.connect("finished_dialogue",self, "finished")


func finished():
	get_node("/root/Game/Target_Container").show()
	visited = true
	Global.timer = 90
	Global.update_time()
	get_node('/root/Game/UI/Timer').start()

func _on_Area_body_entered(_body):
	if not visited:
		Dialogue.start_dialogue(dialogue)
		

func _on_Area_body_exited(_body):
	if visited:
		Dialogue.hide_dialogue()
