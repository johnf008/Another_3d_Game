extends Node3D

signal player_collide

@onready var level: Node3D = get_node("/root/Game/Level")
@onready var character_body_3d: CharacterBody3D = %CharacterBody3D

var speed = 25

func _ready():
	var reciever = character_body_3d
	connect("player_collide", character_body_3d.end_game)

func _process(delta):
	position.x -= speed * delta
	if(position.x < -37):
		level.spawnModule(position.x + (level.amount * level.offset))
		queue_free()


	
func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group("Player"):
		player_collide.emit()
