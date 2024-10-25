extends CharacterBody2D
var is_inrange : bool

func _process(delta: float) -> void:
	if is_inrange:
		if Input.is_action_just_pressed("interact"):
			$"../uicomputer".visible = true
	else :
		pass


func _on_interact_body_entered(body: Node2D) -> void:
	is_inrange = true
	print("is in range")

func _on_interact_body_exited(body: Node2D) -> void:
	is_inrange = false
	print("no komputer")


func _on_exit_pressed() -> void:
	$"../uicomputer".visible = false
	
