extends Node2D

onready var animation = $AnimatedSprite

func _ready():
	animation.play("Run")
