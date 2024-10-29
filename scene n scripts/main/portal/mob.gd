extends CharacterBody2D

@export var SPEED = 100

#extends CharacterBody2D
#
#
#const SPEED = 100.0


func _physics_process(delta: float) -> void:
	var player_pos = $"../player/player".position
	velocity = position.direction_to(player_pos)*SPEED
	if velocity.x > 0:
		$AnimatedSprite2D.flip_h = false
	else :
		$AnimatedSprite2D.flip_h = true
		
	$AnimatedSprite2D.play("default") 
	move_and_slide()


func _on_kena_body_entered(body) -> void:
	print("AAAAAAAAAA")
	queue_free()
