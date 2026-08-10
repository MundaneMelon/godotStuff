extends Label
var font_size = 32
func _process(delta):
	if Input.is_action_pressed("ui_up"):
		font_size += .01 * delta
		
		
		print(font_size)
	#Label.label_settings.font_size = font_siz
