extends Area2D


var dir:Vector2
var speed: int = 1200
var moving = false
var shot_bodies: Array

# Called when the node enters the scene tree for the first time.
func shoot() -> void:
	visible = true
	position = get_parent().get_parent().position 
	dir = get_parent().get_parent().lasting_dir # only from player
	look_at(position - dir)	 # chancge rotation
	moving = true
	if shot_bodies:
		for bod in shot_bodies:
			bod.move()
		shot_bodies = []

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if moving:
		position += dir * speed * delta
	
func _on_body_entered(body: Node2D) -> void:
	moving = false
	$AudioStreamPlayer2D.play()
	if body.is_in_group("moving"):
		body.stop()
		shot_bodies.append(body)
