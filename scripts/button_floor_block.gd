extends Area2D

@export var signal_reciver: door
var active = false


func _on_body_entered(_body: Node2D) -> void:
	if not active:
		$AudioStreamPlayer2D.play()
		signal_reciver.open_signal()
		active = true
		$pressed.visible = true
		$unpressed.visible = false
		

func _on_body_exited(_body: Node2D) -> void:
	if active:
		signal_reciver.close_signal()
		active = false
		$pressed.visible = false
		$unpressed.visible = true
