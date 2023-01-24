extends Area2D

const CAR_LIST = ['Grey1', 'Grey2', 'Yellow1', 'Yellow2']

var car_speed = 250
var direction = 1

func _ready():
	
	randomize()
	var current_car = randi() % CAR_LIST.size() #selects a random number from 0 - 4
	print(current_car)
	
	# instead of play we can also use the animation and pass in the string of the current car
	
	$'AnimatedSprite'.play(CAR_LIST[current_car])
	car_speed = rand_range(220, 280)
	
	
	#$'AnimatedSprite'.animation(CAR_LIST[current_car])
	
	if position.x < 0:
		direction = -1 # flips the dorection of car
		$'AnimatedSprite'.flip_h = true # this flips the sprtie in the other direction
	else:
		direction = 1

func _process(delta):
	position.x -= car_speed * delta * direction # regulate the framerate on different machines
	
	



func _on_Car_body_entered(body):
	print("collision")
	get_tree().change_scene("res://Game Screen/GameScreen.tscn")
	
