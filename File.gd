extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var book 
var button 
var important_names = ["207"]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func on_click():
	book = preload("res://Book/Book.tscn").instance()

	


	var name = get_parent().name.substr(6,-1)
	if name in important_names:
		book.book_name = name
	else:
		book.book_name = "default"

	get_tree().get_root().add_child(book)

	# place in the middle of the screen
	book.global_position = Vector2(100, 100)

	print(name)

	# add button
	button = Button.new()
	get_tree().get_root().add_child(button)
	button.rect_global_position = Vector2(100, 100)	
	button.text = "Close"
	button.connect("pressed", self, "on_close")


func on_close():
	book.queue_free()
	button.queue_free()

