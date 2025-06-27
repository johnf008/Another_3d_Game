extends CharacterBody3D

@export var _rotation_speed: float = TAU *2

var target_angle
var flying_flag = false

const UPWARD_ANGLE = 60.0
const DOWNWARD_ANGLE = 120.0

func _physics_process(delta: float) -> void:
	const FLY_FALL_FACTOR = 5
	 
	velocity.y -= 20.0 * delta
	
	if Input.is_action_pressed("fly"):
		velocity.y = 10.0
		flying_flag = true
		rotation_degrees.z = -90 #abs(lerp(rotation_degrees.z, 60.0, delta * _rotation_speed))
	else:
		flying_flag = false
		#rotation_degrees.z = abs(lerp(rotation_degrees.z, 120.0, delta * _rotation_speed))
	
	
	
	
	#if abs(rotation_degrees.z - target_angle) < 0.5:
		#rotation_degrees.z = target_angle
		
	print(str(rotation_degrees.z))
	print(str(flying_flag))
	
	move_and_slide()
