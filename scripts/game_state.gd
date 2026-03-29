extends Node

var spawn_id: int = 2
var has_lighter = false
var has_fan = false
var has_scate = false
var has_stapler = false
var has_key = false

var levels = {
	"LvlStartEnd" = [0, 0, 0],
	"LvlLighterFan" = [],
	"LvlFanGet" = [],
	"LvlScateGetAndPuzzle" = [],
	"LvlStaplerGet" = []}
