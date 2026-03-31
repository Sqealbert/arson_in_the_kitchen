extends Node

var spawn_id: int = 1
var has_lighter = 1
var has_fan = 1
var has_scate = 1
var has_stapler = 1
var has_key = 0

var levels = {
	"LvlStartEnd" = [0, 0, 0, 0, 0],
	"LvlLighterFan" = [1, 1, 0],
	"LvlFanGet" = [0],
	"LvlScateGetAndPuzzle" = [0, 0, 0],
	"LvlStaplerGet" = [0]}
