extends KinematicBody2D
class_name Player

signal killplayer


var velocity = Vector2.ZERO
var sounds : Array
var sound_index = 0

onready var audio = $audio
onready var sound_1 = preload("res://audio/sounds/jump01.wav")
onready var sound_2 = preload("res://audio/sounds/jump02.wav")
onready var sound_3 = preload("res://audio/sounds/jump03.wav")
onready var sound_4 = preload("res://audio/sounds/jump04.wav")



export var jump_velocity = 310.0
export var gravity_scale = 9.8

enum {
	JUMP,
	RUN,
	IDLE,
	FALL,
}

var state = IDLE 

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
		FALL:
			animation.play("Fall")
			set_physics_process(false)
			Signals.speed = 0
			
	
	velocity.y += gravity_scale
	move_and_collide(velocity*delta)
	
func _input(event):
	if state == RUN:
		if event.is_action_pressed("jump"):
			state = JUMP
	if state == IDLE:
		if event.is_action_pressed("ui_down"):
			velocity = Vector2.ZERO
			velocity.y += jump_velocity
		
	
func _ready():
	Signals.connect("killplayer", self, "killplayer")
	sounds = [ sound_1, sound_2, sound_3, sound_4 ]
	animation.play("Run")


func _on_Area2D_body_entered(body):
	if body is StaticBody2D:
		state = RUN

func _on_Area2D_body_exited(body):
	if body is StaticBody2D:
		state = IDLE


func _play_sound(sound_index):
	var sound = sounds[sound_index]
	audio.stream = sound 
	audio.play()



func killplayer():
	state = FALL
	pass

func _on_Timer_timeout():
	if (state == RUN || state == IDLE):
		Signals.score += 1
	# Здесь и меняется скорость препятствий
	if (Signals.speed <= 9.0 && (state == RUN || state == IDLE)):
		Signals.emit_signal("road_speed_up")
		Signals.speed += 0.1
	$Timer.start()
	return Signals.score
