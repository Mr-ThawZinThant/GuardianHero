extends GridContainer

var inventory = preload("res://UI/Inventory/inventory.tres")

func _ready():
	inventory.connect("item_changed", self, "_on_item_changed")
	update_inventory_display()
	
func update_inventory_display():
	for item_index in inventory.items.size():
		update_inventory_slot(item_index)
	
func update_inventory_slot(item_index):
	var inventorySlotDisplay = get_child(item_index)
	var item = inventory.items[item_index]
	inventorySlotDisplay.display_item(item)
	
func _on_item_changed(indexes):
	for item_index in indexes:
		update_inventory_slot(item_index)

func _unhandled_input(event):
	if event.is_action_released("ui_left_mouse"):
		if inventory.drag_data is Dictionary:
			inventory.set_item(inventory.drag_data.item_index, inventory.drag_data.item)
	
