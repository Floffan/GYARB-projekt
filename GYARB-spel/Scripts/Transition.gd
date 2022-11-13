extends CanvasLayer

signal scene_changed()

onready var animation_player = $AnimationPlayer



func load_scene(path):
	animation_player.play("Fade")
	yield(animation_player, "animation_finished")
	get_tree().change_scene(path)
	animation_player.play_backwards("Fade")
	

#func change_scene(path, delay = 0.5):
	#yield(get_tree().create_timer(delay), "timeout")
	#animation_player.play("Fade")
	#yield(animation_player, "animation_finished")
	#get_tree().change_scene(path)
	
	
