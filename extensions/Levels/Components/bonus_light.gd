extends "res://Levels/Components/bonus_light.gd"

func show_light():
	if !collectable.is_collected:
		show()
		$AnimationPlayer.play("appear")
		collectable.enable(true)
		particles.emitting = true
		# MOD remove dialog on first bonnie collectible
		#if collectable.is_first_collectable:
			#collectable.dialog_instance.start()
	else:
		hide()
