class_name locked_door extends StaticBody2D

@export var index:int = 0
var is_open = false


func silent_open():
	is_open = true
	$anim.frame = 10
	$CollisionShape2D.set_deferred("disabled", true)
	
func open():
	if not is_open and GameState.has_key:
		$anim.play('default')
		$AudioStreamPlayer2D.play()
		$AudioStreamPlayer2D2.play()
		$CollisionShape2D.set_deferred("disabled", true)
		get_parent().get_parent().save_open(index)
		is_open = true


func _on_area_2d_body_entered(_body: Node2D) -> void:
	open()
