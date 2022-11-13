extends KinematicBody2D

export var speed = 700


var velocity = Vector2()
var direction = ["direction i x-led", "direction i y-led"]

var only_moving_x = false


# ÄNDRING - byt kanske ut only_moving_x systemet mot only_moving_y, så att när karaktären går sydost så spelas höger-animationen och inte nedåt (den är snyggare lol)
func get_input():
	velocity = Vector2()
	var moving_y = false
	if Input.is_action_pressed("Right"):
		velocity.x += 1
		moving_y = false
	if Input.is_action_pressed("Left"):
		velocity.x -= 1
		moving_y = false
	if Input.is_action_pressed("Down"):
		velocity.y += 1
		moving_y = true
		only_moving_x = false
	if Input.is_action_pressed("Up"):
		velocity.y -= 1
		moving_y = true
		only_moving_x = false
	elif velocity.x > 0 and moving_y == false:
		only_moving_x = true
	elif velocity.x < 0 and moving_y == false:
		only_moving_x = true
		
	velocity = velocity.normalized() * speed
	
	
func _assign_direction():
	if velocity.x > 0:
		direction[0] = "right" 
		
	elif velocity.x < 0:	
		direction[0] = "left"

	elif velocity.y > 0:
		direction[1] = "down"
		
	elif velocity.y < 0:
		direction[1] = "up"
		
	_assign_animation(direction)	
		
		
func _assign_animation(direction):
	var animation = "Stå-animation"
	"""
	Höger/Vänster-hantering [x-led]
	"""
	if direction[0] == "right" and only_moving_x:
		#print("går höger")
		$polygons_sidan.scale.x = 1
		$Skelett_sidan.scale.x = 1
		$Skelett_collision.position.x = 74
		
		animation = "Gå-animation"
	if direction[0] == "left" and only_moving_x:
		#print("går vänster")
		$polygons_sidan.scale.x = -1
		$Skelett_sidan.scale.x = -1
		$Skelett_collision.position.x = -74
		
		animation = "Gå-animation"
		
	"""
	Gå-animationen ersätts av en Idle-animation
	"""
	if velocity.x == 0 and only_moving_x:
		animation = "Stå-animation"
	
	"""
	Höger/Vänster-hantering [Nedåt]
	"""
	if direction[1] == "down" and direction[0] == "right" and not only_moving_x: 
		print("går ner")
		$polygons_sidan.scale.x = 0
		$Skelett_sidan.scale.x = 0
		
		$Skelett_fram.position.x = 20
		$polygons_fram.position.x = 20
		
		animation = "Gå-animation_framifrån"
	if direction[1] == "down" and direction[0] == "left" and not only_moving_x:
		#print("går ner")
		$polygons_sidan.scale.x = 0
		$Skelett_sidan.scale.x = 0
		
		$Skelett_fram.position.x = -70
		$polygons_fram.position.x = -70
		
		animation = "Gå-animation_framifrån"
	"""
	Höger/Vänster-hantering [Uppåt]
	"""
	if direction[1] == "uo" and direction[0] == "right" and not only_moving_x: 
		print("går ner")
		$polygons_sidan.scale.x = 0
		$Skelett_sidan.scale.x = 0
		
		$Skelett_fram.position.x = 20
		$polygons_fram.position.x = 20
		
		animation = "Gå-animation_framifrån"
	if direction[1] == "up" and direction[0] == "left" and not only_moving_x:
		#print("går ner")
		$polygons_sidan.scale.x = 0
		$Skelett_sidan.scale.x = 0
		
		$Skelett_fram.position.x = -70
		$polygons_fram.position.x = -70
		
		animation = "Gå-animation_framifrån"
		#animation = "Gå-animation_bakifrån"
	"""
	Gå-animationen ersätts av en Idle-animation
	"""
	if velocity.y == 0 and not only_moving_x:
		animation = "Stå-animation_framifrån"
		
	if $AnimationPlayer.assigned_animation != animation:
		$AnimationPlayer.play(animation)
	

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
	
	_assign_direction()



