extends VBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Button.toggled.connect(_on_button_toggled)

func _on_button_toggled(toggled_on: bool) -> void:
	print("hi")
	$Label.visible = toggled_on

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
