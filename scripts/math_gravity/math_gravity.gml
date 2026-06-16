/// @description math_gravity(mass,radius,multiplier)
/// @param mass
/// @param radius
/// @param multiplier
function math_gravity(mass, radius, multiplier) {
	//By Ground Effect Games
	//returns the acceleration due to gravity, given mass and radius.
	//in real life, the multiplier is 6.67384*power(10,-11).
	return multiplier*mass/sqr(radius);



}
