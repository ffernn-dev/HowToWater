extends Node3D

@onready var ui = $UI
@onready var water = $Water

@onready var water_shader = water.get_surface_override_material(0)

func set_shader_value(id: String, value: float):
	water_shader.set("shader_parameter/" + id, value)

func _ready():
	show_slide(SlideData.slides[0])

func _on_control_value_changed(id: String, value: float):
	set_shader_value(id, value)

func show_slide(data: Dictionary):
	var control_data = data["controls"]
	
	var new_controls = ui.initialise(control_data)
	for node in new_controls:
		node.value_changed.connect(_on_control_value_changed)
