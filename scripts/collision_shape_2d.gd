extends CollisionShape2D

func _on_void_zone_body_entered(body: Node2D) -> void:
	print(body.name)
	body.fall()


func _on_void_zone_area_entered(area: Area2D) -> void:
	print(area.name)
	area.get_parent().fall()
