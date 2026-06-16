/// @description path_random(x1,y1,x2,y2,path,segment length,tolerance,curl)
/// @param x1
/// @param y1
/// @param x2
/// @param y2
/// @param path
/// @param segment length
/// @param tolerance
/// @param curl
function path_random(x1, y1, x2, y2, path, segment, tolerance, curl) {
	//By Ground Effect Games
	//calculates the points needed for a lightning bolt and adds them to a path
	//tolerance is the maximum number of degrees a segment may vary from a straight line
	//curl determines how many degrees the lightning's average path will curve.
	var xx,yy,dir,t;
	xx=x1;
	yy=y1;
	//tolerance is limited in order to make the effect look nice and also use less CPU.
	t=median(-60,tolerance,60);
	path_clear_points(path)
	path_set_closed(path,0);
	while (point_distance(xx,yy,x2,y2)>segment)
	{
	    dir=point_direction(xx,yy,x2,y2)+curl+tolerance(t);
	    path_add_point(path,xx,yy,tolerance(t*segment/30));
	    xx+=lengthdir_x(segment,dir);
	    yy+=lengthdir_y(segment,dir);
	}
	//stop the loop when the lightning reaches within one segment length of the target
	path_add_point(path,x2,y2,0);
	//add the last point manually, so the lightning hits the target pixel exactly



}
