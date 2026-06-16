/// @description math_orbit_radius(orbit_angle,moment,mass,eccentricity,eccentricity angle)
/// @param orbit_angle
/// @param moment
/// @param mass
/// @param eccentricity
/// @param eccentricity angle
function math_orbit_radius(orbit_angle, moment, mass, eccentricity, eccentricity_4) {
	//returns the distance between a satellite and the object it is orbiting
	var dist = (6.667384*mass*(1 + lengthdir_x(eccentricity,orbit_angle - eccentricity_4)));
	if (dist!=0)
	{
	    return sqr(moment)/dist;
	}
	else
	{
	    return 0;
	}



}
