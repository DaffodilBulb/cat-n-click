extends KinematicBody2D

export var speed = 300
var is_in_FloorArea = true 
var path = PoolVector2Array()

#var target = Vector2()
#var velocity = Vector2()

#func _ready():
#	target = global_position

#func _input(event):
#	if event.is_action_pressed("click"):  
# 		target = get_global_mouse_position()
#
#
#func _physics_process(delta):
#	velocity = (target - position).normalized() * speed
#   #  rotation = velocity.angle()
#	if (target - position).length() > 5:
#		velocity = move_and_slide(velocity)




