extends Node

var is_guest_valid : bool = true
var Triple_show : bool = false
var Total_count : int = 0
var Mistakes_count : int = 0
var Score : int = 0
var time : float = 0.0

const GAME_TIME : float = 300

var color_list : Array[Color] = []

var valid_mask : Array[int] = []
var valid_eye : Array[int] = []
var valid_color : Array[int] = []

var invalid_mask : Array[int] = []
var invalid_eye : Array[int] = []
var invalid_color : Array[int] = []

var is_zoomed : bool = false

func _ready():
	update_score()

func update_score():
	
	#var m = 0
	#if Global.Mistakes_count < 2:
	#	m = 1
	#else:
	#	m = Global.Mistakes_count
	#@warning_ignore('integer_division')
	#Score = min(max(0,round(30-8*log(m*50/(Global.Total_count+5)-1))), 100)
	Score = 100 - int(time / 3) - Global.Mistakes_count * 5 + 2 * (Global.Total_count - Global.Mistakes_count)
	Score = max(Score, 0)
	SignalBus.update_dislpayed_score.emit()
	SignalBus.update_displayed_timer.emit()
	
func random_sublist(size : int, array_size : int) -> Array[int]:
	var pool : Array = range(array_size)
	if size >= array_size:
		return pool
	var ret : Array[int] = []
	for i in range(size):
		pool.shuffle()
		ret.push_back(pool.pop_back())
	return ret

func setup_invalid():
	valid_color = random_sublist(3, 7)
	valid_mask = random_sublist(3, 7)
	valid_eye = random_sublist(3, 7)
	
	for i in range(0, 7):
		if valid_color.find(i) == -1:
			invalid_color.push_back(i)
		if valid_mask.find(i) == -1:
			invalid_mask.push_back(i)
		if valid_eye.find(i) == -1:
			invalid_eye.push_back(i)
	SignalBus.write_constrain.emit()
	
# return true if valid
func check_guest(mask_index : int, eye_index : int, color_index : int):
	var is_color_valid : bool = valid_color.find(color_index) != -1
	var is_eye_valid : bool = valid_eye.find(eye_index) != -1
	var is_mask_valid : bool = valid_mask.find(mask_index) != -1
	return is_color_valid && is_eye_valid && is_mask_valid
