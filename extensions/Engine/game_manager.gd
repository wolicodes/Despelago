extends "res://Engine/game_manager.gd"

# MOD define unlockables + a signal to have the items react immediately when unlocked
# without needing a reload
enum Unlockable { SINGLE_KEYS, DOUBLE_KEYS, GHOST_SWITCHES, GHOST_WALLS, CHANDELIERS }
signal ability_unlocked(which: Unlockable)

var unlocked := {}

# MOD use a different path for save files
var ap_save_file_path = "user://ap_save/"

func _ready():
	debug_mode_on = true
	save_file_path = ap_save_file_path
	Console.add_command("skey", unlock_single_keys)
	Console.add_command("dkey", unlock_double_keys)
	Console.add_command("eye", unlock_ghost_switches)
	Console.add_command("wall", unlock_ghost_walls)
	Console.add_command("chand", unlock_chandeliers)
	super()
	
func unlock_single_keys():    unlock_ability(Unlockable.SINGLE_KEYS)
func unlock_double_keys():    unlock_ability(Unlockable.DOUBLE_KEYS)
func unlock_ghost_switches(): unlock_ability(Unlockable.GHOST_SWITCHES)
func unlock_ghost_walls():    unlock_ability(Unlockable.GHOST_WALLS)
func unlock_chandeliers():    unlock_ability(Unlockable.CHANDELIERS)

func unlock_ability(which: Unlockable):
	if unlocked.get(which, false):
		return
	unlocked[which] = true
	ability_unlocked.emit(which)
	
func is_unlocked(which: Unlockable) -> bool:
	return unlocked.get(which, false)
	
func create_save_file():
	super()
	# MOD remove the map tutorials
	first_map_part_unlocked = true
	first_half_map_part_unlocked =	true
	second_half_map_part_unlocked =	true
	# MOD unlock all the stages
	var current_stages_data = StageManager.get_current_stages_data()
	for stage in current_stages_data.stages:
		stage.unlocked = true
		stage.necessary_zones = []

func save_game():
	save_file_path = ap_save_file_path
	super()
			
func load_game():
	save_file_path = ap_save_file_path
	super()

# MOD also use the modified save path when clearing the save file on new game
func clear_save_file():
	if ResourceLoader.exists(ap_save_file_path + save_file_name):
		print("resetting save file")
		var abs_path = OS.get_user_data_dir() + "/ap_save/" + save_file_name
		var error = DirAccess.remove_absolute(abs_path)
		if error != OK:
			print("[GM] FAIL: clear save file")
		else:
			create_statistics_file()
			create_save_file()
	else:
		create_statistics_file()
		create_save_file()

func create_statistics_file():
	save_file_path = ap_save_file_path
	super()
	
func has_statistics_file():
	save_file_path = ap_save_file_path
	return super()
