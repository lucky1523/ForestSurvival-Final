
extends Node
onready var pause_menu = $InterfaceLayer/PauseMenu
onready var player = $Level/Player
onready var healthBar= $InterfaceLayer/Control/HealthBar
onready var label=$InterfaceLayer/Control/Label
func _physics_process(_delta):
	healthBar.value = player.get_health()
	label.text = ":"+ str(player.get_coins())
func _input(event: InputEvent):
	
	if event.is_action_pressed("toggle_fullscreen"):
		OS.window_fullscreen = not OS.window_fullscreen
		get_tree().set_input_as_handled()

	elif event.is_action_pressed("toggle_pause"):
		var tree = get_tree()
		tree.paused = not tree.paused
		if tree.paused:
			pause_menu.open()
		else:
			pause_menu.close()
		get_tree().set_input_as_handled()
		
