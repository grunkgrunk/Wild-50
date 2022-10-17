extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	# instantiate the player

	var n_files = 5
	var filefile = preload("res://File.tscn")

	for i in get_children().size():
		var c = get_children()[i]

		if not "Drawer" in c.name:
			continue
			
		var num = int(c.name.substr(6,-1))

		var file = null
		for ii in n_files:
			file = filefile.instance()
			file.name = "FilerA" + str(num - ii - 1)


			c.add_child(file)
			var p = c.global_position
			p.x -= 230
			p.x += ii * 110

			file.global_position = p



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
