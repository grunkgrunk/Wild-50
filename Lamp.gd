extends Node2D


var t = 0
var s = 0

func _ready():
	pass # Replace with function body.

func _process(delta):
	t += delta
	rotation = sin(t) * 0.05
	s += delta * 0.1 + rand_range(0,1)*0.01

	$Lamp/Light2D.energy = 1.5 + cos(s) * 0.4
