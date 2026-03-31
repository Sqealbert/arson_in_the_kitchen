extends Control

func _process(_delta: float) -> void:
	if GameState.has_lighter:
		$backpack/lighter.visible = true
		$backpack/tut1.visible = true
	if GameState.has_fan:
		$backpack/fan.visible = true
		$backpack/tut2.visible = true
	if GameState.has_scate:
		$backpack/scate.visible = true
		$backpack/tut3.visible = true
	if GameState.has_stapler:
		$backpack/stapler.visible = true
		$backpack/tut4.visible = true
	if GameState.has_key:
		$backpack/key.visible = true
