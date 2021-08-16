extends Node2D

#export (float) var scroll_speed

func move():
	self.position.x -= Signals.speed
