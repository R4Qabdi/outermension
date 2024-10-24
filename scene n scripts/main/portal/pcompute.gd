extends CharacterBody2D

var current_state = IDLE

var dir = Vector2.RIGHT
var start_pos 
var is_interact = false

var player
var player_in

enum{
	IDLE,
	NEW_DIR,
	MOVE
}

func _ready() -> void:
	randomize()
	start_pos = position
	
func _process(delta: float) -> void:
	if current_state == 0 or current_state == 1:
		pass
	elif current_state == 2 and !is_interact :
		pass


func _on_interact_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		player = body
		player_in = true
		print(player_in)

func _on_interact_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		player_in = false
		print(player_in)
