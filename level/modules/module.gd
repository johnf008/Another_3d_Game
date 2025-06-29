extends Node3D
@onready var level: Node3D = get_node("/root/Game/Level")

var speed = 25

func _process(delta):
	position.x -= speed * delta
	if(position.x < -37):
		level.spawnModule(position.x + (level.amount * level.offset))
		queue_free()
