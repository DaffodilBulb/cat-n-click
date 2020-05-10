extends Node2D

var start = Vector2()
var target = Vector2()
var path = []
var path_points = 0
var motion = Vector2() 

export var vitesse = 300
export var nav_stop_treshold = 5

func _ready():
    _input(true)
    set_process(true)

func _input(event):
	if event.is_action_pressed("click"):  
 		target = get_global_mouse_position()
		start = $Player.get_global_position() 


func set_process(delta):
	navigate()

func navigate():
	var distance_to_destination = position.distance_to(path) 
	target = path
	if distance_to_destination > nav_stop_treshold:
		move()

	
func move():
	motion = ($Player.global_position).normalized() * (vitesse)
	if $Player.is_on_wall():
		make_path() 
	$Player.move_and_slide(motion) 

func make_path():
	path = $TextureRect/FloorArea/Navigation2D.get_simple_path(start, target,  true) 


