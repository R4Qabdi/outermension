extends AnimatedSprite2D

@export var damage = 10

func _enter_tree() -> void:
	play("default")
	
func _process(delta: float) -> void:
	var direction = Vector2(1,0).rotated(rotation)
	position += direction * 600 * delta
	

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.has_method("take_damage"):
		body.take_damage(damage)
	queue_free()


func _on_timer_timeout() -> void:
	queue_free()
