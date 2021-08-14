extends "ScrollMovement.gd"

func _physics_process(delta):
	move()


func _on_Area2D_body_entered(body):
	if body.name =="Player":
		Signals.emit_signal("killplayer")
		queue_free()
	pass # Replace with function body.
