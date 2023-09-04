extends Control

@onready var main_container = $MainPanel/Margin/Scroll/MainContainer

var slider_scene = preload("res://ui_components/slider.tscn")

func _ready():
	pass

func initialise(data: Array) -> Array[Node]:
	var nodes : Array[Node] = []
	var current_ids = []
	for node in main_container.get_children():
		current_ids.append(node.id)
	
	for item in data:
		if item["id"] not in current_ids:
			
			if item["type"] == "slider":
			
				var slider = slider_scene.instantiate()
			
				slider.get_node("Label").text = item["name"]
				slider.id = item["id"]
				var slider_node = slider.get_node("Slider")
			
				slider_node.min_value = item["min"]
				slider_node.max_value = item["max"]
				slider_node.step = abs(item["max"] - item["min"]) / 100
				slider_node.value = item["default"]
				
				main_container.add_child(slider)
				nodes.append(slider)
	
	return nodes
