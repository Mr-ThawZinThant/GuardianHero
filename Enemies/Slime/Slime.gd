extends KinematicBody2D

const MAX_SPEED = 100
var acceleration = 300
var friction = 200

enum {
	IDLE,
	CHASE,
	ATTACK,
	DEATH, 
	ROAM
}
 
onready var sprite = $Bat
onready var AggroZone = $AggroZone

var velocity = Vector2.ZERO 
var knockback = Vector2.ZERO

var state = CHASE
func _physics_process(delta):
	match state:
		IDLE:
			velocity = velocity.move_toward(Vector2.ZERO, friction * delta)
			seek_player()
		CHASE:
			var player = AggroZone.player
			#has founded player
			if player != null:
				var direction = (player.global_position - global_position).normalized()
				velocity = velocity.move_toward(direction * MAX_SPEED, acceleration * delta)
			else: 
				state = IDLE
		ATTACK:
			attack()
		DEATH:
			death()
		ROAM:
			pass
			
	velocity = move_and_slide(velocity)

func seek_player():
	if AggroZone.see_player():
		state = CHASE

func attack():
	pass 

func death():
	pass


