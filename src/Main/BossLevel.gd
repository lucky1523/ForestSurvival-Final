extends Node
onready var pause_menu = $InterfaceLayer/PauseMenu
onready var player = $BossFight/Player
onready var boss = $BossFight/Boss
onready var healthBar= $InterfaceLayer/Control/HealthBar
onready var bossHealthBar= $InterfaceLayer/BossHealthBar/BossHealth

func _physics_process(_delta):
	healthBar.value = player.get_health()
	bossHealthBar.value = boss.get_health()
	
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
		
