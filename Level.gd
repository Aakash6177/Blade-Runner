extends Node


const CAR = preload("res://Car/Car.tscn")


func _ready():
	$"CanvasLayer/Label".text = "Score: "+ str(Global.score)

func car_spwan(start_pos):
	
	
	
	var car_obj = CAR.instance() # creates the instance of the preloaded scene
	var car_start_node_name = "StartPositions/CarStart" + str(start_pos)
	
	
	car_obj.position = get_node(car_start_node_name).position # this gives you the position of the postion2d node
	#add_child(car_obj)	# adding the instance to the node tree
	$"YSort".add_child(car_obj)
		
	var car_timer_node_name = "CarTimers/Timer"+str(start_pos)
	var wait_time = rand_range(1,3)
	get_node(car_timer_node_name).wait_time = wait_time
	
	print(car_timer_node_name)

func current_score(score):
	var current_score = score

func _process(delta):
	if $"Player".position.y <= -225:
		Global.score += 1
		$"WinSound".play()
		$"Player".position = $"PlayerPosition".position
		$"CanvasLayer/Label".text = "Score: " + str(Global.score)
		

func _on_Timer1_timeout():	car_spwan(1)
func _on_Timer2_timeout():	car_spwan(2)
func _on_Timer3_timeout():	car_spwan(3)
func _on_Timer4_timeout():	car_spwan(4)
func _on_Timer5_timeout():	car_spwan(5)
