/// @description path_orbit(x,y,path,semilatus,moment,mass,eccentricity,eccentricity angle,energy)
/// @param x
/// @param y
/// @param path
/// @param semilatus
/// @param moment
/// @param mass
/// @param eccentricity
/// @param eccentricity angle
/// @param energy
function path_orbit(x, y, path, semilatus, moment, mass, eccentricity, eccentricity_7, energy) {
	//adds points to a path corresponding to an elliptical orbit
	var t, r, placeholder;
	placeholder = semilatus;
	path_clear_points(path)
	path_set_kind(path,1)
	for (t=0;t<360;t+=12)
	{
	    r = math_orbit_radius(t, moment, mass, eccentricity, eccentricity_7)
	    path_add_point(path,x+ lengthdir_x(r,t),y+lengthdir_y(r,t), sqrt(2*((G*mass/r) + energy)));
	}



}
