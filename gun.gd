extends Area2D

func _physics_process(delta):
	#checking enemies in range, returned as an array
	var enemies_in_range = get_overlapping_bodies()
	
	if enemies_in_range.size() > 0:
		
		#calling first member of array and setting as target
		var target_enemy = enemies_in_range.front()
		
		#could also use:
		#var target_enemy = enemies_in_range[0]
		
		look_at(target_enemy.global_position)

func shoot():
	#create new copies of bullet
	#load() - loads on demand
	#preload() - loads on launch of game
	const BULLET = preload("res://bullet.tscn")
	#create new instance of bullet scene
	var new_bullet = BULLET.instantiate()
	
	#place bullet at shooting point
	#ShootingPoint access as unique name
	new_bullet.global_position = %ShootingPoint.global_position
	new_bullet.global_rotation = %ShootingPoint.global_rotation
	%ShootingPoint.add_child(new_bullet)
	
#after adding timer node and setting wait time and enable autostart
func _on_timer_timeout() -> void:
	shoot()
