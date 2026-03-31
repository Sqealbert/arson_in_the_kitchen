extends Area2D

@export var next_level:String
@export var spawn_id: int
@export var send_id: int = 0
var player_ref:PackedScene = preload("res://scenes/player.tscn")

func _enter_tree() -> void:
	if GameState.spawn_id == spawn_id:
		var spawn = player_ref.instantiate()
		get_parent().add_child.call_deferred(spawn)
		spawn.global_position = global_position


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player" and $collision_delay.is_stopped():
		body.visible = false
		body.process_mode = Node.PROCESS_MODE_DISABLED
		# plat door anim
		$AudioStreamPlayer2D.play()
		$AnimatedSprite2D.play()
		

func _on_audio_stream_player_2d_finished() -> void:
	GameState.spawn_id = send_id
	get_tree().change_scene_to_file(next_level)
