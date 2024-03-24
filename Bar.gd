extends MarginContainer

onready var bar = $Bars/Base/HealthBar/TextureProgress

var player_health = 0

func _on_Player_give_healthInfo(health):
	player_health = health
	
func _ready():
	bar.max_value = player_health
	
func update_heath(new_value):
	bar.value = new_value

func _on_Player_health_changed():
	pass 

