class_name player extends CharacterBody2D

@export var speed: int = 200
@export var push_force: float = 10000.0
var direction: Vector2
var lasting_dir: Vector2 = Vector2(1, 0) ## base state
var next_stapler_index = 0

func get_input():
	direction = Input.get_vector("walk_left","walk_right","walk_up","walk_down")
	if direction:
		lasting_dir = direction # this stores the dprection the player is looking in, not just moving in !!!
	

func _physics_process(delta: float) -> void:
	get_input()
	velocity = speed * direction
	
	
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
	
func fall():
	print("aaaaaa")
