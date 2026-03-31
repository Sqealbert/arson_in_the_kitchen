extends Area2D



func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player" and $collision_delay.is_stopped():
		body.visible = false
		body.process_mode = Node.PROCESS_MODE_DISABLED
		$AudioStreamPlayer2D.play()
		$AnimatedSprite2D.play()
		

func _on_animated_sprite_2d_animation_finished() -> void:
	get_tree().change_scene_to_file("res://scenes/UI/title_screen.tscn")
