extends "res://Levels/Components/switch.gd"

@onready var key = get_node("Switch-key")

func _ready():
	can_switch = false
	if key:
		key.visible = false
	GameManager.single_keys_unlocked.connect(on_single_keys_unlocked)
	super()
	
func on_single_keys_unlocked():
	can_switch = true
	if key:
		key.visible = true
