extends "res://Levels/Components/bonus_light.gd"

func show_light():
	if !collectable.is_collected:
		show()
		$AnimationPlayer.play("appear")
		collectable.enable(true)
		particles.emitting = true
	else:
		hide()
