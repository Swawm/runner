extends "ScrollMovement.gd"

func move():
 self.position.x -= 0.5

func _physics_process(delta):
 move()
