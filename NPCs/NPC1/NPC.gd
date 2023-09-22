extends Area2D

var active = false

func _ready():
	connect("body_entered", self, '_on_NPC_body_entered')
	connect("body_exited", self, '_on_NPC_body_existed')
	
func _process(delta):
	$Message.visible = active

func _input(event):
	if get_node_or_null('DialogicNode') == null:
		if event.is_action_pressed("ui_accept") and active:
			get_tree().paused = true
			var dialog = Dialogic.start("Timeline1")
			dialog.pause_mode = Node.PAUSE_MODE_PROCESS
			dialog.connect('Timeline_end', self, 'unpause') 
			add_child(dialog)

func _on_NPC_body_entered(body):
	if body.name == "Player":
		active = true

func _on_NPC_body_existed(body):
	if body.name == "Player":
		active = false
