extends "res://Levels/Components/switch.gd"

@onready var switch_key = get_node("Switch-key")
@onready var lamp_glow = get_node("Switch/LampGlow") # ghost switches glowing light

enum Kind { SINGLE_KEY, DOUBLE_KEY, GHOST}
var _kind: Kind

# MOD Make switches unlockable
func _ready():
	# MOD Set switch type, since all switches (single/double keys, laser eyes)
	# use this script, we need to differenciate
	if self.name.begins_with("SwitchGhost"):
		_kind = Kind.GHOST
	elif is_double_key():
		_kind = Kind.DOUBLE_KEY
	else:
		_kind = Kind.SINGLE_KEY

	# MOD Disable switches by default, will be unlocked via items
	can_switch = false
	if switch_key:
		switch_key.visible = false
	if lamp_glow:
		lamp_glow.visible = false
	if _kind == Kind.DOUBLE_KEY:
		GameManager.double_keys_unlocked.connect(on_keys_unlocked)
	elif _kind == Kind.SINGLE_KEY:
		GameManager.single_keys_unlocked.connect(on_keys_unlocked)
	elif _kind == Kind.GHOST:
		GameManager.ghost_switches_unlocked.connect(on_keys_unlocked)
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
	elif lamp_glow:
		lamp_glow.visible = true
