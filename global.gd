extends Node

var is_guest_valid : bool = true
var Triple_show : bool = false
var Total_count : int = 0
var Mistakes_count : int = 0
var Score : int = 0

var mask_list : Array[PackedScene] = []
var eye_list : Array[PackedScene] = []
var color_list : Array[Color] = []

var invalid_mask : Array[int] = []
var invalid_eye : Array[int] = []
var invalid_color : Array[int] = []




func random_sublist(size : int, input_list : Array) -> Array[int]:
	var pool : Array = range(input_list.size())
	if size >= input_list.size():
		return pool
	var ret : Array[int] = []
	for i in range(size):
		pool.shuffle()
		ret.push_back(pool.pop_back())
	return ret

func setup_invalid():
	invalid_color = random_sublist(3, color_list)
	invalid_mask = random_sublist(1, mask_list)
	invalid_eye = random_sublist(3, eye_list)
	SignalBus.write_constrain.emit()
	

func check_guest(mask_index : int, eye_index : int, color_index : int):
	var is_color_invalid : bool = invalid_color.find(color_index) == -1
	var is_eye_invalid : bool = invalid_eye.find(eye_index) == -1
	var is_mask_invalid : bool = invalid_mask.find(mask_index) == -1
	return !(is_color_invalid || is_eye_invalid || is_mask_invalid)
