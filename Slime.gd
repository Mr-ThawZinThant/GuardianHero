extends KinematicBody2D

var speed = 100
var acceleration = 0.1 
var friction = 0.1

enum {
	IDLE,
	CHASE,
	ATTACK,
	DEATH, 
	ROAM
}

var velocity = Vector2.ZERO 
var knockback = Vector2.ZERO

var state = CHASE
func _physics_process(delta):
	match state:
		IDLE:
			idle()
		CHASE:
			chase()
		ATTACK:
			attack()
		DEATH:
			death()
		ROAM:
			roam()

func chase():
	pass 
	
func attack():
	pass 

func idle():
	pass

func roam():
	pass

func death():
	pass
