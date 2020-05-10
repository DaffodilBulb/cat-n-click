extends Navigation2D

var path = []
export var speed = 300

func _ready():
	set_process_input(true)

func _input(event):
	if event.is_action_pressed("click"):  
		path = get_simple_path($Player/Sprite.get_global_position(), get_global_mouse_position(), true)
		update() 

func _draw():
	for p in path:
        draw_circle(p, 10, Color(1, 1, 1))

func _process(delta):
	var walk_distance = speed * delta 
	move_along_path(walk_distance) 

func move_along_path(distance):
	var last_point = $Player.position
	for index in range(path.size()):
		var distance_between_points = last_point.distance_to(path[0]) 
		if distance <= distance_between_points:
			$Player.position = last_point.linear_interpolate(path[0], distance / distance_between_points)
			break 
		elif distance < 0.0:
			$Player.position = path [0]
			set_process(false)
			break
		distance -= distance_between_points
		last_point = path[0]
		path.remove(0)

