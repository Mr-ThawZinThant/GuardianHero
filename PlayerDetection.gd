extends Area2D

var player = null

func see_player():
	return player != null

func body_entered(body):
	player = body

func body_exited(_body):
	player = null

