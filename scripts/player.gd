extends CharacterBody2D

@export var speed: int = 200
var direction: Vector2
var lasting_dir: Vector2 = Vector2(1, 0) ## base state
var next_stapler_index = 0

func get_input():
	direction = Input.get_vector("walk_left","walk_right","walk_up","walk_down")
	if direction:
		lasting_dir = direction # this stores the dprection the player is looking in, not just moving in !!!
	

func _physics_process(_delta: float) -> void:
	get_input()
	velocity = speed * direction
	
	var push_force = 80.0
	
	for block in get_slide_collision_count():
		var collision = get_slide_collision(block)
		var collision_block = collision.get_collider()
		if collision_block.is_in_group("Blocks"):# and abs(collision_block.get_linear_velocity()) < MAX_VELOCITY:
			collision_block.apply_central_impulse(collision.get_normal() * push_force)
		
	move_and_slide()
	
	# stapler
	if Input.is_action_just_pressed("shoot_stapler"):
		$Stapler_shots.get_children()[next_stapler_index].shoot()
		next_stapler_index += 1
		if next_stapler_index >= len($Stapler_shots.get_children()):
			next_stapler_index = 0
	
func fall():
	print("aaaaaa")
