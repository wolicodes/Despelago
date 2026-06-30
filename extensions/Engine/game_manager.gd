extends "res://Engine/game_manager.gd"

var ap_save_file_path = "user://ap_save/"

func _ready():
	save_file_path = ap_save_file_path
	super()
	
func create_save_file():
	super()
	first_map_part_unlocked = true
	first_half_map_part_unlocked =	true 
	second_half_map_part_unlocked =	true 

func save_game():
	save_file_path = ap_save_file_path
	super()
			
func load_game():
	save_file_path = ap_save_file_path
	super()
		
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
	super()
