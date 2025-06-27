extends CharacterBody3D

@export var _rotation_speed: float = TAU * 2

var target_angle
var flying_flag = false

const UPWARD_ANGLE = 57.0
const DOWNWARD_ANGLE = 118.0

func _physics_process(delta: float) -> void:
	const FLY_FALL_FACTOR = 5
	 
	velocity.y -= 20.0 * delta
	
	if Input.is_action_just_pressed("fly"):
		velocity.y = 10.0
		flying_flag = true
	else:
		flying_flag = false
	
	var target_angle = UPWARD_ANGLE if flying_flag else DOWNWARD_ANGLE
	
	rotation_degrees.z = lerp(rotation_degrees.z, target_angle, delta * 1)
	
	if abs(rotation_degrees.z - target_angle) < 0.5:
		rotation_degrees.z = target_angle
		
	print(str(rotation_degrees.z))
	print(str(flying_flag))
	
	
		
		
		
	
	move_and_slide()
