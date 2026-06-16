/// @description draw_path_line(path,x,y)
/// @param path
/// @param x
/// @param y
function draw_path_line(path, x, y) {
	//draws the path using the points in the path. no interpolation.
	//why is this script needed?
	//because GMS draw_path()is drawn relative to the first point on the path,
	//which is different for every path.
	//draw_path_line() is drawn relative to the path's coordinate axis.
	var path_length=path_get_number(path);
	var i;
	if (path_length>0)
	{
	    draw_primitive_begin(pr_linestrip)
	    for (i=0;i<path_length;i+=1)
	    {
	        draw_vertex(x+path_get_point_x(path,i),y+path_get_point_y(path,i))
	    }
	    if path_get_closed(path)
	    {
	        i=0;
	        draw_vertex(x+path_get_point_x(path,i),y+path_get_point_y(path,i))
	    }
	    draw_primitive_end()
	}



}
