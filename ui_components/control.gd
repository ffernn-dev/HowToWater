extends Control

signal value_changed
@export var id := ""


func _on_slider_value_changed(value):
	emit_signal("value_changed", id, value)


func _on_check_box_toggled(button_pressed):
	emit_signal("value_changed", id, button_pressed)
