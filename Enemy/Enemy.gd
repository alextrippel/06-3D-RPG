extends KinematicBody
var health = 100
var radius = 75
var angle = 0
export var height = 20
export var speed = 5

func _ready():
	randomize()
	angle = randf() * 2 * PI
	new_position(angle)
	
func new_position(a):
	var pos = Vector3(0,height,0)
	pos.x = radius * cos(a)
	pos.z = radius * sin(a)
	look_at(Vector3(0,height,0),Vector3.UP)
	$Tween.interpolate_property(self, 'global_transform:origin', global_transform.origin, pos,speed, Tween.TRANS_EXPO, Tween.EASE_IN_OUT)
	$Tween.start()

func _physics_process(_delta):
	if get_node('/root/Game/Target_Container').get_child_count() == 0:
		$Sprite3D.show()
	else:
		$Sprite3D.hide()

func _on_Tween_tween_all_completed():
	angle += PI/2 + (randf() * (PI/2))
	angle = wrapf(angle,0,2*PI)
	new_position(angle)


func _on_Area_body_entered(body):
	body.damage(10)

func die():
	if get_node('/root/Game/Target_Container').get_child_count() == 0:
		health -= 10
		if health <= 0:
			Global.update_score(100)
			var _scene = get_tree().change_scene('res://UI/Win.tscn')