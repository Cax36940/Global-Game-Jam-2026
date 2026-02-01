extends VBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Button.toggled.connect(_on_button_toggled)

func _on_button_toggled(toggled_on: bool) -> void:
	$Label.visible = toggled_on
