extends "ScrollMovement.gd"

onready var animation = $Sprite

func _ready():
	animation.play("fly")
	
func _physics_process(delta):
	move()


func _on_Area2D_body_entered(body):
	if body.name =="Player":
		print("player died")
	pass # Replace with function body.
