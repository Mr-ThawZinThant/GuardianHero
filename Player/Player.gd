extends KinematicBody2D

export(Resource) var PlayerMovement

export var acceleration = 0.1
export var speed = 200
export var friction = 0.1

var velocity: Vector2 = Vector2.ZERO

enum {
	MOVE,
	IDLE,
}

#Animaton 
onready var anim_sprite: AnimationPlayer = $PinkGirl/AnimationPlayer

var state = MOVE
func _physics_process(delta):
	match state: 
		MOVE:
			walk(delta)
		
func apply_friction(dir):
	if dir.length() > 0:
		velocity = lerp(velocity, dir * speed, acceleration)
	else:
		velocity = lerp(velocity, Vector2.ZERO, friction)
	
func walk(delta):
	var input_dir: Vector2 = Vector2.ZERO
	input_dir.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_dir.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_dir = input_dir.normalized()
	
	apply_friction(input_dir)
	move()

func move():
	velocity = move_and_slide(velocity)
	
