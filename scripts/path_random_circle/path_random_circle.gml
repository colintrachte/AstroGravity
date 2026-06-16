/// @description path_random_circle(path,x,y,r1,r2,angle,segments,xscale,yscale)
/// @param path
/// @param x
/// @param y
/// @param r1
/// @param r2
/// @param angle
/// @param segments
/// @param xscale
/// @param yscale
function path_random_circle(path, x, y, r1, r2, angle, segments, xscale, yscale) {
	//clears an existing path and then adds points to it for a lightning bolt circle,
	//where r1 and r2 are the max and min radius allowed.

	var dir,delta,r;
	//start with a clean slate
	path_clear_points(path)
	//To avoid pointy corners when the path type is smooth, the path must be closed
	path_set_closed(path,1);
	//difference between max and min radius
	delta=r2-r1;
	angle=360/max(1,segments);
	for (dir=angle-360; dir<angle; dir+=angle)
	{
	    //choose a value between the min and max radius
	    r=r2-random(delta);
	    path_add_point(path,x+lengthdir_x(r,dir)*xscale,y+lengthdir_y(r,dir)*yscale,r)
	}



}
