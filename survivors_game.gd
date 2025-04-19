extends Node2D

func spawn_mob():
	#create mob instance
	#once loaded, will keep in memory
	var new_mob = preload("res://mob.tscn").instantiate()
	
	#generate random position of mob on PathFollow2D node
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	#add new mob to node tree
	add_child(new_mob)

func _on_timer_timeout():
	spawn_mob()


func _on_player_health_depleted():
	# display end screen and pause game
	%GameOver.visible = true
	get_tree().paused = true
