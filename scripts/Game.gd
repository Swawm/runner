extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
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
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
