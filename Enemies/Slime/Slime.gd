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
 
onready var sprite = $SlimeSprite
onready var AggroZone = $AggroZone
onready var RoamController = $Roam

var velocity = Vector2.ZERO 
var knockback = Vector2.ZERO

var state = CHASE
func _physics_process(delta):
	match state:
		IDLE:
			velocity = velocity.move_toward(Vector2.ZERO, friction * delta)
			seek_player()
			if RoamController.get_time_left() == 0:
				state = pick_random_state([IDLE , ROAM])
				RoamController.set_roam_timer(rand_range(1 , 3))
		
		ROAM:
			seek_player()
			if RoamController.get_time_left() == 0:
				state = pick_random_state([IDLE , ROAM])
				RoamController.set_roam_timer(rand_range(1 , 3))
			var direction = global_position.direction_to(RoamController.target_position)
			velocity = velocity.move_toward(direction * MAX_SPEED, acceleration * delta)
			
		CHASE:
			var player = AggroZone.player
			#has founded player
			if player != null:
				var direction = global_position.direction_to(player.global_position)
				velocity = velocity.move_toward(direction * MAX_SPEED, acceleration * delta)
			else: 
				state = IDLE
		ATTACK:
			attack()
		DEATH:
			death()

			
	velocity = move_and_slide(velocity)

func pick_random_state(state_list):
	state_list.shuffle()
	return state_list.pop_front()
	
func seek_player():
	if AggroZone.see_player():
		state = CHASE

func attack():
	pass 

func death():
	pass


