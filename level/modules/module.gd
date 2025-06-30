extends Node3D

signal player_collide

@onready var level: Node3D = get_node("/root/Game/Level")
@onready var player: Node = null
@onready var area_3d_coin: Area3D = %Area3D_Coin

var speed = 25

func _ready():
	player = get_tree().get_nodes_in_group("Player")[0]
	
	if player and player.has_method("end_game"):
		connect("player_collide", player.end_game)

func _process(delta):
	position.x -= speed * delta
	if(position.x < -37):
		level.spawnModule(position.x + (level.amount * level.offset))
		queue_free()


	
func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group("Player"):
		player_collide.emit()


func _on_area_3d_coin_body_entered(body: Node3D) -> void:
	if body.is_in_group("Player"):
		print("You touched me :/")
		Global.total_score += 1
		%Area3D_Coin.visible = false
		print("Score: " + str(Global.total_score))
