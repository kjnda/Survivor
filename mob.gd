extends CharacterBody2D

var health = 2 # how many hits before dying

# wait for engine to load all nodes in game, otherwise player wont be available
#var player 
#func _ready():
#	player = get_node("/root/Game/Player")

#easier syntax:
@onready var player = get_node("/root/Game/Player")

func _ready():
	#calls when mob is created
	# Slime access as unique name
	%Slime.play_walk()


func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 300.0
	move_and_slide()

func take_damage():
	# subtract 1 from health var
	health -= 1
	%Slime.play_hurt()
	
	if health == 0:
		#release mob object if hit healh var == 0
		queue_free()

	#add instance and deal with deleting mob and not deleting smoke
	const SMOKE_SCENE = preload("res://smoke_explosion/smoke_explosion.tscn")
	var smoke = SMOKE_SCENE.instantiate()
	get_parent().add_child(smoke)
	# setting smoke position to position of mob death
	smoke.global_position = global_position
