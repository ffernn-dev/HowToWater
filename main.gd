extends Node3D

@onready var ui = $UI
@onready var water = $Water
@onready var camera = $Camera3D
@onready var world_environment = $WorldEnvironment

@onready var water_shader: ShaderMaterial = water.get_surface_override_material(0)

@onready var camera_tween = get_tree().create_tween()

func _ready():
	ui.get_node("%Previous").pressed.connect(_prev_slide)
	ui.get_node("%Next").pressed.connect(_next_slide)
	show_slide(Globals.current_slide)


func set_shader_value(id: String, value):
	water_shader.set("shader_parameter/" + id, value)


func _on_control_value_changed(id: String, value: float):
	set_shader_value(id, value)


func _prev_slide():
	Globals.current_slide -= 1
	show_slide(Globals.current_slide)


func _next_slide():
	Globals.current_slide += 1
	show_slide(Globals.current_slide)


func show_slide(id: int):
	var slide_data = SlideData.slides[id]
	water_shader.shader = load("res://shaders/" + slide_data["shader"] + ".gdshader")
	
	var shader_flags = slide_data["shader_flags"]
	for i in shader_flags:
		if str(shader_flags[i]) == "_def":
			continue
		set_shader_value(i, shader_flags[i])

	var control_data = slide_data["controls"]

	var new_controls = ui.initialise(control_data)
	for node in new_controls:
		node.value_changed.connect(_on_control_value_changed)

	animate_properties(slide_data)


func animate_properties(slide_data):
	if camera_tween:
		camera_tween.kill()
	camera_tween = get_tree().create_tween()
	camera_tween.set_parallel(true)

	camera_tween.tween_property(camera, "position", slide_data["camera_position"][0], 2)
	camera_tween.tween_property(camera, "rotation_degrees", slide_data["camera_position"][1], 2)
	camera_tween.tween_property(water, "scale", slide_data["water_mesh_scale"], 2)
	camera_tween.tween_property(world_environment.environment, "ambient_light_energy", slide_data["global_light"], 2)
