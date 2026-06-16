/// @description camera_confine(x,y,radius)
/// @param x
/// @param y
/// @param radius
function camera_confine(x, y, radius) {
	//confine the camera within some radius of x,y
	if (point_distance(x,y,xtarget,ytarget)>radius)
	{
	    var dir=point_direction(x,y,xtarget,ytarget);
	    xtarget=lengthdir_x(radius,dir);
	    ytarget=lengthdir_y(radius,dir);
	}



}
