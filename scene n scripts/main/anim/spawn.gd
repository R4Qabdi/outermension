extends Area2D

@onready var enemy = preload("res://scene n scripts/main/portal/mob.tscn")

func _ready() -> void:
	$anim.play("default")

func _on_anim_animation_finished() -> void:
	var ene = enemy.instantiate()
	ene.position = position
	get_parent().add_child(ene)
	queue_free()


func _on_body_entered(body: Node2D) -> void:
	pass
	
