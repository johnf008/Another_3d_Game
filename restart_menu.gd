extends Control
@onready var level: Node3D = %Level


func stop():
	get_tree().paused = true

func stop_incoming_pipes():
	%Level.process_mode = Node.PROCESS_MODE_DISABLED
	

func _on_button_pressed() -> void:
	Global.total_score = 0
	get_tree().reload_current_scene()

func _on_character_body_3d_display_restart_menu() -> void:
	self.show()	
	call_deferred("stop_incoming_pipes")
	
	
	

	
	
