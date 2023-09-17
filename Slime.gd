extends KinematicBody2D

var speed = 100
var acceleration = 0.1 
var friction = 0.1

enum {
	IDLE,
	WALK,
	ATTACK,
	DEATH, 
	ROAM
}

var state = IDLE
func _physics_process(delta):
	match state:
		IDLE:
			idle()
		WALK:
			walk()
		ATTACK:
			attack()
		DEATH:
			death()
		ROAM:
			roam()

func walk():
	pass 
	
func attack():
	pass 

func idle():
	pass

func roam():
	pass

func death():
	pass
