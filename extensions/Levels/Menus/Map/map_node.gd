extends "res://Levels/Menus/Map/map_node.gd"

# MOD disable map animations on first map opening
func update_node(unlocked_state, necessary_stages_won, won_state, new_playtime):
	unlocked = unlocked_state
	if unlocked:
		node_button.disabled = false
		node_button.focus_mode = FOCUS_ALL
	else:
		node_button.disabled = true
		node_button.focus_mode = FOCUS_NONE
		
	current_parts = necessary_stages_won
	playtime = new_playtime
	won = won_state
	_update_visuals()
