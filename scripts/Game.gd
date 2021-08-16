extends Node2D


func _physics_process(delta):
	if Signals.score > 0:
		print("0")
		Engine.time_scale = 1
	if Signals.score > 20:
		print("1")
		Engine.time_scale = 1.5
	if Signals.score > 40:
		print("2")
		Engine.time_scale = 2.0
	if Signals.score > 50:
		print("3")
		Engine.time_scale = 2.5
