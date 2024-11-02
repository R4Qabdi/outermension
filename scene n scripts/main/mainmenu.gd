extends Node2D
var iseng = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://scene n scripts/main/portal/portal.tscn")

func _on_option_toggled(toggled_on: bool) -> void:
	if toggled_on:
		$CanvasLayer/option.visible = true
	else :
		$CanvasLayer/option.visible = false
		


func _on_master_volume_value_changed(value: float) -> void:
	pass # Replace with function body.


func _on_mute_toggled(toggled_on: bool) -> void:
	pass # Replace with function body.


func _on_sfx_volume_value_changed(value: float) -> void:
	pass # Replace with function body.


func _on_mutesfx_toggled(toggled_on: bool) -> void:
	pass # Replace with function body.


func _on_music_volume_value_changed(value: float) -> void:
	pass # Replace with function body.


func _on_option_button_item_selected(index: int) -> void:
	pass # Replace with function body.


func _on_check_button_toggled(toggled_on: bool) -> void:
	pass # Replace with function body.


func _on_abouts_toggled(toggled_on: bool) -> void:
	if toggled_on:
		$CanvasLayer/credit.visible = true
		iseng+=1
		if iseng > 10:
			$CanvasLayer/credit/Label.text = "NGAPAIN KOE NJIIRRR BUAT APA NGESPAM???"
	else :
		$CanvasLayer/credit.visible = false
		


func _on_quit_pressed() -> void:
	get_tree().quit()
