extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var n_row_cols = 4

var list_of_constellations = ["The Obsidian Mirror", "The Hand of Daoloth", "The Kneeling Ptolemy"]

var list_of_stars = [["copilot", "pytorch", "work", "play"], ["Lorem", "Ipsum", "Henrik", "Ibsen"], ["Mere pasta", "Øl", "Kaffe", "Kage"]]



var step = 0

func int2map(i):
	return char(65+floor(i/n_row_cols)) + str(i%n_row_cols+1)

# Called when the node enters the scene tree for the first time.
func _ready():
	make_constellations()
	$Area2D.connect("mouse_entered", self, "on_mouse_enter")
	$Area2D.connect("mouse_exited", self, "on_mouse_exit")

	$wback/Button.connect("pressed", self, "_on_back_button_pressed")

	$wback/GridContainer.visible = false
	$wback/VBoxContainer.visible = true
	# $GridContainer.set_columns(n_row_cols)

	# for i in range(0, n_row_cols*n_row_cols):
	# 	var button = Button.new()
	# 	button.text = int2map(i)
	# 	$GridContainer.add_child(button)

	# 	button.connect("pressed", self, "on_grid_button_pressed", [i])


func _process(delta):
	if get_viewport().get_mouse_position().y > get_viewport().get_size().y/3:
		$Node2D.visible = true
	else:
		$Node2D.visible = false

func _on_continent_button_pressed(id):
	print("Button " + str(id) + " pressed")
	make_stars(id)


func _on_stars_button_pressed(id):
	var s = "res://star_systems/solarsystem" + str(id) + ".jpg"
	print(s)
	$Stars.texture = load(s)
	make_grid(id)
	


func on_grid_button_pressed(id):
	print("Button " + int2map(id) + " pressed")



func make_constellations():
	var vb = $wback/VBoxContainer
	for i in range(list_of_constellations.size()):
		var button = Button.new()
		button.text = list_of_constellations[i]
		button.connect("pressed", self, "_on_continent_button_pressed", [i])
		vb.add_child(button)
	
	$wback/Button.connect("pressed", self, "_on_back_button_pressed")

func make_stars(id):
	var stars = list_of_stars[id]
	var vb = $wback/VBoxContainer
	for c in vb.get_children():
		c.queue_free()

	for i in range(stars.size()):
		var button = Button.new()
		button.text = stars[i]
		button.connect("pressed", self, "_on_stars_button_pressed", [i])
		vb.add_child(button)

func make_grid(id):
	print("Button " + int2map(id) + " pressed")
	var vb = $wback/VBoxContainer
	for c in vb.get_children():
		c.queue_free()

	vb.visible = false

	$wback/GridContainer.set_columns(n_row_cols)
	$wback/GridContainer.visible = true

	for i in range(0, n_row_cols*n_row_cols):
		var button = Button.new()
		button.text = int2map(i)
		$wback/GridContainer.add_child(button)

		button.connect("pressed", self, "on_grid_button_pressed", [i])


func _on_back_button_pressed():
	var vb = $wback/VBoxContainer
	for c in vb.get_children():
		c.queue_free()

	$wback/GridContainer.visible = false
	$wback/VBoxContainer.visible = true
	make_constellations()


# func on_mouse_enter():
# 	$Node2D.visible = true
# 	print("mouse enter")

# func on_mouse_exit():
# 	$Node2D.visible = false
# 	print("mouse exit")
	

