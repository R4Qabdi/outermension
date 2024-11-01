extends CharacterBody2D
signal tembak
#@onready var bunny: player = $"../../bunny"d
@onready var mob = preload("res://scene n scripts/main/anim/spawn.tscn")
var darah : float = 100.0
var hurtable : bool = true
const SPEED : float = 300.0
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
	
	if Input.is_action_just_pressed("serang"):
		$senjata/senjata.play("default")
		emit_signal("tembak")
	if global.settings["JoystickOn"]:
		if get_node_or_null("../../ControlLayer/UI/attack") and get_node_or_null("../../ControlLayer/UI/attack").is_pressed:
			$senjata.rotation = get_node_or_null("../../ControlLayer/UI/attack").output.angle()
			if $senjata/senjata.global_position > position:
				$senjata/senjata.flip_v = false
			else:
				$senjata/senjata.flip_v = true
	get_node_or_null("../../ControlLayer/UI/attack")
	var input_direction = Input.get_vector("kiri", "kanan", "naik", "turun")
	#negative x
	#positive x
	#negative y
	#positive y
	
	velocity = input_direction * SPEED
	#ini dipake biar pendek aja nama variabelnya
	#fungsinya beda soalnya makanya aku ganti
	
	var pex = input_direction.x
	var pey = input_direction.y
	
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
	
	#don't touch this cooldown, it just works
	var overlap_mobs = $sakit.get_overlapping_bodies()
	if overlap_mobs.size() > 0:
		if hurtable:
			darah -= 5 * overlap_mobs.size()
			print("timer stop")
			hurtable=false
			$dmg_cd.start()
		
	$"../../ControlLayer/Bardarah".value = int(darah)
	$"../../ControlLayer/Bardarah/darah".text= str(int(darah)) +"/"+ str(global.player["maksdarah"])
	
	move_and_slide()
	

func _on_timer_timeout() -> void:
	#darah -= 5 
	hurtable = true
