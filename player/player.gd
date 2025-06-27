extends CharacterBody3D

func _physics_process(delta: float) -> void:
	const FLY_FALL_FACTOR = 5
	 
	velocity.y -= 20.0 * delta
	if Input.is_action_just_pressed("fly"):
		velocity.y = 10.0
		
	
	move_and_slide()
