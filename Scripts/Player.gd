extends KinematicBody2D

export(int) var speed = 5

var velocity = Vector3.ZERO
# Called when the node enters the scene tree for the first time.

var min_x : int
var min_y : int
var max_x : int
var max_y : int



var ini_size : Vector2

func _ready():
	ini_size = scale

func borders(max_left,max_top,max_right,max_bottom):
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
	velocity = Vector2(horizontal,vertical).limit_length() * speed / delta
	move_and_slide(velocity)
	_lock_position()
	

func _on_pickup_handling(body):
	var pickup : Pickup = body.get_parent()
	print(pickup.get_size())
