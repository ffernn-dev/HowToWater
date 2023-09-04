extends Node3D

@onready var ui = $UI
@onready var water = $Water

@onready var water_shader = water.get_surface_override_material(0)

func set_shader_value(id: String, value: float):
	water_shader.set("shader_parameter/" + id, value)

func _ready():
	var data : Array[Dictionary] = [
		{"type": "slider", "name": "Amplitude", "id": "amplitude", "min": 0.0, "max": 3.0, "default": 1.0},
		{"type": "slider", "name": "Frequency", "id": "frequency", "min": 0.0, "max": 6.5, "default": 1.0},
		{"type": "slider", "name": "Speed", "id": "speed", "min": -20.0, "max": 20.0, "default": 1.0},
	]
	
	var controls = ui.initialise(data)
	for node in controls:
		node.value_changed.connect(_on_control_value_changed)

func _on_control_value_changed(id: String, value: float):
	set_shader_value(id, value)

