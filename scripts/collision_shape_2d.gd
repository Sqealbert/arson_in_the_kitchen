extends CollisionShape2D

func _on_void_zone_body_entered(body: Node2D) -> void:
	body.fall()
