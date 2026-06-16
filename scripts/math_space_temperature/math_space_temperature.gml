/// @description math_space_temperature(star luminosity,orbit radius,absorption/emission ratio)
/// @param star luminosity
/// @param orbit radius
/// @param absorption/emission ratio
function math_space_temperature(star, orbit, absorption_emission) {
	//By Ground Effect Games
	//returns temperature in Kelvins
	return star*absorption_emission/(71.26*power(10,-8)*sqr(orbit));



}
