extends Node2D
class_name GuestSpawner

@export var guest_scene : PackedScene

@export var start_position_node : Node2D
@export var middle_position_node : Node2D
@export var end_position_node : Node2D

var current_guest : Guest = null

@onready var move_node : Node2D = $MoveNode

var move_state : int = 0
const SPEED : float = 100.0
func _ready():
	SignalBus.spawn_guest.connect(spawn_guest)
	SignalBus.valid_guest.connect(valid_guest)
	SignalBus.reject_guest.connect(reject_guest)
	
	if not start_position_node :
		printerr("There is no start position node in the GuestSpawner")
	if not middle_position_node :
		printerr("There is no middle position node in the GuestSpawner")
	if not end_position_node :
		printerr("There is no end position node in the GuestSpawner")

func _process(delta):
	if move_state == 0:
		position.x = move_toward(position.x, start_position_node.position.x, delta * SPEED)
		position.y = move_toward(position.y, start_position_node.position.y, delta * SPEED)
	if move_state == 1:
		position.x = move_toward(position.x, middle_position_node.position.x, delta * SPEED)
		position.y = move_toward(position.y, middle_position_node.position.y, delta * SPEED)
	if move_state == 2:
		position.x = move_toward(position.x, end_position_node.position.x, delta * SPEED)
		position.y = move_toward(position.y, end_position_node.position.y, delta * SPEED)

func spawn_guest():
	if current_guest :
		printerr("Trying to spawn a guest when the current one is still present")
		move_node.remove_child(current_guest)
		current_guest.queue_free()
	
	var guest : Guest = guest_scene.instantiate()
	current_guest = guest
	move_node.position = Vector2.ZERO
	move_state = 1
	move_node.add_child(guest)

func valid_guest():
	move_state = 2
	pass

func reject_guest():
	move_state = 0
	pass
