extends Node2D

@export var BALL_SCENE: Resource


var ball_locked: bool = true


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ball_locked:
		$Ball.position.x = $Player.position.x
		$Ball.position.y = $Player.position.y - 30
		
func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("throw_ball") and ball_locked:
		ball_locked = false
		$Ball.throw()


func _on_ball_death() -> void:
	ball_locked = true
