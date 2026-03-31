extends Node

var spawn_id: int = 2
var has_lighter = 0
var has_fan = 0
var has_scate = 0
var has_stapler = 0
var has_key = 0

var levels = {
	"LvlStartEnd" = [0, 0, 0, 0, 0],
	"LvlLighterFan" = [0, 0, 0],
	"LvlFanGet" = [0],
	"LvlScateGetAndPuzzle" = [0, 0, 0],
	"LvlStaplerGet" = [0]}
