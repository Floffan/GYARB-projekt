extends KinematicBody2D

var velocity = Vector2(0,0)

onready var bar = self #$collision


const SPEED = 20
var can_press = true
var pushing = false

func _push_up():
	pass
	
func get_input():
	if Input.is_action_pressed("Right"):
		pass
		#velocity.y = -SPEED
	if Input.is_action_pressed("Left"):
		pass
		#velocity.y = -SPEED

	#if bar.position.y > 93:
		#bar.position.y = 93
		#velocity.y = 100
	#else:
		#velocity.y = 100
	
	if pushing == true:
		velocity.y = -1000
		#get_parent().get_node("AnimationPlayer").stop()
		get_parent().get_node("AnimationPlayer").play_backwards("Bänk") # MED EN SNABBARE HASTIGHET

	if Input.is_action_pressed("Up") and not pushing and $Detector.is_colliding():
		$Pushtimer.start()
		pushing = true
		
		

func _physics_process(delta):
	get_parent().get_node("AnimationPlayer").play("Bänk")
	#print(bar.position.y)
	get_input()
		
	
	velocity = move_and_slide(velocity)
	
	#if $Detector.is_colliding():
		#print("kolliderar")
		#print("just nu")
	
	
	
func _on_Pushtimer_timeout():
	pushing = false




"""
var speed = 50
var velocity = Vector2()
var can_press = true



func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("Right") and can_press:
		velocity.y -= 1
		speed = 2000
		$Pushtimer.start()
		#yield(get_tree().create_timer(5), "timeout")
		can_press = false
		
	if Input.is_action_pressed("Left"):
		velocity.y -= 1
	if Input.is_action_pressed("Down"):
		velocity.y -= 1
	if Input.is_action_pressed("Up"):
		velocity.y -= 1
	velocity = velocity.normalized() * speed


func _physics_process(delta):
	get_input()
	velocity.y += 1
	velocity = velocity.normalized() * speed
	velocity = move_and_slide(velocity)
	speed = 50

func _ready():
	pass # Replace with function body.

func _on_Pushtimer_timeout():
	#pass
	can_press = true
"""
