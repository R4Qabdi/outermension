extends CanvasLayer


func _on_tryagain_pressed() -> void:
	get_tree().change_scene_to_file("res://scene n scripts/dimen1/hills.tscn")


func _on_giveup_pressed() -> void:
	get_tree().change_scene_to_file("res://scene n scripts/main/portal/portal.tscn")
