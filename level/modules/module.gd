extends Node3D
@onready var level: Node3D = get_node("/root/Game/Level")

var speed = 25

func _process(delta):
	position.x -= speed * delta
	if(position.x < -37):
		level.spawnModule(position.x + (level.amount * level.offset))
		queue_free()


	
func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group("Player"):
		print("Player has collided & i didn't crash :3 ")
	print("Well something is inside of me")
