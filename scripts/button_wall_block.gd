extends Area2D

@export var signal_reciver: door
var active = false






func _on_area_entered(_area: Area2D) -> void:
	if not active:
		signal_reciver.open_signal()
		active = true
		

func _on_area_exited(_area: Area2D) -> void:
	if active:
		signal_reciver.close_signal()
		active = false
