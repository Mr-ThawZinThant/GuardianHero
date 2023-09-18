extends Area2D

var player = null

func see_player():
	return player != null

func _on_AggroZone_body_entered(body):
	player = body 

func _on_AggroZone_body_exited(body):
	player = null
