extends Control

const ANIMATION_DURATION = .7

enum {IDLE, CURTAIN_FALL, CURTAIN_RISE}
var state = IDLE
var timer = 0

func _ready() -> void:
	# TODO: scale nicer
	reset_position()
	$Curtain.scale = get_viewport_rect().size / $Curtain.texture.get_size()

func reset_position() -> void:
	position = Vector2(0,0)

# TODO: delete
func display():
	appear()

func appear() -> void:
	show()
	position = Vector2(0, -get_viewport_rect().size[1])
	state = CURTAIN_FALL

	$VBoxContainer.get_child(1).grab_focus.call_deferred()

func disappear() -> void:
	pass

func curtain_fall(t) -> Vector2:
	return Vector2(0, -get_viewport_rect().size[1]) * (1-t)**3 / ANIMATION_DURATION
func idle():
	pass

func _process(delta: float) -> void:
	if state == CURTAIN_FALL:
		if timer <= 1:
			position = curtain_fall(timer)
			timer += delta
		else:
			state = IDLE
			timer = 0
			# Makes sure the menu is in the correct position but might result
			# in jagged animation
			reset_position()
