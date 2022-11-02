extends Area2D
class_name Coin

onready var state_machine = $AnimationTree.get("parameters/playback")

func _on_body_entered(body):
	state_machine.travel("picked")
	body.addCoins()
