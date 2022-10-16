extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var n_row_cols = 4

var list_of_contintents = ["Allamurrr", "Kaashe", "Morten"]

var list_of_countries = [["ksakdasd", "asdjajds", "Denne her vil vi have"], ["Lorem", "Ipsum", "Henrik", "Ibsen"], ["Mere pasta", "Øl", "Kaffe", "Kage"]]


var step = 0

func int2map(i):
	return char(65+floor(i/n_row_cols)) + str(i%n_row_cols+1)

# Called when the node enters the scene tree for the first time.
func _ready():
	make_continents()
	$wback/Button.connect("pressed", self, "_on_back_button_pressed")

	$wback/GridContainer.visible = false
	$wback/VBoxContainer.visible = true
	# $GridContainer.set_columns(n_row_cols)

	# for i in range(0, n_row_cols*n_row_cols):
	# 	var button = Button.new()
	# 	button.text = int2map(i)
	# 	$GridContainer.add_child(button)

	# 	button.connect("pressed", self, "on_grid_button_pressed", [i])


func _on_continent_button_pressed(id):
	print("Button " + str(id) + " pressed")
	make_countries(id)


func _on_countries_button_pressed(id):
	make_grid(id)


func on_grid_button_pressed(id):
	print("Button " + int2map(id) + " pressed")


func make_continents():
	var vb = $wback/VBoxContainer
	for i in range(list_of_contintents.size()):
		var button = Button.new()
		button.text = list_of_contintents[i]
		button.connect("pressed", self, "_on_continent_button_pressed", [i])
		vb.add_child(button)
	
	$wback/Button.connect("pressed", self, "_on_back_button_pressed")

func make_countries(id):
	var countries = list_of_countries[id]
	var vb = $wback/VBoxContainer
	for c in vb.get_children():
		c.queue_free()

	for i in range(countries.size()):
		var button = Button.new()
		button.text = countries[i]
		button.connect("pressed", self, "_on_countries_button_pressed", [i])
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
	make_continents()
