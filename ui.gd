extends Control

@onready var main_container = %MainContainer

var slider_scene = preload("res://ui_components/slider.tscn")
var title_scene = preload("res://ui_components/title.tscn")
var paragraph_scene = preload("res://ui_components/paragraph.tscn")

func delete_children(node):
	for n in node.get_children():
		node.remove_child(n)
		n.queue_free()


func initialise(data: Array) -> Array[Node]:
	delete_children(main_container)
	var nodes : Array[Node] = []
	
	for item in data:
		if item["type"] == "slider":
		
			var slider = slider_scene.instantiate()
			var slider_node = slider.get_node("Slider")
		
			slider.get_node("Label").text = item["name"]
			slider.id = item["id"]
		
			slider_node.min_value = item["min"]
			slider_node.max_value = item["max"]
			slider_node.step = abs(item["max"] - item["min"]) / 100
			slider_node.value = item["default"]
			
			main_container.add_child(slider)
			nodes.append(slider)
		
		elif item["type"] == "title":
			var title = title_scene.instantiate()
			
			title.id = item["id"]
			title.text = "[center]" + item["name"] + "[/center]"
			
			main_container.add_child(title)
			nodes.append(title)
		
		elif item["type"] == "paragraph":
			var paragraph = paragraph_scene.instantiate()
			var text = item["name"].replace("/```", "[/bgcolor]").replace("```", "[bgcolor=#6e6a8666]")
			
			paragraph.id = item["id"]
			paragraph.text = text
			
			main_container.add_child(paragraph)
			nodes.append(paragraph)
			
	return nodes
