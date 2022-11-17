extends KinematicBody2D

export (int) var speed = 600
export (float) var rotation_speed = 3

var velocity = Vector2()
var rotation_dir = 0

func get_input():
	rotation_dir = 0
	velocity = Vector2()
	if Input.is_action_pressed("Right"):
		rotation_dir += 1
	if Input.is_action_pressed("Left"):
		rotation_dir -= 1
	if Input.is_action_pressed("Boost"):
		velocity = Vector2(speed, 0).rotated(rotation)

func _physics_process(delta):
	get_input()
	rotation += rotation_dir * rotation_speed * delta
	velocity = move_and_slide(velocity)


"""
#var speed = 0
var speed = 700
var direction := Vector2.RIGHT


var velocity = Vector2()

func _get_input():
	velocity = Vector2()
	var moving_y = false
	if Input.is_action_pressed("Right"):
		velocity.x += 1
	if Input.is_action_pressed("Left"):
		velocity.x -= 1
	if Input.is_action_pressed("Down"):
		velocity.y += 1
	if Input.is_action_pressed("Up"):
		velocity.y -= 1
	#elif Input.is_action_pressed("Boost"):
		#speed = 700
	#else:
		#speed = 0

	velocity = velocity.normalized() * speed
	
func _rotate_boat():
	pass
	#var desired_rotation = (get_global_mouse_position() - global_position).angle()
	
	#rotation = lerp_angle(rotation, desired_rotation, 1)
	
func _physics_process(delta):
	_get_input()
	_rotate_boat()
	velocity = move_and_slide(velocity)

"""
