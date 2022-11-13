extends Node2D

signal gym_exited

var level_begun = false


func _on_Utgng_body_entered(body):
	#print("hallå")
	if level_begun == true:
		Autoloads.Position = "gym"
		Transition.load_scene("res://Scenes/World.tscn")


func _on_Utgng_body_exited(body):
	level_begun = true





func _on_Squattande_groda_shape_body_entered(body):
	pass # Replace with function body.
	#Dialog ska poppa upp
