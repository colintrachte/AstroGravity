/// @description draw_path_circle_points(path,x,y,color1,color2,alpha1,alpha2)
/// @param path
/// @param x
/// @param y
/// @param color1
/// @param color2
/// @param alpha1
/// @param alpha2
function draw_path_circle_points(path, x, y, color1, color2, alpha1, alpha2) {
	//draws a circle using the points in the path. no interpolation.
	//the path's coordinate axis is relative to x and y.
	var path_length=path_get_number(path);
	if (path_length>0)
	{
	    var xx,yy,i;
	    draw_primitive_begin(pr_trianglefan)
	    //the first point is in the center
	    draw_vertex_colour(x,y,color1,alpha1);
	    for (i=0;i<path_length;i+=1)
	    {
	        xx=path_get_point_x(path,i);
	        yy=path_get_point_y(path,i);
	        draw_vertex_colour(x+xx,y+yy,color2,alpha2);
	    }
	    xx=path_get_point_x(path,0);
	    yy=path_get_point_y(path,0);
	    draw_vertex_colour(x+xx,y+yy,color2,alpha2);
	    draw_primitive_end()
	}



}
