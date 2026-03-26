extends Node2D

var dir:Vector2
var wind_speed = 200
@export var active = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	dir = Vector2(cos(global_rotation), sin(global_rotation))


func _on_area_2d_area_entered(area: Area2D) -> void:
	if active:
		area.dir = dir
		area.look_at(area.global_position - dir)

func _process(delta: float) -> void:
	if active:
		for body:PhysicsBody2D in $Area2D.get_overlapping_bodies():
			if not body.is_in_group("moving"):
				body.move_and_collide(dir * wind_speed * delta)
			
