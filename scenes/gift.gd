extends StaticBody2D

@export var gift_sprite:Texture
@export var tuto_sprite:Texture
@export var gift_var:int
var open = false

func _ready() -> void:
	$item.texture = gift_sprite
	$tutorial.texture = tuto_sprite
	$tutorial.modulate.a = 0
	if gift_var == 1 and GameState.has_lighter or gift_var == 2 and GameState.has_fan or gift_var == 3 and GameState.has_scate or gift_var == 4 and GameState.has_stapler or gift_var == 5 and GameState.has_key:
		$top.visible = false
		open = true
		
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_class("CharacterBody2D") and not open:
		if gift_var == 1:
			GameState.has_lighter = true
		if gift_var == 2:
			GameState.has_fan = true
		if gift_var == 3:
			GameState.has_scate = true
		if gift_var == 4:
			GameState.has_stapler = true
		if gift_var == 5:
			GameState.has_key = true
		$open_timer.start()
		$AudioStreamPlayer2D.play()
		$AudioStreamPlayer2D2.play()
		open = true
	
func _on_open_timer_timeout() -> void:
	$float_timer.start()

func _physics_process(delta: float) -> void:
	if $open_timer.time_left:
		$top.position.y -= 300 * delta
		$top.modulate.a = lerpf(0, 1, $open_timer.time_left/$open_timer.wait_time)
		$tutorial.modulate.a = lerpf(1, 0, $open_timer.time_left/$open_timer.wait_time)
	if $float_timer.time_left:
		$item.position.y -= 250 * delta


func _on_audio_stream_player_2d_2_finished() -> void:
	$item.visible = false
	$tutorial.visible = false
