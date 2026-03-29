class_name door extends StaticBody2D

@export var signals_needed: int

func open_signal():
	signals_needed -= 1
	if not signals_needed:
		open()
	
func close_signal():
	signals_needed += 1
	
func open():
	$anim.play('default')
	$AudioStreamPlayer2D.play()
	$CollisionShape2D.set_deferred("disabled", true)
	
func close():
	process_mode = Node.PROCESS_MODE_ALWAYS
