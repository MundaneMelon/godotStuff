extends Node2D
@export var move_speed: float
@export var move_multiplier: float

var screen_size: Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("move_left"):
		velocity.x -= move_speed 
	if Input.is_action_pressed("move_right"):
		velocity.x += move_speed
		
	var rect_shape = $CollisionShape2D.shape as RectangleShape2D
	var extents = rect_shape.size / 2.0 if rect_shape else Vector2.ZERO
	
	position += velocity * delta
	global_position.x = clamp(global_position.x, extents.x, screen_size.x - extents.x)



func _on_ball_body_entered(body: Node2D) -> void:
	print("pleeease")
