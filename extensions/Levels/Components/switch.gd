extends "res://Levels/Components/switch.gd"

@onready var switch_key = get_node("Switch-key")
@onready var lamp_glow = get_node("Switch/LampGlow") # ghost switches glow

var _kind

func _ready():
	GameManager.ability_unlocked.connect(on_ability_unlocked)

	# All switches (single/double keys, ghost) use this script,
	# we need to differenciate
	if self.name.begins_with("SwitchGhost"):
		_kind = GameManager.Unlockable.GHOST_SWITCHES
	elif is_double_key():
		_kind = GameManager.Unlockable.DOUBLE_KEYS
	else:
		_kind = GameManager.Unlockable.SINGLE_KEYS

	# MOD Disable switches by default, will be unlocked via items
	if not GameManager.is_unlocked(_kind):
		can_switch = false
		if switch_key:
			switch_key.visible = false
		if lamp_glow:
			lamp_glow.visible = false

	super()

# The game doesn't differenciate between single and double
# keys, it just stacks 2 keys on top of each other.
# This function detects that.
func is_double_key() -> bool:
	for other in self.get_parent().get_children():
		if other == self:
			continue
		if other.global_position == self.global_position:
			return true
	return false

func on_ability_unlocked(which):
	if _kind != which:
		return
	can_switch = true
	if switch_key:
		switch_key.visible = true
	elif lamp_glow:
		lamp_glow.visible = true
