class_name Metric_Size

class Size:
	enum MetricSize {
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
	var size
#probably only using nm to km
	var diameter
	var unit
	
	func _init(diameter : float,unit):
		self.diameter = diameter
		self.unit = unit
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
