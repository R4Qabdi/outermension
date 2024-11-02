extends CanvasLayer


func _on_attack_mouse_entered() -> void:
	global.injoy = true

func _on_attack_mouse_exited() -> void:
	global.injoy = false


func _on_interact_pressed() -> void:
	Input.action_press("interact")
	Input.action_release("interact")
	print("waaaaaaa")
