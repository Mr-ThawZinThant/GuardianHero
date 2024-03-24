extends CanvasLayer

onready var inventory = $InventoryGUI

func _ready():
	inventory.close()
	
func _input(event):
	if Input.is_action_just_pressed("Inventory"):
		if inventory.is_open:
			inventory.close()
			get_tree().paused = false
		else:
			inventory.open()
			get_tree().paused = true 
			
		
	

