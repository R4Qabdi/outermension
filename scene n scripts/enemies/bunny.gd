extends CharacterBody2D


signal hit
signal gakena
const BSPEED = 100

@export var health = 10
#var Player = player.new()
var hited : bool = false

func _physics_process(delta: float) -> void:
	var player_pos = $"../player/player".position
	velocity = position.direction_to(player_pos)*BSPEED
	if velocity.x > 0:
		$AnimatedSprite2D.flip_h=false
	elif velocity.x < 0:
		$AnimatedSprite2D.flip_h=true
	$AnimatedSprite2D.play("default")
	move_and_slide()
	

func take_damage(amount):
	health -= amount
	if health <= 0:
		mati()

func mati():
	queue_free()
