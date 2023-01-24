extends KinematicBody2D

const speed = 200

func _process(delta):  # this is a inbuilt function that will be called everytime a frame is drawn
	
	var velocity = Vector2.ZERO
	
	 # if the left key is pressed then this line is going to return true
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
		
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
		
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	# This is going to apply all the player inputs to the main character
	move_and_slide(velocity.normalized() * speed)
	player_animation(velocity)
	
#we  to make sure that our vector is normalized
	
func player_animation(velocity):
	
	if velocity.y > 0:
		$"AnimatedSprite".play('walk_down')
	elif velocity.y < 0:
		$"AnimatedSprite".play("walk_up")
	elif velocity.x != 0:
		$"AnimatedSprite".play("walk_side")
		$"AnimatedSprite".flip_h = velocity.x > 0
	
	else:
		$"AnimatedSprite".stop()
		$"AnimatedSprite".frame = 0 # just to go back to the neutral position when the player stops
		
