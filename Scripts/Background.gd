extends Sprite

signal bounding_box

# Called when the node enters the scene tree for the first time.
func _ready():
	assert(Vector2(1,1) == Vector2(1,1),"Scale of background isn't 1,1")
	var size_x = round(texture.get_width()*scale.x)
	var size_y = round(texture.get_height()*scale.y)
	var bounding_left = position.x - size_x/2
	var bounding_top = position.y - size_y/2
	var bounding_right = size_x + bounding_left
	var bounding_bottom = size_y + bounding_top
	emit_signal("bounding_box",bounding_left,bounding_top,bounding_right,bounding_bottom)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
