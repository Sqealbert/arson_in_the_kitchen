extends CharacterBody2D

@export var speed: int = 200
var direction: Vector2

func get_input():
	direction = Input.get_vector("walk_left","walk_right","walk_up","walk_down")
	

func _physics_process(delta: float) -> void:
	get_input()
	velocity = speed * direction
	
	var push_force = 80.0
	
	for block in get_slide_collision_count():
		var collision = get_slide_collision(block)
		var collision_block = collision.get_collider()
		if collision_block.is_in_group("Blocks"):# and abs(collision_block.get_linear_velocity()) < MAX_VELOCITY:
			collision_block.apply_central_impulse(collision.get_normal() * push_force)
		
	
	move_and_slide()
