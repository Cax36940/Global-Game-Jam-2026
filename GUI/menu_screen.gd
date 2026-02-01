# Common base class for all screen.covering menus
# Requirement:
# * Curtain: Sprite2D
# * AnimationPlayer
class_name MenuScreen
extends Control


func _ready() -> void:
	# TODO: scale nicer
	$Curtain.scale = get_viewport_rect().size / $Curtain.texture.get_size()

func reset_position() -> void:
	position = Vector2(0,0)

func disappear():
	$AnimationPlayer.queue("curtain rise")
	# TODO: hide after animation is done

func appear() -> void:
	show()
	# https://docs.godotengine.org/en/stable/tutorials/ui/gui_navigation.html
	$VBoxContainer.get_child(1).grab_focus.call_deferred()
	position = Vector2(0, -get_viewport_rect().size[1])
	$AnimationPlayer.queue("curtain fall")
