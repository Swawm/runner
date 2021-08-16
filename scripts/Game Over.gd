extends Control

func _ready():
	Signals.connect("killplayer", self, "gameover")
	pass
	
func gameover():
	self.show()
	if Signals.score >= 40:
		$Listen.show()
	

func _on_Retry_pressed():
	Signals.score = 0
	get_tree().reload_current_scene()
	


func _on_Listen_pressed():
	$Album.play()
	pass # Replace with function body.
