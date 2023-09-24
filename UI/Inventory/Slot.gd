extends Panel

onready var itemTextureRect = $ItemTextureRect

func display_item(item):
	if item is Item:
		itemTextureRect.texture = load("res://UI/Items/Potions/mana_potion.png")
		
