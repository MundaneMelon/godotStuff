extends Area2D

@export var speed: float

signal death

var velocity: Vector2 = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += velocity * delta

func throw():
	velocity = Vector2(speed, -1 * speed)

func _on_walls_area_entered(area: Area2D) -> void:
	velocity.x *= -1
	print("hello")

func _on_ceiling_area_entered(area: Area2D) -> void:
	velocity.y *= -1
	print("hello")

func _on_floor_area_entered(area: Area2D) -> void:
	velocity = Vector2.ZERO
	death.emit()

func _on_player_area_entered(area: Area2D) -> void:
	velocity.y *= -1
	print("hello")
