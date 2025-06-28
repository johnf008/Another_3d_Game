extends Node3D

@export var modules: Array[PackedScene] = []
var amount = 10
var random = RandomNumberGenerator.new()
var offset = 20

func _ready():
	for pos in offset:
		spawnModule(pos * offset)
		
func spawnModule(pos):
	random.randomize()
	var num = random.randi_range(0, modules.size() - 1)
	var instance = modules[num].instantiate()
	instance.position.x = pos
	add_child(instance)
