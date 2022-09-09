class_name Pickup
extends Sprite

var SizeClass = load("res://Scripts/Metric_Size.gd").Size
export(Metric_Size.Size.MetricSize) var unit
export(float) var diameter
var curr_size

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	curr_size = SizeClass.new(diameter,unit)
	print(curr_size.get_num())

func grabbed():
	pass

func get_size():
	return curr_size.get_num()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
