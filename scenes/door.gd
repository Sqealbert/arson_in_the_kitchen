class_name door extends StaticBody2D

@export var signals_needed: int

func open_signal():
	signals_needed -= 1
	if not signals_needed:
		open()
	
func close_signal():
	signals_needed += 1
	close()
	
func open():
	$CollisionShape2D.disabled = true
	$CollisionShape2D/Sprite2D.visible = false
	
func close():
	$CollisionShape2D.disabled = false
	$CollisionShape2D/Sprite2D.visible = true
