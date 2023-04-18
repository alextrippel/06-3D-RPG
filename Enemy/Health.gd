extends ProgressBar


func _physics_process(_delta):
	value = get_node('/root/Game/Enemy_Container/Enemy').health
