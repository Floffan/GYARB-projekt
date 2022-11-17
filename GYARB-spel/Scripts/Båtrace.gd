extends Node2D

func _process(delta: float) -> void:
	$Havet/Lager1.motion_offset.x += -50*delta

#func _process(delta: float) -> void:
	#$Lager 1.motion_offset.x += 10*delta
	#layer2.motion_offset.x += 20*delta
	#layer3.motion_offset.x += 30*delta
	
	
	
	
	
	
#detta kallas för en eklen state machine
#enum måsvinge IDLE, AIR

#physics process:
	#match state:
		#IDLE:
			#_idle_state()
			
			
#return tar mig ur funktionen på en gång
