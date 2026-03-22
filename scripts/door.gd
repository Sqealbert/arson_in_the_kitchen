class_name door extends StaticBody2D

@export var signals_needed: int

func open_signal():
	signals_needed -= 1
	if not signals_needed:
		open()
	
func close_signal():
	signals_needed += 1
	
func open():
	process_mode = Node.PROCESS_MODE_DISABLED
	$CollisionShape2D/Sprite2D.visible = false
	
func close():
	process_mode = Node.PROCESS_MODE_ALWAYS
	$CollisionShape2D/Sprite2D.visible = true
