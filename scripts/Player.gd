extends KinematicBody2D

var velocity = Vector2.ZERO
var sounds : Array
var sound_index = 0

onready var audio = $audio
onready var sound_1 = preload("res://audio/sounds/jump01.wav")
onready var sound_2 = preload("res://audio/sounds/jump02.wav")
onready var sound_3 = preload("res://audio/sounds/jump03.wav")
onready var sound_4 = preload("res://audio/sounds/jump04.wav")


export var jump_velocity = 400.0
export var gravity_scale = 20.0

enum {
	JUMP,
	RUN,
	IDLE
}

var state = RUN 

onready var animation = $AnimatedSprite

func _physics_process(delta):
	match state:
		RUN:
			animation.play("Run")
		JUMP:
			if sound_index > 3:
				sound_index = 0
			_play_sound(sound_index)
			velocity = Vector2.ZERO
			velocity.y -= jump_velocity
			animation.play("jump")
			state = IDLE
			sound_index += 1
		IDLE:
			pass
	
	velocity.y += gravity_scale
	move_and_collide(velocity*delta)
	
func _input(event):
	if state == RUN:
		if event.is_action_pressed("jump"):
			state = JUMP
		
	
func _ready():
	sounds = [ sound_1, sound_2, sound_3, sound_4 ] 
	animation.play("Run")


func _on_Area2D_body_entered(body):
	if body is StaticBody2D:
		state = RUN

func _on_Area2D_body_exited(body):
	if body is StaticBody2D:
		state = IDLE
	


#func _on_Timer_timeout():
#	state = get_random_state([JUMP,IDLE,RUN])
#
#func get_random_state(statelist):
#	randomize()
#	statelist.shuffle()
#	return statelist.front()



func _play_sound(sound_index):
	var sound = sounds[sound_index]
	audio.stream = sound 
	audio.play()






