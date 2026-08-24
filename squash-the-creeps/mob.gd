extends CharacterBody3D

# Minimum speed of the mob in meters in second.
@export var min_speed = 10
# Maximum speed of the mob in meters per second
@export var max_speed = 18

#Emitted when the player jumped on the mob.
signal squashed

func _physics_process(delta):
	move_and_slide()

func squash():
	squashed.emit()
	queue_free()
	
	
func initialize(start_position, player_position):
	# sets player_position y to 0 so mobs don't spawn looking upwards
	player_position.y = 0
	
	# WE position the mob by placing it at start_position
	# and rotate it towards player_position, so it looks at the player.
	look_at_from_position(start_position, player_position, Vector3.UP)
	# Rotate the mob randomly within a rnage of -45 and +45 degrees,
	# so that it doesn't move directly towards the player.
	rotate_y(randf_range(-PI / 4, PI / 4))
	
	# We calculate a random speed (integer)
	var random_speed = randi_range(min_speed, max_speed)
	# We calculate a forward velocity that represents the speed.
	velocity = Vector3.FORWARD * random_speed
	# We then rotate the velocity vector based on the mob's Y rotation
	# in order to move in the direction the mob is loking.
	velocity = velocity.rotated(Vector3.UP, rotation.y)
	
	$AnimationPlayer.speed_scale = random_speed / min_speed

func _on_visible_on_screen_enabler_3d_screen_exited():
	queue_free()
