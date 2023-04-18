extends StaticBody
var score = 20

func die():
	Global.update_score(score)
	queue_free()
