extends "res://Levels/Components/lamp_chandelier.gd"

var chandeliers = GameManager.Unlockable.CHANDELIERS

# MOD disable chandelier until unlocked
func _on_player_entered(body):
	# no need to override check_player_overlap for dashes starting inside the lamp,
	# since gating lamp_in here means player.current_lamp is never set, so
	# check_player_overlap won't go through
	if GameManager.is_unlocked(chandeliers) and body.has_method("lamp_in"):
		body.lamp_in(self)
