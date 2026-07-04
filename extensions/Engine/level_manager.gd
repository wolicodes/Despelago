extends "res://Engine/level_manager.gd"

# MOD enable opening the map without having to clear 1-1
func _input(event):
	super(event)
	if Input.is_action_just_pressed("MapMenu") and !PauseMenu.is_active() and !StageManager.get_saved_stage(0).won:
		if GameManager.is_demo: return
		#if StageManager.get_saved_stage(0).won == false: return
		if StageManager.current_stage == StagesEnum.stage_names.BONNIE_ROOM: return
		if current_room_node.IsBonus: return
		MapMenu.toggle_map()
		get_viewport().set_input_as_handled()
