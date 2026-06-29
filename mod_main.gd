extends Node

const DESPELAGO_MOD_DIR := "Woli-Despelago"
const DESPELAGO_LOG_NAME := "Woli-Despelago:Main"

var mod_dir_path := ""
var extensions_dir_path := ""
var translations_dir_path := ""


func _init() -> void:
	ModLoaderLog.info("Init", DESPELAGO_LOG_NAME)
	mod_dir_path = ModLoaderMod.get_unpacked_dir().path_join(DESPELAGO_MOD_DIR)
	install_script_extensions()


func install_script_extensions() -> void:
	extensions_dir_path = mod_dir_path.path_join("extensions")
	
	# Use a different save file location for AP
	ModLoaderMod.install_script_extension(extensions_dir_path.path_join("Engine/game_manager.gd"))
	
	# Disable achievements
	ModLoaderMod.install_script_extension(extensions_dir_path.path_join("Engine/achievements/achievements_manager.gd"))


func _ready() -> void:
	ModLoaderLog.info("Ready", DESPELAGO_LOG_NAME)
