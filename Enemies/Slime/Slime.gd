extends KinematicBody2D

const MAX_SPEED = 200
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
 
onready var sprite = $Bat
onready var AggroZone = $AggroZone

var velocity = Vector2.ZERO 
var knockback = Vector2.ZERO

func _ready():
	pass
	
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
				accelerate_towards_point(player.global_position , delta)
			else: 
				state = IDLE
		ATTACK:
			attack()
		DEATH:
			death()
		ROAM:
			seek_player()
			
	
	velocity = move_and_slide(velocity)

func seek_player():
	if AggroZone.see_player():
		state = CHASE

func attack():
	pass 

func death():
	pass

func accelerate_towards_point(point, delta):
	var direction = global_position.direction_to(point)
	velocity = velocity.move_toward(direction * MAX_SPEED, acceleration * delta)
	sprite.flip_h = velocity.x < 0
	
func random_state():
	pass
