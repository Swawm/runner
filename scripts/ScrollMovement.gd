extends Node2D

export var scroll_speed = 3.3

func move():
	self.position.x -= scroll_speed
