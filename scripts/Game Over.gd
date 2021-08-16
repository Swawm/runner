extends Control

func _ready():
	Signals.connect("killplayer", self, "gameover")

	
func gameover():
	$ded.play()
	Engine.time_scale = 0.0
	self.show()
	if Signals.score >= 50:
		$Listen.show()
	

func _on_Retry_pressed():
	Signals.score = 0
	Engine.time_scale = 1.0
	get_tree().reload_current_scene()
	

func _on_Listen_pressed():
	Engine.time_scale = 1.0
	Signals.emit_signal("album_on")
	$Album.play()
