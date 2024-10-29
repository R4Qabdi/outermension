extends Area2D

@onready var xp = preload("res://scene n scripts/main/portal/mob.tscn")
@onready var bunny = preload("res://scene n scripts/enemies/bunny.tscn")
var apa : String

func _ready() -> void:
	$anim.play("default")

func _on_anim_animation_finished() -> void:
	apa = "bunny"
	match apa:
		"xp":
			var ene = xp.instantiate()
			ene.position = position
			get_parent().add_child(ene)
		"bunny":
			var ene = bunny.instantiate()
			ene.position = position
			get_parent().add_child(ene)
	queue_free()


func _on_body_entered(body: Node2D) -> void:
	pass
	
