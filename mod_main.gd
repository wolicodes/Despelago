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
	install_script_hook_files()


func install_script_extensions() -> void:
	extensions_dir_path = mod_dir_path.path_join("extensions")
	ModLoaderMod.install_script_extension(extensions_dir_path.path_join("Engine/game_manager.gd"))
	ModLoaderMod.install_script_extension(extensions_dir_path.path_join("Engine/achievements/achievements_manager.gd"))
	ModLoaderMod.install_script_extension(extensions_dir_path.path_join("Levels/Components/bonus_light.gd"))
	ModLoaderMod.install_script_extension(extensions_dir_path.path_join("Levels/Components/bonus_collectable.gd"))
	ModLoaderMod.install_script_extension(extensions_dir_path.path_join("Content/cinematic_intro.gd"))
	ModLoaderMod.install_script_extension(extensions_dir_path.path_join("Engine/level_manager.gd"))
	ModLoaderMod.install_script_extension(extensions_dir_path.path_join("Engine/hud_controller.gd"))

func install_script_hook_files() -> void:
	ModLoaderMod.install_script_hooks("res://Engine/room_manager.gd", "res://mods-unpacked/Woli-Despelago/extensions/Engine/room_manager.hooks.gd")

func _ready() -> void:
	ModLoaderLog.info("Ready", DESPELAGO_LOG_NAME)
