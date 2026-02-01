extends Node2D
class_name Eyes

func set_eyes(index : int):
	($EyeL as AnimatedSprite2D).frame = index
	($EyeR as AnimatedSprite2D).frame = index
