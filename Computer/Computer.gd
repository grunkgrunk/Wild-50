extends Node2D

export(bool) var enabled = false

var my_style = StyleBoxFlat.new()
var password = "1234"
var default_text = "Welcome! Please login."
var status = "login"

func _ready():
	my_style.set_bg_color(Color(0,1,1,1))

	# Set the "normal" style to be your newly created style.
	set("custom_styles/normal", my_style)
	$LineEdit.secret = true
	if enabled:
		# Take focus 
		$LineEdit.grab_focus()
		# execute function when enter is pressed
		$LineEdit.connect("text_entered", self, "on_enter_pressed")
	else:
		$LineEdit.queue_free()


func display_message(msg):
	$Display.text = msg
	# wait a while and go back to normal
	# yield(get_tree().create_timer(2), "timeout")
	# $Display.text = default_text
	
	
func login(s):
	if s == password:
		display_message("Welcome Satan!")
		# wait a while
		$LineEdit.secret = false
		yield(get_tree().create_timer(2), "timeout")
		status = "main"
		default_text = "Search for a soul to steal."
		display_message(default_text)
	else:
		print("Wrong password")
		display_message("Wrong password. Try again!")

func main(s):
	if s == "satan is cool":
		$LineEdit.queue_free()
		display_message("Ahh yes, that one. Searching...")
		# wait a while
		yield(get_tree().create_timer(2), "timeout")
		display_message("Found it! Here you go!")
		# wait a while
		yield(get_tree().create_timer(2), "timeout")
		display_message("Satan is cool")
	else:
		display_message("What? I don't know that article, I'm sorry!")

func on_enter_pressed(s):
	print("Enter pressed")
	$LineEdit.text = ""
	$LineEdit.grab_focus()
	if status == "login":
		login(s)
	if status == "main":
		main(s)

	



