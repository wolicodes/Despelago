extends "res://Levels/Components/bonus_collectable.gd"

func pickup():
	enable(false)
	$SFX.play()
	$CollectedParticles.emitting = true
	is_pickedup = true
	# MOD remove dialog on first bonnie collectible
	#if is_first_collectable:
		#dialog_instance.next()
	collectable_icon_instance = collectable_icon_scene.instantiate()
	level.player.add_child(collectable_icon_instance)
	collectable_icon_instance.setup(is_first_collectable)

# MOD dont register the collectible when collected and dont
# show a notification for it
func collect():
	is_collected = true
	collectable_icon_instance.queue_free()
	#game_manager.add_collectable(id)
	#level.hud.show_collectable_notification(is_first_collectable)
