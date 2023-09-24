extends Control

signal opened
signal closed

#status
var is_open = false 
var item_is_in_slot = null

func _ready():
	pass

func open():
	visible = true 
	is_open = true

func close():
	visible = false 
	is_open = false

