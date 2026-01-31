extends Node2D


func _ready() -> void:
	visible = false
	SignalBus.Notebook_show.connect(signal_handler)


func signal_handler(value : int) -> void :
	SignalBus.Triple_show.emit(value)
	if value == 0:
		visible = true
	else:
		visible = false
		$"../Mini_Notebook".visible = true


func _process(delta: float) -> void:
	pass

 
