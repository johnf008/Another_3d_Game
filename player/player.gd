extends CharacterBody3D

@export var _rotation_speed: float = TAU *2

var target_angle
var flying_flag = false

var og_z_pos = -0.29374700784683
var speed = 8

const UPWARD_ANGLE = 60.0
const DOWNWARD_ANGLE = 120.0


func _physics_process(delta: float) -> void:
	const FLY_FALL_FACTOR = 5
	 
	if (position.y >= 10.0):
		velocity.y -= 20.0 * delta
	else:
		velocity.y = 0
		position.y = 10.0
	#print("Y position: " + str(position.y))
	
	if (position.y <= 55.0):
		velocity.y -= 20.0 * delta
	else:
		velocity.y = 0
		position.y = 55.0
	
	if Input.is_action_pressed("fly"):
		velocity.y = 20.0
		flying_flag = true
		rotation_degrees.x = (lerp(rotation_degrees.x, 60.0, delta * _rotation_speed))
	else:
		flying_flag = false
		rotation_degrees.x = (lerp(rotation_degrees.x, 0.0, delta * _rotation_speed))
		
	if Input.is_action_pressed("left"):
		position.z = lerp(position.z, position.z - 5, speed * delta)
		#print("Hello from left")
	
	if Input.is_action_pressed("right"):
		position.z = lerp(position.z, position.z + 5, speed * delta)
	
	#print("X pos: " + str(position.x))
	
		
	#print(str(rotation_degrees.z))
	#print(str(flying_flag))
	
	move_and_slide()
