extends Sprite

signal bounding_box
export(Array, Texture) var backgrounds = []
export(Array, Vector2) var metric_dimensions = []
# Called when the node enters the scene tree for the first time.
func _ready():
	assert(backgrounds.size()==metric_dimensions.size(),"Did not set background count and size count to same dimensions")
	print(get_incoming_connections())
	_calculate_background_bounds()
	
func _calculate_background_bounds():
	var size_x = round(texture.get_width()*scale.x)
	var size_y = round(texture.get_height()*scale.y)
	var bounding_left = position.x - size_x/2
	var bounding_top = position.y - size_y/2
	var bounding_right = size_x + bounding_left
	var bounding_bottom = size_y + bounding_top
	emit_signal("bounding_box",bounding_left,bounding_top,bounding_right,bounding_bottom)

func _on_player_increase(scale : Scale):
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
