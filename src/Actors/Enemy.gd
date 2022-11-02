extends Actor
class_name Enemy

onready var platform_detector = $PlatformDetector
onready var floor_detector_left = $FloorDetectorLeft
onready var floor_detector_right = $FloorDetectorRight
onready var state_machine = $AnimationTree.get("parameters/playback")
onready var explode = $Explode


enum State {caminando, mueto}

var _state = State.caminando

func _ready():
	_velocity.x = speed.x


func _physics_process(_delta):
	_velocity = calculate_move_velocity(_velocity)

	
	_velocity.y = move_and_slide(_velocity, FLOOR_NORMAL).y

	
	$Sprite.scale.x = 1 if _velocity.x > 0 else -1

	var animation = _cambiar_animacion()
	
	state_machine.travel(animation)
		
func destroy():
	_state = State.mueto
	_velocity = Vector2.ZERO
	explode.play()
	

func calculate_move_velocity(linear_velocity):
	var velocity = linear_velocity

	if not floor_detector_left.is_colliding():
		velocity.x = speed.x
	elif not floor_detector_right.is_colliding():
		velocity.x = -speed.x
	if is_on_wall():
		velocity.x *= -1
	return velocity

func _cambiar_animacion():
	var animation_new = ""
	if _state == State.caminando:
		animation_new = "walk" if abs(_velocity.x) > 0 else "idle"
	else:
		animation_new = "destroy"
	return animation_new
