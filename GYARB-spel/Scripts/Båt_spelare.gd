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

func _on_Island_shape_body_entered(body: Node) -> void:
	pass
