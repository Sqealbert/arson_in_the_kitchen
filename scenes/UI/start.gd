extends TextureButton


func _on_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/lvl_start_end.tscn")
