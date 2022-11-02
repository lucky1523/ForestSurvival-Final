extends Control


onready var resume_button = $VBoxContainer/ResumeButton


func _ready():
	visible = false


func open():
	visible = true
	resume_button.grab_focus()


func close():
	visible = false


func _on_ResumeButton_pressed():
	get_tree().paused = false
	visible = false

func _on_ResetButton_pressed():
	var tree = get_tree()
	tree.paused = not tree.paused
	get_tree().reload_current_scene()

func _on_QuitButton_pressed():
	get_tree().quit()


