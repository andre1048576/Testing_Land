class_name Pickup
extends Sprite
var curr_size

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export(float) var diameter
export(Scale.MetricUnits) var Unit
onready var MetricSize = $Scale
# Called when the node enters the scene tree for the first time.
func _ready():
	MetricSize.set_unit(Unit)
	MetricSize.set_diameter(diameter)

func grabbed():
	pass

func get_size():
	return MetricSize
	
func destroy():
	queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
