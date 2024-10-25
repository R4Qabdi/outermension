extends CharacterBody2D


const SPEED = 300.0

func _physics_process(delta: float) -> void:
	# Add the gravity.
	#if not is_on_floor():
		#velocity += get_gravity() * delta

	# Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY

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
