extends StaticBody2D


var tween_pos: Array
var speed = 400
var target_pos_index:int
var moving = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	tween_pos = [$Marker2D.global_position, $Marker2D2.global_position]
	target_pos_index = 0


func _physics_process(delta: float) -> void:
	if moving:
		if (tween_pos[target_pos_index] - position).length() > 20:
			var direction = (tween_pos[target_pos_index] - position).normalized()
			position += direction * speed * delta
		else:
			target_pos_index =  !target_pos_index

func stop():
	moving = false
	
func move():
	moving = true
