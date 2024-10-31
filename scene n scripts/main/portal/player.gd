extends CharacterBody2D

#@onready var bunny: player = $"../../bunny"d
@onready var mob = preload("res://scene n scripts/main/anim/spawn.tscn")
var darah = 100.0

const SPEED = 300.0
#var kena = false

#func hiting(ambil_darah) -> void:
	#print(darah)
	#darah -= ambil_darah 


func _physics_process(delta: float) -> void:

	#ini pencet r untuk dibug biar mobnya keluar guys
	if Input.is_action_just_pressed("spawn"):
		var ana = mob.instantiate()
		var spawnable = false
		while !spawnable :
			ana.position = Vector2(position.x + randi_range(150, -150),position.y + randi_range(150, -150))
			if true :
				spawnable = true
		get_parent().get_parent().add_child(ana)
	
	#ini sistem buat bisa gerak kemana karakternya
	#nentuin hadapannya juga
	var directionx := Input.get_axis("kiri", "kanan")
	if directionx:
		velocity.x = directionx * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	var directiony = Input.get_axis("naik", "turun")
	if directiony:
		velocity.y = directiony * SPEED
	else:
		velocity.y = move_toward(velocity.x, 0, SPEED)
	
	#ini dipake biar pendek aja nama variabelnya
	#fungsinya beda soalnya makanya aku ganti
	var pex = directionx
	var pey = directiony
	
	#ini baru berfungsi agar animasinya menghadap kemana
	if pey > -0.5 and pey < 0.5 and pex > 0:
		$anim.play("kanan") 
	elif pey > -0.5 and pey < 0.5 and pex < 0:
		$anim.play("kiri")
	elif  pey > 0:
		$anim.play("bawah")
	elif  pey < 0:
		$anim.play("atas")
	 
	#ini berfungsi biar animasinya berhenti
	if pey == 0 and pex == 0:
		$anim.stop()
	
	var overlap_mobs = $sakit.get_overlapping_bodies()
	if overlap_mobs.size() > 0:
		darah -= 01 * overlap_mobs.size() 
		
	$"../../ControlLayer/Bardarah".value = int(darah)
	$"../../ControlLayer/Bardarah/darah".text= str(int(darah)) +"/"+ str(global.player["maksdarah"])
	
	move_and_slide()
