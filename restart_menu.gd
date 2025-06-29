extends Control

func stop():
	get_tree().paused = true
func _on_button_pressed() -> void:
	get_tree().reload_current_scene()


func _on_character_body_3d_display_restart_menu() -> void:
	stop()
	
	
