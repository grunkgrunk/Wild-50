extends Area2D


export(String) var to_scene = null 

func _ready():
	# if mouse is clicked on the area then change scene
	connect("input_event", self, "_on_input_event")

func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		# get_tree().change_scene("res://" + to_scene + ".tscn")
		if to_scene == null:
			var p = get_parent()
			to_scene = p.name + "/" + p.name + ".tscn"
		
		to_scene = "res://" + to_scene

		print("Changing scene to: " + to_scene)
		
		var scn = load(to_scene)
		get_tree().change_scene_to(scn)
		

