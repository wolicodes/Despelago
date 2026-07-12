extends "res://Levels/Components/switch.gd"

@onready var switch_key = get_node("Switch-key")

# MOD Make keys unlockable
func _ready():
	can_switch = false
	if switch_key:
		switch_key.visible = false
	if is_double_key():
		GameManager.double_keys_unlocked.connect(on_keys_unlocked)
	else:
		GameManager.single_keys_unlocked.connect(on_keys_unlocked)
	super()

func is_double_key() -> bool:
	for other in self.get_parent().get_children():
		if other == self:
			continue
		if other.global_position == self.global_position:
			return true
	return false

func on_keys_unlocked():
	can_switch = true
	if switch_key:
		switch_key.visible = true
