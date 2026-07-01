extends "res://Levels/Components/bonus_collectable.gd"

func pickup():
	# Visual feedback
	enable(false)
	$SFX.play()
	$CollectedParticles.emitting = true
	is_pickedup = true
	
	# Add floating icon
	collectable_icon_instance = collectable_icon_scene.instantiate()
	level.player.add_child(collectable_icon_instance)
	collectable_icon_instance.setup(is_first_collectable)
