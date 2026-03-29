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

func get_input():
	direction = Input.get_vector("walk_left","walk_right","walk_up","walk_down")
	if direction:
		lasting_dir = direction # this stores the dprection the player is looking in, not just moving in !!!
	

func _physics_process(_delta: float) -> void:
	if is_node_ready():
		get_input()
		velocity = speed * direction
		
		if dashing:
			velocity += 1 * dash_dir * lerp(0, dash_speed, $dash_timer.time_left * 5)# *5 to have an alpha of 1 - if not would end at 0.2
			push_force = 40000.0
		else:
			push_force = 20000.0
		
		
		move_and_slide()
		for i in get_slide_collision_count():
			var c = get_slide_collision(i)
			if c.get_collider() is RigidBody2D:
				print(-c.get_normal() * push_force)
				c.get_collider().apply_central_force(-c.get_normal() * push_force)
		
		# stapler
		if Input.is_action_just_pressed("shoot_stapler"):
			$Stapler_shots.get_children()[next_stapler_index].shoot()
			next_stapler_index += 1
			if next_stapler_index >= len($Stapler_shots.get_children()):
				next_stapler_index = 0
		# fan
		if Input.is_action_pressed("fan"):
			$wind_pivot/wind.active = true
			$wind_pivot/wind.visible = true
			$wind_pivot/wind.dir = lasting_dir
			$wind_pivot.look_at($wind_pivot.global_position + lasting_dir)
		else:
			$wind_pivot/wind.active = false
			$wind_pivot/wind.visible = false
			
		#dash
		if Input.is_action_just_pressed("dash"):
			$dash_timer.start()
			dash_dir = lasting_dir
			dashing = true
			
		# falme
		if Input.is_action_just_pressed("lighter"):
			$flame_pivot.look_at($flame_pivot.global_position + lasting_dir)
			await get_tree().physics_frame # so that the collision chatches to the rotation
			for body:StaticBody2D in $flame_pivot/Area2D.get_overlapping_bodies():
				if body.is_in_group("flamable") and not body.on_fire:
					body.catch_fire()
			
		
			
func fall():
	if not dashing:
		print("aaaaaa")


func _on_dash_timer_timeout() -> void:
	dashing = false
