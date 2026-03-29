extends Control

var main_menu = false
var pause = false
var title_card = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if pause:
		$pause.visible = true
		$fad_black.visible = true
