extends Control


# The same list but translated into english
export(String) var book_name = "symbols"

var pages = []

var current_page = 0

# Called when the node enters the scene tree for the first time.
func _ready():

	# load the file "res://Book/books.json"
	var file = File.new()
	file.open("res://Book/books.json", File.READ)
	var json = file.get_as_text()
	file.close()
	# Parse the json
	pages = JSON.parse(json).result[book_name]
	# get the symbols
	print(pages)

	$Left.connect("pressed", self, "_on_left_pressed")
	$Right.connect("pressed", self, "_on_right_pressed")
	update_contents()

func get_page(idx):
	if idx < 0 or idx >= pages.size():
		return ""
	return pages[idx]

func update_contents():
	$Left.show()
	$Right.show()
	if current_page <= 0:
		$Left.hide()
	if current_page >= pages.size():
		$Right.hide()

	$left_page.bbcode_text  = get_page(current_page)
	$right_page.bbcode_text = get_page(current_page + 1)
	$page_number_left.bbcode_text =  "[center]" + str(current_page + 1) + "[/center]"
	$page_number_right.bbcode_text = "[center]" + str(current_page + 2) + "[/center]"

func _on_left_pressed():
	if current_page > 0:
		$pageflip.play()
		current_page -= 2
		update_contents()

func _on_right_pressed():
	if current_page < pages.size() - 1:
		$pageflip.play()
		current_page += 2
		update_contents()
	
	


		# [b][u]Rich Text Test[/u][/b]

		# RichTextLabel is a flexible way of adding text to your game, with support for [i]italics[/i], [b]bold[/b] and [i][b]both[/b][/i].
		#  [u]Underline[/u] works too, including with [u][i]italics[/i][/u], [u][b]bold[/b][/u] and [u][i][b]both[/b][/i][/u].
		# It is also possible to include [img]res://unicorn_icon.png[/img] custom images, as well as [color=aqua][url=https://godotengine.org]custom URLs[/url][/color].
		
		# Left alignment is default,[center]but center alignment is supported,[/center][right]as well as right alignment.[/right]
		
		# [fill]Fill alignment is also supported, and allows writing very long text that will end up fitting the horizontal space entirely with words of joy.[/fill]
		
		# For full reference, [color=aqua][url=https://docs.godotengine.org/en/latest/tutorials/gui/bbcode_in_richtextlabel.html]check the documentation.[/url][/color]
		

func _input(event):
	if event is InputEventKey:
		if event.pressed:
			if event.scancode == KEY_LEFT:
				_on_left_pressed()
			elif event.scancode == KEY_RIGHT:
				_on_right_pressed()
