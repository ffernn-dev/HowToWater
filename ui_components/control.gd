extends Control

signal value_changed
@export var id := ""


func _on_slider_value_changed(value):
	emit_signal("value_changed", id, value)
