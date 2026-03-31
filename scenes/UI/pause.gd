extends Control

func _process(_delta: float) -> void:
	if GameState.has_lighter:
		$backpack/lighter.visible = true
	if GameState.has_fan:
		$backpack/fan.visible = true
	if GameState.has_scate:
		$backpack/scate.visible = true
	if GameState.has_stapler:
		$backpack/stapler.visible = true
	if GameState.has_key:
		$backpack/key.visible = true
