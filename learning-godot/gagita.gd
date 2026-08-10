extends Sprite2D

var speed = 200
var angular_speed = PI
var rotation_speed = 100


signal super_fast(speed)
signal not_fast

func _process(delta):
	#var direction = 0
	#if Input.is_action_pressed("ui_left"):
		#direction = -1
	#if Input.is_action_pressed("ui_right"):
		#direction = 1
#
	#rotation += angular_speed * direction * delta
	#
	#var velocity = Vector2.ZERO
	#if Input.is_action_pressed("ui_up"):
		#velocity = Vector2.UP.rotated(rotation) * speed
	#
	#if Input.is_action_pressed("ui_down"):
		#velocity = Vector2.DOWN.rotated(rotation) * speed
#
	#position += velocity * delta
	
	rotation += angular_speed * delta
	var velocity = Vector2.UP.rotated(rotation) * speed
	position += velocity * delta
	
	if speed > 1000:
		super_fast.emit(speed)
	else:
		not_fast.emit()
	
func _input(event):
	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_PLUS:
			scale *= Vector2(1.5, 1.5)
			print(scale)
		if event.keycode == KEY_MINUS:
			scale *= Vector2(.5, .5)
			print(scale)


func _on_button_pressed(name):
	if name == "toggle_movement":
		set_process(not is_processing())
	if name == "scale_plus":
		scale *= Vector2(1.5, 1.5)
	if name == "scale_minus":
		scale *= Vector2(.5, .5)
	if name == "speed_plus":
		speed += 100
	if name == "speed_minus":
		speed -= 100
 
func _ready():
	#var timer = get_node("Timer")
	#timer.timeout.connect(_on_timer_timeout)
	pass
	
	
func _on_timer_timeout():
	visible = not visible


func _on_super_fast(extra_arg_0: int) -> void:
	pass # Replace with function body.
