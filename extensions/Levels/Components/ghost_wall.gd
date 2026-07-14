extends "res://Levels/Components/ghost_wall.gd"

@onready var static_body = $Collision/StaticBody2D

var ghost_walls = GameManager.Unlockable.GHOST_WALLS

# MOD make ghost walls unpassable until unlocked
func _ready():
	super()
	GameManager.ability_unlocked.connect(on_ability_unlocked)
	if not GameManager.is_unlocked(ghost_walls):
		# Collision layer 7 allows the player to dash through
		# (special for ghost walls)
		# Collision layer 1 is just regular walls, so we disable
		# layer 7 and use layer 1 if the ability isn't unlocked
		static_body.set_collision_layer_value(1, true)
		static_body.set_collision_layer_value(7, false)

func on_ability_unlocked(which):
	if which == ghost_walls:
		static_body.set_collision_layer_value(1, false)
		static_body.set_collision_layer_value(7, true)
