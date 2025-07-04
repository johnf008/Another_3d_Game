extends Node3D

@export var modules: Array[PackedScene] = []

var amount = 10
var random = RandomNumberGenerator.new()
var offset = 50
var count = 0

func _ready():
	for pos in amount:
		spawnModule(pos * offset)
		
func spawnModule(pos):
	random.randomize()
	var num = random.randi_range(0, modules.size() - 1)
	var instance = modules[num].instantiate()
	instance.position.x = pos
	add_child(instance)
	count += 1
	print(str(count))
	
