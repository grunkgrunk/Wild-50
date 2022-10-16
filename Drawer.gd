extends Area2D

# var mouse_over= false

var out = false
var length = 150

export var openable = true


func on_click():
	if openable:
		clicked()

# func _ready():
# 	$Area2D.connect("input_event", self, "_on_Area2D_input_event")


func clicked():
	var p = get_parent().position
	if !out:
		p.y += length
	else:
		p.y -= length

	get_parent().position = p

	out = !out



# func _on_Area2D_input_event(viewport, event, shape_idx ):
# 	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
# 		clicked()





# # function that checks whether the mouse clicks on area2d
