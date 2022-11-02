extends Node2D

onready var player = $Player
onready var boss = $Boss
var lejos = false


func _physics_process(_delta):

	var monedas = player.get_coins()
	var saludPlayer = player.get_health()
	#print((player.position - boss.position).length())
	#print("Monedas: {monedas}" )
	player.setCoins(0)
	print("Monedas: " + str(monedas))
	if (player.position - boss.position).length() < 200 :
		if not boss._state == boss.State.mueto:
			boss.attack()
			print("Salud: " +str(saludPlayer))
	if lejos:		
		if(player.position - boss.position).length() < 290:
			lejos=false
	if lejos == false:		
		if (player.position - boss.position).length() > 300:
			boss.set_velocity(-1)
			lejos=true
		
	
	
	
	
