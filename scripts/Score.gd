extends Control

func _physics_process(delta):
	$Label.set_text(str(Signals.score))
