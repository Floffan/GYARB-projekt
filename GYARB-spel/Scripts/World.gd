extends Node2D
var skelett_position = Autoloads.Position

var level_begun = false

func _ready():
	_get_position()
	#$Skelett.position = Autoloads.Position
	
	
func _get_position() -> void:
	if skelett_position == "spawn":
		$Skelett.position = $Spawn.position
	if skelett_position == "gym":
		$Skelett.position = $Gym.position
	


func _on_Area2D_body_exited(body):
	level_begun = true


func _on_Area2D_body_entered(body):
	if level_begun == true:
		print("gått in i...")
		Transition.load_scene("res://Scenes/Level 2.tscn")
