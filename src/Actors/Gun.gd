extends Position2D
class_name Gun

onready var sound_shoot = $Shoot

const Bullet = preload("res://src/Objects/Bullet.tscn")
const BULLET_VELOCITY = 1000.0

func shoot(direction = 1):
	if not $Cooldown.is_stopped():
		return false
	var bullet = Bullet.instance()
	bullet.global_position = global_position
	bullet.linear_velocity = Vector2(direction * BULLET_VELOCITY, 0)

	bullet.set_as_toplevel(true)
	add_child(bullet)
	sound_shoot.play()
	return true
