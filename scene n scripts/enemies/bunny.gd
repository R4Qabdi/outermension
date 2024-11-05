extends CharacterBody2D

@onready var xp = preload("res://scene n scripts/main/portal/mob.tscn")

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
	var hah = xp.instantiate()
	hah.global_position= global_position
	get_parent().call_deferred("add_child",hah)
	queue_free()
