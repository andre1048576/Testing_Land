class_name Metric_Size

#probably only using nm to km
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

var unit = MetricSize.meter
