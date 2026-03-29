extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var i = 0
	for door_iter in $doors.get_children():
		if GameState.levels[name][i]:
			door_iter.silent_open()
		i += 1
		
func save_open(door_index):
	GameState.levels[name][door_index] = true
	
