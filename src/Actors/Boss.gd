extends Actor
class_name Boss
var dead = false
var health = 100
var modo_mad = false
onready var state_machine = $AnimationTree.get("parameters/playback")
onready var attackAnimation = $AttackAnimation
enum State {caminando, mueto, atacando, hit}

var _state = State.caminando
func get_health():
	return health
func attack():
	_state = State.atacando
	attackAnimation.start()
func isDead():
	return dead
	
func set_velocity(vel):
	_velocity.x*=vel
	

func _ready():
	_velocity.x = speed.x


func _physics_process(_delta):
	
	#print(_velocity)
	_velocity = calculate_move_velocity(_velocity)
	_velocity.y = move_and_slide(_velocity, FLOOR_NORMAL).y

	
	$Sprite.scale.x = -1 if _velocity.x > 0 else 1

	var animation = _cambiar_animacion()
	
	state_machine.travel(animation)
	if health <= 20:
		$Sprite.texture = load("res://assets/art/boss/boss_sheet_mad.png")
		if not modo_mad:
			_velocity.x = 500
			modo_mad = true
			$ModoLoco.play()
			
func destroy():
	health-=5
	_state= State.hit
	
	if health <=0:
		_state = State.mueto
		dead = true
		_velocity = Vector2.ZERO
		$Death.play()

	

func calculate_move_velocity(linear_velocity):
	var velocity = linear_velocity
	if is_on_wall():
		velocity.x *= -1
	return velocity

func _cambiar_animacion():
	var animation_new = ""
	if _state == State.caminando:
		animation_new = "walk" if abs(_velocity.x) > 0 else "idle"
	elif _state == State.atacando:
		animation_new = "attack"
		_state = State.caminando
	elif _state == State.hit:
		animation_new = "hit"
		_state = State.caminando
	else:
		animation_new = "death"
	return animation_new
	
func victory_screen():
	get_tree().change_scene("res://src/UserInterface/VictoryMenu.tscn")

