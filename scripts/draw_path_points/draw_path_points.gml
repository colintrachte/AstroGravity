/// @description draw_path_points(path,x,y)
/// @param path
/// @param x
/// @param y
function draw_path_points(path, x, y) {
	//draws the points in the path. no interpolation.
	//the path's coordinate axis is relative to x and y.
	var path_length=path_get_number(path);
	if (path_length>0)
	{
	    for (var i=0;i<path_length;i+=1)
	    {
	        draw_circle(x+path_get_point_x(path,i),y+path_get_point_y(path,i),9,0)
	    }
	}



}
