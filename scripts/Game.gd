extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _physics_process(delta):
	if Signals.score > 20:
		print("1")
		ScrollMovement.scroll_speed = 10
	if Signals.score > 40:
		print("2")
		ScrollMovement.scroll_speed = 20
	if Signals.score > 50:
		print("3")
		ScrollMovement.scroll_speed = 30
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
