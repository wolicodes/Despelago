extends "res://Engine/game_manager.gd"

var ap_save_file_path = "user://ap_save/"

func _ready():
	save_file_path = ap_save_file_path
	super()

func save_game():
	save_file_path = ap_save_file_path
	super()
			
func load_game():
	save_file_path = ap_save_file_path
	super()
		
func clear_save_file():
	save_file_path = ap_save_file_path
	super()
