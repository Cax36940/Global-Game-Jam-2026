extends Sprite2D

var is_hovering : bool = false
#const ABC : int = 100
#@export var can_move : bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += delta * velocity * 100
	pass
#	

func foo(x : int):
	return x
