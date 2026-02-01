extends Camera2D

var is_zoom_in : bool = false

func _ready():
	zoom_out()
	SignalBus.zoom_in.connect(zoom_in)
	SignalBus.zoom_out.connect(zoom_out)
	SignalBus.zoom_toggle.connect(zoom_toggle)

func zoom_in():
	position = Vector2(640, 360)
	zoom = Vector2(2.0, 2.0)
	is_zoom_in = true
	Global.Triple_show = true
	
func zoom_out():
	position = Vector2(640, 360)
	zoom = Vector2(1.0, 1.0)
	is_zoom_in = false
	Global.Triple_show = false
	
func zoom_toggle():
	if is_zoom_in :
		zoom_out()
		($Glasses1 as AudioStreamPlayer).play(0.03)
	else:
		if not Global.Triple_show:
			zoom_in()
			($Glasses2 as AudioStreamPlayer).play(0.03)
