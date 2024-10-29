extends CharacterBody2D

signal hit
const SPEED = 100


func _physics_process(delta: float) -> void:
	var player_pos = $"../player/player".position
	velocity = position.direction_to(player_pos)*SPEED
	$AnimatedSprite2D.play("default")
	move_and_slide()

func _on_kena_body_entered(body: Node2D) -> void:
	#mati kau
	hit.emit()
