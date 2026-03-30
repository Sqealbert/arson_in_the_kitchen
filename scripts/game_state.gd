extends Node

var spawn_id: int = 2
var has_lighter = 1
var has_fan = 0
var has_scate = 0
var has_stapler = 1
var has_key = 1

var levels = {
	"LvlStartEnd" = [0, 0, 0, 0],
	"LvlLighterFan" = [],
	"LvlFanGet" = [0],
	"LvlScateGetAndPuzzle" = [0, 0, 0],
	"LvlStaplerGet" = [0]}
