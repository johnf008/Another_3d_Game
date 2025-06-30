extends Node3D

signal player_collide

@onready var level: Node3D = get_node("/root/Game/Level")
@onready var player: Node = null
@onready var area_3d_coin: Area3D = %Area3D_Coin
@onready var label: Label = get_node("/root/Game/Label")


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
	pass


func _on_area_3d_coin_body_shape_entered(body_rid: RID, body: Node3D, body_shape_index: int, local_shape_index: int) -> void:
	if body.is_in_group("Player"):
		for child in area_3d_coin.get_children():
			if child is CollisionShape3D:
				var id = area_3d_coin.shape_find_owner(local_shape_index)
				var shape = area_3d_coin.shape_owner_get_owner(id)
				
				print("Shape node name: " + str(shape.name))
				
				var coin_type = shape.get_child(0)
				
				print("Coin TYpe " + str(coin_type))
				
				coin_type.visible = false
		print("You touched me :/")
		print("The body (if godot doesn't crash): " )
		Global.total_score += 1
		#%Area3D_Coin.visible = false
		print("Score: " + str(Global.total_score))
		label.text = "Score: " + str(Global.total_score)
