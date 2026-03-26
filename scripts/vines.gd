extends StaticBody2D


var on_fire = false

func _ready() -> void:
	$flame_timer.wait_time = randf_range(1.5, 3) # for randomness
	$flame_tic_timer.wait_time = randf_range(0.5, 1.0)
func burn_down():
	for body:StaticBody2D in $Area2D.get_overlapping_bodies():
		if body.is_in_group("flamable") and not  body.on_fire:
			spread_fire(body)
	
func catch_fire():
	$flame_timer.start()
	on_fire = true
	$flame_tic_timer.start()
	$fire.visible = true
	
func spread_fire(body:StaticBody2D):
	body.catch_fire()


func _on_flame_timer_timeout() -> void:
	burn_down() # Replace with function body.
	queue_free()


func _on_flame_tic_timer_timeout() -> void:
	if on_fire:
		$flame_tic_timer.start()
		var body = $Area2D.get_overlapping_bodies().pick_random()
		if body.is_in_group("flamable") and not  body.on_fire:
			spread_fire(body)
