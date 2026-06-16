/// @description draw_path_circle_ext(x,y,path,start,end,# polygons,texture,texture_pixelwidth,texture_pixelheight,texture angle,color1,color2,alpha1,alpha2)
/// @param x
/// @param y
/// @param path
/// @param start
/// @param end
/// @param # polygons
/// @param texture
/// @param texture_pixelwidth
/// @param texture_pixelheight
/// @param texture angle
/// @param color1
/// @param color2
/// @param alpha1
/// @param alpha2
function draw_path_circle_ext(x, y, path, start, path_end, texture, texture_pixelwidth, texture_pixelheight, texture_8, color1, color2, alpha1, alpha2, arg13) {
	//By Ground Effect Games
	//the drawing is centered at x,y, and the path is assumed to be a circle centered at 0,0
	//absolute coordinates from the path are used to map the texture to the path.
	//start and end are path positions between 1 and 0.
	//color1 is at the center, color2 is on the outer edges (radial gradient)

	if (texture && (path_end > start))
	{
	    var i,seglength,r,dir;
	    //returns a percentage of the path which makes up one segment.
	    seglength = (path_end-start)/round(texture);
    
	    draw_primitive_begin_texture(pr_trianglefan,texture_pixelwidth)
	    //the first point is in the center
	    draw_vertex_texture_colour(x,y,.5,.5,color2,alpha2);
	    for (i=start; i<=path_end; i+=seglength;)
	    {
	        r=path_get_speed(path,i);
	        dir=(i*360)+color1;
	        draw_vertex_texture_colour(x+path_get_x(path,i),y+path_get_y(path,i),.5+(lengthdir_x(r,dir))/texture_pixelheight,.5+(lengthdir_y(r,dir))/texture_8,alpha1,arg13);
	    }
	    draw_primitive_end()
	}



}
