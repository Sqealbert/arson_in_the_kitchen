class_name player extends CharacterBody2D

@export var speed: int = 200
@export var push_force: float = 40000.0
var dash_speed: int = 4000
var dash_dir: Vector2
var direction: Vector2
var lasting_dir: Vector2 = Vector2(1, 0) ## base state
var next_stapler_index = 0
var dashing = false
var transition_enter_index: int
var takes_input = true
var walk = false

func get_input():
	direction = Input.get_vector("walk_left","walk_right","walk_up","walk_down")
	if direction:
		lasting_dir = direction # this stores the dprection the player is looking in, not just moving in !!!
	
func _ready() -> void:
	$Camera2D.make_current()

func _physics_process(_delta: float) -> void:
	if is_node_ready() and not $fall_timer.time_left:
		if lasting_dir.x < 0:
			$animation.scale.x = -1
		if lasting_dir.x > 0:
			$animation.scale.x = 1
		if not velocity.length() and not walk:
			$animation/walk.frame = 0
		if takes_input:
			get_input()
			velocity = speed * direction
			
			if dashing:
				velocity += 1 * dash_dir * lerp(0, dash_speed, $dash_timer.time_left * 5)# *5 to have an alpha of 1 - if not would end at 0.2
				push_force = 40000.0
			else:
				push_force = 20000.0
			
			
			move_and_slide()
			walk = false
			for i in get_slide_collision_count():
				var c = get_slide_collision(i)

				if c.get_collider() is RigidBody2D:
					walk = true
					c.get_collider().apply_central_force(-c.get_normal() * push_force)
			
			# stapler
			if Input.is_action_just_pressed("shoot_stapler") and GameState.has_stapler:
				$sound_stapler.play()
				$Stapler_shots.get_children()[next_stapler_index].shoot()
				next_stapler_index += 1
				if next_stapler_index >= len($Stapler_shots.get_children()):
					next_stapler_index = 0
			# fan
			if Input.is_action_pressed("fan") and GameState.has_fan:
				$animation/fan.visible = true
				$animation/fan.play()
				$animation/top.visible = false
				$wind_pivot/wind/AudioStreamPlayer2D.play()
				$wind_pivot/wind.active = true
				$wind_pivot/wind.visible = true
				$wind_pivot/wind.dir = lasting_dir
				$wind_pivot.look_at($wind_pivot.global_position + lasting_dir)
			else:
				$animation/fan.visible = false
				$animation/top.visible = true
				$wind_pivot/wind/AudioStreamPlayer2D.stop()
				$wind_pivot/wind.active = false
				$wind_pivot/wind.visible = false
				
			#dash
			if Input.is_action_just_pressed("dash") and GameState.has_scate:
				$animation/scate.visible = true
				$animation/walk.visible = false
				$animation/scate.play()
				$sound_scate.play()
				$dash_timer.start()
				dash_dir = lasting_dir
				dashing = true
				
			# falme
			if Input.is_action_just_pressed("lighter") and GameState.has_lighter:
				$sound_lighter.play()
				$flame_pivot.look_at($flame_pivot.global_position + lasting_dir)
				await get_tree().physics_frame # so that the collision chatches to the rotation
				for body:StaticBody2D in $flame_pivot/Area2D.get_overlapping_bodies():
					if body.is_in_group("flamable") and not body.on_fire:
						body.catch_fire()
			
		# pause
		if Input.is_action_just_pressed("escape"):
			if 	$UI/pause.visible:
				$UI/pause.visible = false
				takes_input = true
			else:
				$UI/pause.visible = true
				takes_input = false
					
	elif $fall_timer.time_left:
		rotate(0.1)
		scale = Vector2(1, 1) * lerp(0, 1, $fall_timer.time_left/$fall_timer.wait_time)
		
			
func fall():
	if not dashing:
		$AudioStreamPlayer2D.play()
		$fall_timer.start()
		$CollisionShape2D.set_deferred("disabled", true)
		$feet_coll/CollisionShape2D.set_deferred("disabled", true)


func _on_dash_timer_timeout() -> void:
	dashing = false
	$animation/scate.visible = false
	$animation/walk.visible = true


func _on_fall_timer_timeout() -> void:
	get_tree().reload_current_scene()
	
func start_vibing():
	$music.stop()
	$epic_music.play()
