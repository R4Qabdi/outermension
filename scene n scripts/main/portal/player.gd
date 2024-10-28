extends CharacterBody2D


@onready var mob = preload("res://scene n scripts/main/anim/spawn.tscn")


const SPEED = 300.0

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("spawn"):
		var ana = mob.instantiate()
		var spawnable = false
		while !spawnable :
			ana.position = Vector2(position.x + randi_range(150, -150),position.y + randi_range(150, -150))
			if true :
				spawnable = true
		get_parent().get_parent().add_child(ana)
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("kiri", "kanan")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	direction = Input.get_axis("naik", "turun")
	if direction:
		velocity.y = direction * SPEED
	else:
		velocity.y = move_toward(velocity.x, 0, SPEED)
	
	var pex = velocity.x
	var pey = velocity.y
	
	if pex > 0:
		$anim.play("kanan")
	elif pex < 0:
		$anim.play("kiri")
	if pey > 0:
		$anim.play("bawah")
	elif pey < 0:
		$anim.play("atas")
	
	if pey==0&&pex==0:
		$anim.stop()
	
	move_and_slide()
