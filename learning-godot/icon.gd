extends Sprite2D


func _process(delta):
	if Input.is_action_pressed("ui_up"):
		scale *= 2
