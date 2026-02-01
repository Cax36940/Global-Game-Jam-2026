extends Control


func _ready() -> void:
	# TODO: scale nicer
	$Curtain.scale = get_viewport_rect().size / $Curtain.texture.get_size()

# TODO: delete
func display():
	appear()

func appear():
	show()
	$VBoxContainer.get_child(1).grab_focus.call_deferred()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
