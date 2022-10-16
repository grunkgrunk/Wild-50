extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass




var click_all = false
var ignore_unclickable = true

func sort_shapes(a, b):
	var aa = int(a.get_parent().name.substr(6,-1))
	var bb = int(b.get_parent().name.substr(6,-1))
	if aa < bb:
		return true
	else:
		return false

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == 1: # Left mouse click
		var shapes = get_world_2d().direct_space_state.intersect_point(get_global_mouse_position(), 32, [], 0x7FFFFFFF, true, true) # The last 'true' enables Area2D intersections, previous four values are all defaults
		# get list of colliders from shapes
		var colliders = []
		for shape in shapes:
			colliders.append(shape["collider"])

		# sort shapes by y position
		colliders.sort_custom(self, "sort_shapes")
		
		for collider in colliders:
			if collider.has_method("on_click"):
				collider.on_click()
				break


func play_sound(sound):
	var audio = AudioStreamPlayer2D.new()
	audio.stream = load("res://Sounds/" + sound)
	add_child(audio)
	audio.play()
	# remvoe audio after it is done playing
	yield(audio, "finished")
	audio.queue_free()
