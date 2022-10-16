extends Node2D


var correct_ingredients = [
	"baphomet",
	"petercross",
]

var ingredient_progress = 0

func _ready():
	$Added.hide()
	add_ingredient("Charcoal")

func add_ingredient(ing):
	var current_ingredient = correct_ingredients[ingredient_progress]
	G.play_sound("bubbles.wav")
	$Added.show()
	$Added.bbcode_text = "[center]Added " + ing + "!"

	# wait a while
	yield(get_tree().create_timer(2), "timeout")
	$Added.hide()

	if ing == current_ingredient:
		ingredient_progress += 1
		
		if ingredient_progress == correct_ingredients.size():
			#win
			ingredient_progress = 0
	else:
		# Restart the game
		ingredient_progress = 0

