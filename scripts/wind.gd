extends Node2D

var dir:Vector2
var wind_speed = 200

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	dir = Vector2(cos(rotation), sin(rotation))


func _on_area_2d_area_entered(area: Area2D) -> void:
	area.dir = dir
	area.rotation = -rotation

func _process(delta: float) -> void:
	for body in $Area2D.get_overlapping_bodies():
		body.global_position += dir * wind_speed * delta
		print(body)
