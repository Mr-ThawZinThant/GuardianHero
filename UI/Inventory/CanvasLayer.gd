extends CanvasLayer

onready var inventory = $InventoryGUI

func _ready():
	inventory.close()
	
func _input(event):
	if Input.is_action_just_pressed("Inventory"):
		if inventory.is_open:
			inventory.close()
		else:
			inventory.open()
			
		
	

