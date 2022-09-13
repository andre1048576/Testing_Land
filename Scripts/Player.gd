extends KinematicBody2D

var velocity = Vector3.ZERO

export(int) var speed = 5

onready var MetricSize = $Scale


export(float) var diameter = 1.0
export(Scale.MetricUnits) var Unit = Scale.MetricUnits.meter

var min_x : int
var min_y : int
var max_x : int
var max_y : int



var ini_scale : Vector2

func _get_property_list():
	var properties = []
	properties.append({
		name = "Scale Measurement",
		type = $Scale.get_script().get_script_property_list(),
		usage = PROPERTY_USAGE_GROUP | PROPERTY_USAGE_SCRIPT_VARIABLE
	})
	return properties

func _ready():
	MetricSize.unit = Unit
	MetricSize.diameter = diameter

func borders(max_left,max_top,max_right,max_bottom,zoom = 1):
	min_x = max_left
	min_y = max_top
	max_x = max_right
	max_y = max_bottom
	$Camera2D.limit_left = min_x
	$Camera2D.limit_right = max_x
	$Camera2D.limit_top = min_y
	$Camera2D.limit_bottom = max_y


func _lock_position():
	if (position.x + get_width()/2 > max_x):
		position.x = max_x - get_width()/2
	elif (position.x - get_width()/2 < min_x):
		position.x = min_x + get_width()/2
	if (position.y + get_height()/2 > max_y):
		position.y = max_y - get_height()/2
	elif (position.y < min_y + get_height()/2):
		position.y = min_y + get_height()/2

func get_width():
	return $Sprite.texture.get_width() * $Sprite.scale.x * scale.x

func get_height():
	return $Sprite.texture.get_height() * $Sprite.scale.y * scale.y

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var horizontal = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	var vertical = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	velocity = Vector2(horizontal,vertical).limit_length() * speed
	move_and_slide(velocity)
	_lock_position()

func get_size():
	return MetricSize.get_num()

func _on_pickup_handling(body):
	var pickup : Pickup = body.get_parent()
	var other_size = pickup.get_size()
	if MetricSize.greater_than(other_size):
		MetricSize.add(other_size)
	print(get_size())
	pickup.destroy()
	#this is the part where we eat it and get bigger
