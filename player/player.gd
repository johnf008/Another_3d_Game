extends CharacterBody3D

@export var _rotation_speed: float = TAU *2

var target_angle
var flying_flag = false

var end_game_trigger = false

var og_z_pos = -0.29374700784683
var speed = 8

const UPWARD_ANGLE = 60.0
const DOWNWARD_ANGLE = 120.0

func _ready() -> void:
	var modules = get_node("")
func _physics_process(delta: float) -> void:	 
	if (position.y >= 10.0):
		velocity.y -= 20.0 * delta
	else:
		velocity.y = 0
		if(!end_game_trigger):
			position.y = 10.0
	#print("Y position: " + str(position.y))
	
	if (position.y <= 55.0):
		velocity.y -= 20.0 * delta
	else:
		velocity.y = 0
		if(!end_game_trigger):
			position.y = 55.0
	
	if Input.is_action_pressed("fly") && !end_game_trigger:
		velocity.y = 20.0
		flying_flag = true
		rotation_degrees.x = (lerp(rotation_degrees.x, 60.0, delta * _rotation_speed))
	else:
		flying_flag = false
		rotation_degrees.x = (lerp(rotation_degrees.x, 0.0, delta * _rotation_speed))
		
	if Input.is_action_pressed("left") && !end_game_trigger:
		position.z = lerp(position.z, position.z - 5, speed * delta)
		#print("Hello from left")
	
	if Input.is_action_pressed("right") && !end_game_trigger:
		position.z = lerp(position.z, position.z + 5, speed * delta)
	
	if end_game_trigger:
		if(position.y >= 7.0):
			velocity.y -= 1
		set_collision_mask_value(1, false)
		set_collision_mask_value(2, true)
	#print("X pos: " + str(position.x))
	
		
	#print(str(rotation_degrees.z))
	#print(str(flying_flag))
	
	move_and_slide()

func end_game():
	velocity.y = 0
	end_game_trigger = true
