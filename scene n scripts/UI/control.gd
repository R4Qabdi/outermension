extends CanvasLayer

@onready var joystick = preload("res://scene n scripts/UI/joystickui.tscn")

var settings = {
	"JoystickOn" = true,
	"DebugMode" = true,
	"Mastervolume" = 1.0,
	"Musicvolume" = 1.0,
	"SFXvolume" = 1.0,
}
var temp


func _ready() -> void:
	
	if global.settings["JoystickOn"]:
		#buka_joystick()
		pass
	elif !global.settings["JoystickOn"]:
		tutup_joystick()
	
	$Bardarah.value = 60

func _on_menu_toggled(toggled_on: bool) -> void:
	if toggled_on:
		$MenuLayer.visible = true
		tutup_joystick()

	if !toggled_on:
		$MenuLayer.visible = false
		buka_joystick()

func _on_exit_pressed() -> void:
	$menu.button_pressed = false


func _on_joystick_toggled(toggled_on: bool) -> void:
	if toggled_on: 
		global.settings["JoystickOn"] = true
	if !toggled_on:
		global.settings["JoystickOn"] = false

func buka_joystick() -> void :
	print("bruh")
	if global.settings["JoystickOn"] :
		add_child(joystick.instantiate())

func tutup_joystick() -> void :
	print("bubuh")
	get_tree().paused
	if global.settings["JoystickOn"] :
		$UI.queue_free()

func _on_pcompute_buka() -> void:
	tutup_joystick()

func _on_pcompute_exit_pressed() -> void:
	buka_joystick()

func _on_pcompute_tutup() -> void:
	buka_joystick()


func _on_check_button_2_toggled(toggled_on: bool) -> void:
	if toggled_on:
		$debuglayer.visible = true
	else:
		$debuglayer.visible = false

## VOLUMEEEEEEEE RRRAAHHHHHhhh
func _on_master_volume_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(0, value)
	global.settings["Mastervolume"]=value
func _on_master_mute_toggled(toggled_on: bool) -> void:
	if toggled_on:
		AudioServer.set_bus_mute(0, true)
		$MenuLayer/Panel/TabContainer/Volume/MasterVolume.editable = false
	elif !toggled_on :
		AudioServer.set_bus_mute(0, false)
		$MenuLayer/Panel/TabContainer/Volume/MasterVolume.editable = true

func _on_sfx_volume_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(2, value)
func _on_SFX_mute_toggled(toggled_on: bool) -> void:
	if toggled_on:
		AudioServer.set_bus_mute(2, true)
		$MenuLayer/Panel/TabContainer/Volume/SFXVolume.editable=false
	else :
		AudioServer.set_bus_mute(2, false)
		$MenuLayer/Panel/TabContainer/Volume/SFXVolume.editable=true

func _on_music_volume_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(1, value)
func _on_Music_mute_toggled(toggled_on: bool) -> void:
	if toggled_on:
		AudioServer.set_bus_mute(1, true)
		$MenuLayer/Panel/TabContainer/Volume/MusicVolume.editable=false
	else :
		AudioServer.set_bus_mute(1, false)
		$MenuLayer/Panel/TabContainer/Volume/MusicVolume.editable=true


func _on_option_button_item_selected(index: int) -> void:
	match index:
		0:
			DisplayServer.window_set_size(Vector2i(960,540))
		1:
			DisplayServer.window_set_size(Vector2i(1152,648))
		2:
			DisplayServer.window_set_size(Vector2i(1280,720))
		3:
			DisplayServer.window_set_size(Vector2i(1920,1080))
		4:
			DisplayServer.window_set_size(Vector2i(2560,1080))
		5:
			DisplayServer.window_set_size(Vector2i(2560,1440))


func _on_check_button_toggled(toggled_on: bool) -> void:
	if toggled_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	elif !toggled_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

func _on_exit_2_main_pressed() -> void:
	get_tree().change_scene_to_file("res://scene n scripts/main/mainmenu.tscn")

func _on_exit_2_portal_pressed() -> void:
	get_tree().change_scene_to_file("res://scene n scripts/main/portal/portal.tscn")
