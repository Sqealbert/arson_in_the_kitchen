extends CharacterBody2D

@export var speed: int = 200
var direction: Vector2

func get_input():
	direction = Input.get_vector("walk_left","walk_right","walk_up","walk_down")
	

func _physics_process(delta: float) -> void:
	get_input()
	velocity = speed * direction
	move_and_slide()
