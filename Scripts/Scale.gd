class_name Scale
extends Node

enum MetricUnits {
	femptometer, #femptometer (10^-15)
	picometer, #picometer (10^-12)
	nanometer, #nanometer (10^-9)
	micrometer, #micrometer (10^-6)
	millimeter, #millimeter (10^-3)
	meter, #meter (1)
	kilometer, #kilometer (10^3)
	megameter, #megameter (10^6)
	gigameter, #gigameter (10^9)
	terameter, #terameter (10^12)
	pentameter, #pentameter (10^15)
	exameter, #exameter (10^18)
	zettameter #zettameter (10^21)
}

var unit setget set_unit,get_unit 
var diameter setget set_diameter,get_diameter

func set_unit(new_value):
	unit = new_value
	
func get_unit():
	return unit

func set_diameter(new_value):
	if new_value > 1000:
		unit +=1
		set_diameter(new_value/1000)
	elif new_value < 1:
		unit -=1
		set_diameter(new_value*1000)
	else:
		diameter = new_value

func get_diameter():
	return diameter


func get_num():
	return str(self.diameter) + " " + size_to_string(self.unit)

static func size_to_string(unit_value):
	match unit_value:
		0: return "femptometer"
		1: return "picometer"
		2: return "nanometer"
		3: return "micrometer"
		4: return "millimeter"
		5: return "meter"
		6: return "kilometer"
		7: return "megameter"
		8: return "gigameter"
		9: return "terameter"
		10: return "pentameter"
		11: return "exameter"
		12: return "zettameter"
	return "error"

func greater_than(other : Scale):
	if self.unit > other.unit:
		return true
	elif self.unit < other.unit:
		return false
	else:
		return self.diameter > other.diameter

func get_diameter_converted_unit(new_unit : int):
	var diff = self.unit - new_unit  
	return diameter*pow(10,diff*3)

func add(other : Scale):
	get_diameter_converted_unit(3)
	#First, make metric units identical
	var temp_self_diameter = self.diameter
	var temp_other_diameter = other.diameter
	var avg_unit = int((self.unit + other.unit)/2)
	if self.unit != other.unit:
		temp_self_diameter = get_diameter_converted_unit(avg_unit)
		temp_other_diameter = other.get_diameter_converted_unit(avg_unit)
	var new_diameter = sqrt(pow(temp_self_diameter,2)+pow(temp_other_diameter,2))
	self.unit = avg_unit
	print('hello')
	self.diameter = new_diameter

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
