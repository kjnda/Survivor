extends CharacterBody2D

signal health_depleted

var health = 100.0

func _physics_process(delta):
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * 600 #pixels/sec
	move_and_slide()
	
	if velocity.length() > 0.0:
		%HappyBoo.play_walk_animation()
		# can also use $HappyBoo
		# or get_node("HappyBoo") when not 'access as unique name'
	else:
		%HappyBoo.play_idle_animation()

#amount of damage per enemy per second
	const DAMAGE_RATE = 5.0
	var overlapping_mobs = %HurtBox.get_overlapping_bodies()

	if overlapping_mobs.size() > 0:
		health -= DAMAGE_RATE * overlapping_mobs.size() * delta
		%ProgressBar.value = health
		if health <= 0.0:
			#emit end signal, as player died
			#breakpoint
			health_depleted.emit()
