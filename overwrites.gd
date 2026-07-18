extends Node


var vanilla_file_paths: Array[String] = [
	"res://Art/Sprites/Collectables/collectable_bone.png",
	"res://Art/Sprites/Collectables/collectable_skull.png",
	"res://Art/Sprites/Collectables/collectable_icon_bone.png",
	"res://Art/Sprites/Collectables/collectable_icon_skull.png"
]
var overwrite_file_paths: Array[String] = [
	"res://mods-unpacked/Woli-Despelago/overwrites/Art/Sprites/Collectables/collectable_bone.png",
	"res://mods-unpacked/Woli-Despelago/overwrites/Art/Sprites/Collectables/collectable_skull.png",
	"res://mods-unpacked/Woli-Despelago/overwrites/Art/Sprites/Collectables/collectable_icon_bone.png",
	"res://mods-unpacked/Woli-Despelago/overwrites/Art/Sprites/Collectables/collectable_icon_skull.png"
]

var overwrite_resources := []


func _init():
	for i in overwrite_file_paths.size():
		var vanilla_path := vanilla_file_paths[i]
		var overwrite_path := overwrite_file_paths[i]

		var overwrite_resource := load(overwrite_path)
		overwrite_resources.push_back(overwrite_resource)
		overwrite_resource.take_over_path(vanilla_path)
