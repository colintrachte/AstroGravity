/// @description draw_path_circle_shadowed(x,y,path,start,end,# polygons,color1,color2,alpha1,alpha2,angle)
/// @param x
/// @param y
/// @param path
/// @param start
/// @param end
/// @param # polygons
/// @param color1
/// @param color2
/// @param alpha1
/// @param alpha2
/// @param angle
function draw_path_circle_shadowed(x, y, path, start, path_end, color1, color2, alpha1, alpha2, angle, arg10) {
	//By Ground Effect Games
	//the drawing is centered at x,y, and the path is assumed to be a circle centered at 0,0
	//start and end are path positions between 1 and 0.
	//color1 is at the center, color2 is on the outer edges (radial gradient)

	if (color1 && (path_end > start))
	{
	    var i,seglength,shadow;
	    //returns a percentage of the path which makes up one segment.
	    seglength = (path_end-start)/round(color1);
    
	    draw_primitive_begin(pr_trianglefan)
	    //the first point is in the center
	    draw_vertex_colour(x,y,color2,alpha2);
	    for (i=start; i<=path_end; i+=seglength;)
	    {
	        shadow=1-sqr(angle_difference(arg10,i*360)/180);
	        draw_vertex_colour(x+path_get_x(path,i),y+path_get_y(path,i),alpha1,shadow*angle);
	    }
	    draw_primitive_end()
	}



}
