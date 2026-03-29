extends RigidBody2D

var original_loc:Vector2
var should_reset = false

func _ready() -> void:
	original_loc = global_position

func _process(_delta: float) -> void:
	if $fall_timer.time_left:
		rotate(0.1)
		scale = Vector2(1, 1) * lerp(0, 1, $fall_timer.time_left/$fall_timer.wait_time)
	
			
func fall():
	if not $imovable_timer.time_left:
		$fall_timer.start()
		$CollisionShape2D.set_deferred("disabled", true)


func _on_fall_timer_timeout() -> void:
	$fall_timer.stop()
	$imovable_timer.start()

	rotation = 0
	scale = Vector2(1, 1)
	
	global_position = original_loc
	should_reset = true
	
	$CollisionShape2D.set_deferred("disabled", false)


func _integrate_forces(state):
	if should_reset:
		state.transform.origin = original_loc
		state.linear_velocity = Vector2.ZERO


func _on_imovable_timer_timeout() -> void:
	should_reset = false
