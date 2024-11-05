extends CharacterBody2D

@export var SPEED = 25000

var ada : bool = false
func _ready() -> void:
	ada = false
	$AnimatedSprite2D.play("default") 

func _physics_process(delta: float) -> void:
	var player_pos = $"../player/player".position
	if ada:
		velocity = position.direction_to(player_pos)*SPEED*delta
		$AnimatedSprite2D.play("default") 
		move_and_slide()


func _on_kena_body_entered(body) -> void:
	print("AAAAAAAAAA")
	queue_free()


func _on_detect_body_entered(body: Node2D) -> void:
	print("ada orang")
	ada = true

func _on_detect_body_exited(body: Node2D) -> void:
	print("orangnya hilang")
	ada = false
