extends Control

# The same list but translated into english
var pages = [
	"This is an evil book by schrunkin",
	"",
	"Chapter 1",
	"",
	"Yes, another page",
	"Oops, there is something important",
	"Last page"
]

var current_page = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$Left.connect("pressed", self, "_on_left_pressed")
	$Right.connect("pressed", self, "_on_right_pressed")
	update_contents()

func get_page(idx):
	if idx < 0 or idx >= pages.size():
		return ""
	return pages[idx]

func update_contents():
	$left_page.text = get_page(current_page)
	$right_page.text = get_page(current_page + 1)
	$page_number_left.text = "p. " + str(current_page + 1)
	$page_number_right.text = "p. " + str(current_page + 2)

func _on_left_pressed():
	if current_page > 0:
		current_page -= 2
		update_contents()

	

func _on_right_pressed():
	if current_page < pages.size() - 1:
		current_page += 2
		update_contents()
	
	



