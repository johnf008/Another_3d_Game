extends Node3D
@onready var level: Node3D = get_node("/root/Game/Level")

var speed = 10

func _process(delta):
	position.x -= speed * delta
	if(position.x < -28):
		level.spawnModule(position.x + (level.amount * level.offset))
		queue_free()
