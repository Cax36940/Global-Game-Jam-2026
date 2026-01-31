extends Node2D
class_name GuestSpawner

@export var guest_scene : PackedScene

@export var start_position_node : Node2D
@export var middle_position_node : Node2D
@export var end_position_node : Node2D

var current_guest : Guest = null
var current_mask : int = -1
var current_color : int = -1
var current_eye : int = -1


@onready var move_node : Node2D = $MoveNode

var move_state : int = 0
const SPEED : float = 1000.0
func _ready():
	SignalBus.spawn_guest.connect(spawn_guest)
	SignalBus.valid_guest.connect(valid_guest)
	SignalBus.reject_guest.connect(reject_guest)

	if not start_position_node :
		push_error("There is no start position node in the GuestSpawner")
	if not middle_position_node :
		push_error("There is no middle position node in the GuestSpawner")
	if not end_position_node :
		push_error("There is no end position node in the GuestSpawner")
	
	spawn_guest()
	Global.mask_list = current_guest.masks_list
	Global.eye_list = current_guest.eyes_list
	Global.color_list = current_guest.colors_list
	Global.setup_invalid()

func _process(delta):
	if move_state == 0:
		move_node.position.x = move_toward(move_node.position.x, start_position_node.position.x, delta * SPEED)
		move_node.position.y = move_toward(move_node.position.y, start_position_node.position.y, delta * SPEED)
		if (move_node.position - start_position_node.position).length() < 10 :
			remove_guest()
			SignalBus.Mistake_test.emit(!Global.check_guest(current_mask, current_eye, current_color))
			spawn_guest()
	if move_state == 1:
		move_node.position.x = move_toward(move_node.position.x, middle_position_node.position.x, delta * SPEED)
		move_node.position.y = move_toward(move_node.position.y, middle_position_node.position.y, delta * SPEED)
	if move_state == 2:
		move_node.position.x = move_toward(move_node.position.x, end_position_node.position.x, delta * SPEED)
		move_node.position.y = move_toward(move_node.position.y, end_position_node.position.y, delta * SPEED)
		if (move_node.position - end_position_node.position).length() < 10 :
			remove_guest()
			SignalBus.Mistake_test.emit(Global.check_guest(current_mask, current_eye, current_color))
			spawn_guest()
			
func spawn_guest():
	if current_guest :
		push_error("Trying to spawn a guest when the current one is still present")
		move_node.remove_child(current_guest)
		current_guest.queue_free()
	
	var guest : Guest = guest_scene.instantiate()
	current_guest = guest
	move_node.position = start_position_node.position
	move_state = 1
	move_node.add_child(guest)

func valid_guest():
	move_state = 2
	pass

func reject_guest():
	move_state = 0
	pass

func remove_guest():
	if !current_guest :
		push_error("Trying to remove a guest when none are still present")
	else:
		move_node.remove_child(current_guest)
		current_guest.queue_free()
		current_guest = null
		
