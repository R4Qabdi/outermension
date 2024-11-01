extends CharacterBody2D


signal hit
signal gakena
const BSPEED = 100

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
	
	
	#if hited :
		#print("bnuyy = "+str(darah))
		#hiting(0.1)
	
#
#func _on_kena_body_entered(body: Node2D) -> void:
	#hited = true
	#print("hit")
#
#
#func _on_kena_body_exited(body: Node2D) -> void:
	#hited = false
	#print("nohit")
