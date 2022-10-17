extends Area2D

# var mouse_over= false


# variables for the soudns fo the drawers
var drawerOpenSound = preload("res://sounds/drawer_open.wav")
var drawerCloseSound = preload("res://sounds/drawer_close.wav")

onready var Audio = get_parent().get_parent().get_node("Audio")
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
		# change the sound effect and play it
		Audio.set_stream(drawerOpenSound)
		Audio.play()
	else:
		p.y -= length
		# change the sound effect and play it
		Audio.set_stream(drawerCloseSound)
		Audio.play()

	get_parent().position = p

	out = !out



# func _on_Area2D_input_event(viewport, event, shape_idx ):
# 	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
# 		clicked()





# # function that checks whether the mouse clicks on area2d
