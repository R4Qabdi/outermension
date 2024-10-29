extends CharacterBody2D
@onready var is_inrange = false
signal buka 
signal tutup
var tog = true
func _process(delta: float) -> void:
	if is_inrange:
		if Input.is_action_just_pressed("interact"):
			if tog:
				$"../uicomputer".visible = true
				buka.emit()
				tog = not tog
			elif !tog: 
				tog = not tog
				_on_exit_pressed()
				tutup.emit()
	else :
		pass


func _on_interact_body_entered(body: Node2D) -> void:
	is_inrange = true
	print("is in range")

func _on_interact_body_exited(body: Node2D) -> void:
	is_inrange = false
	print("no komputer")


func _on_exit_pressed() -> void:
	tog = true
	$"../uicomputer".visible = false
	
