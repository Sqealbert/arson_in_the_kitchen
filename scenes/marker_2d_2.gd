extends Marker2D


var tween_pos: Array
var speed = 100
var target_pos:Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	tween_pos = [$"../Marker2D".global_position, $"../Marker2D2".global_position]
	target_pos = tween_pos[0]


func _physics_process(delta: float) -> void:
	var direction = (target_pos - position).normalized()
	position += direction * speed * delta
	print(position)
