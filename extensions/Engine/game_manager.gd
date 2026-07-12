extends "res://Engine/game_manager.gd"

# MOD use a different path for save files
var ap_save_file_path = "user://ap_save/"
signal single_keys_unlocked

func _ready():
	save_file_path = ap_save_file_path
	Console.add_command("skey", unlock_single_keys)
	super()
	
func unlock_single_keys():
	single_keys_unlocked.emit()
	
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
