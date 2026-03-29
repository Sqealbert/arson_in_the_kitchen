class_name door extends StaticBody2D

@export var signals_needed: int
@export var index:int = 0
var is_open = false


func open_signal():
	signals_needed -= 1
	if not signals_needed:
		open()
	
func close_signal():
	signals_needed += 1

func silent_open():
	is_open = true
	$anim.frame = 10
	$CollisionShape2D.set_deferred("disabled", true)
	
func open():
	if not is_open:
		$anim.play('default')
		$AudioStreamPlayer2D.play()
		$CollisionShape2D.set_deferred("disabled", true)
		get_parent().get_parent().save_open(index)
		
func close():
	process_mode = Node.PROCESS_MODE_ALWAYS
