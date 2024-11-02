extends AnimatedSprite2D

@onready var peluru = preload("res://scene n scripts/senjata/pelurup1.tscn")

func _on_player_tembak() -> void:
	var peler = peluru.instantiate()
	peler.position = global_position
	peler.rotation = global_rotation
	get_parent().get_parent().get_parent().add_child(peler)
	
