extends Node2D

export (Array, PackedScene) var scenes
export (float) var  timer

var random_scene = RandomNumberGenerator.new()
var random_delay = RandomNumberGenerator.new()

var selected_scene_index = 0

func _ready():
	$Timer.wait_time = timer

func _on_Timer_timeout():
	random_scene.randomize()
	selected_scene_index = random_scene.randi_range(0, scenes.size()-1)
	var tmp = scenes[selected_scene_index].instance()
	add_child_below_node(self,tmp)
	
func _physics_process(delta):
 random_delay.randomize()
 var multiplier = random_delay.randf_range(0.5, 0.9)
 if Signals.score > 0:
  $Timer.wait_time = 3.3 * multiplier
 if Signals.score > 20:
  $Timer.wait_time = 2.7 * multiplier
 if Signals.score > 40:
  $Timer.wait_time = 1.7 * multiplier
 if Signals.score > 50:
  $Timer.wait_time = 1.4 * multiplier
