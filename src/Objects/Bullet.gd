extends RigidBody2D

onready var state_machine = $AnimationTree.get("parameters/playback")

func destroy():
	state_machine.travel("destroy")

func _on_body_entered(body):
	if body is Enemy or body is Boss:
		body.destroy()
		
	else:
		destroy()
