extends CanvasLayer

var settings = {
	"JoystickOn" : true,
	"volume" : 1
}
var temp

func _ready() -> void:
	$"UI/move".visible = global.settings["JoystickOn"]
	$"UI/attack".visible = global.settings["JoystickOn"]

func _on_menu_toggled(toggled_on: bool) -> void:
	if toggled_on:
		$MenuLayer.visible = true
	if !toggled_on:
		$MenuLayer.visible = false

func _on_h_slider_value_changed(value: float) -> void:
	pass # Replace with function body.

func _on_check_button_toggled(toggled_on: bool) -> void:
	if toggled_on: 
		global.settings["JoystickOn"] = true
		$"UI/move".visible = global.settings["JoystickOn"]
		$"UI/attack".visible = global.settings["JoystickOn"]
		
	if !toggled_on:
		global.settings["JoystickOn"] = false
		$"UI/move".visible = global.settings["JoystickOn"]
		$"UI/attack".visible = global.settings["JoystickOn"]

func _on_exit_pressed() -> void:
	$menu.button_pressed = false
