extends Area2D

var travelled_distance = 0

func _physics_process(delta):
	const SPEED = 1000 #pixels
	const RANGE = 1200 #pixels
	
	#handles bullet moving
	var direction = Vector2.RIGHT.rotated(rotation)
	# delta is applied automatically with move_and_slide()
	position += direction * SPEED * delta #pixel/s

	travelled_distance += SPEED * delta
	#release bullet object after travelling 1200 pixels, otherwise death
	if travelled_distance > RANGE:
		queue_free()


func _on_body_entered(body):
	#destroy bullet after body enter
	queue_free()
	#duck_typing
	if body.has_method("take_damage"):
		body.take_damage()
