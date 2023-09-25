extends Resource
class_name Inventory

signal item_changed(indexes)

var drag_data = null

export (Array , Resource) var items = []

func set_item(item_index , item):
	var previousItem = items[item_index]
	items[item_index] = item
	emit_signal("item_changed", [item_index])
	return previousItem

func swap_items(item_index, target_item_index):
	var targetItem = items[target_item_index]
	var item = items[item_index]
	items[target_item_index] = item
	items[item_index] = targetItem
	emit_signal("item_changed", [item_index, target_item_index])
	
func remove_item(item_index):
	var previousItem = items[item_index]
	items[item_index] = null
	emit_signal("item_changed", [item_index])
	return previousItem

func _ready():
	pass
