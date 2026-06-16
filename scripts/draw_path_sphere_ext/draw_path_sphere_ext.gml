/// @description draw_path_sphere_ext(x,y,path,start,end,# polygons,texture,texture_pixelwidth,texture_pixelheight,stretch,twist,color,alpha)
/// @param x
/// @param y
/// @param path
/// @param start
/// @param end
/// @param # polygons
/// @param texture
/// @param texture_pixelwidth
/// @param texture_pixelheight
/// @param stretch
/// @param twist
/// @param color
/// @param alpha
function draw_path_sphere_ext(x, y, path, start, path_end, texture, texture_pixelwidth, texture_pixelheight, stretch, twist, color, alpha, arg12) {
	//By Ground Effect Games
	//where x and y are the absolute coordinates of pixels on your screen.
	//this usually means you have to input x-view_xview, y-view_yview
	//the center of the shield is at x,y.
	//absolute coordinates from the path are used to place the texture on the rock.
	//start and end are path positions between 1 and 0.
	//twist is an absolute value. set it to image_angle,direction, or similar variable

	if (texture && (path_end > start))
	{
	    var seglength,xx,yy,zx,zy,dir,r1,r2;
	    //we are not drawing a true sphere,
	    //but actually a stack of two n-sided polygons that approximate a 3D sphere.
	    //The number of polygons should never exceed the number of segments in the path.
	    //also, we round the number of sides to prevent a loss in precision of the drawing.
	    seglength = (path_end-start)/round(texture);
    
	    draw_primitive_begin_texture(pr_trianglestrip,texture_pixelwidth)
	    for (var i=start; i<=path_end; i+=seglength;)
	    {
	        //map points on the texture to the points on a path, with stretch and twist distortion
	        zx=path_get_x(path,i);
	        zy=path_get_y(path,i);
	        r1=path_get_speed(path,i);
	        xx=x+zx;
	        yy=y+zy;
	        dir=(i*360)+color;
	        r2=.5*r1-twist;
	        draw_vertex_texture_colour(xx,yy,.5+(lengthdir_x(r1,dir))/texture_pixelheight,.5+(lengthdir_y(r1,dir))/stretch,c_white,arg12);
	        xx=x+zx/2;
	        yy=y+zy/2;
	        draw_vertex_texture_colour(xx,yy,.5+(lengthdir_x(r2,dir))/texture_pixelheight,.5+(lengthdir_y(r2,dir))/stretch,alpha,arg12);
	    }
	    draw_primitive_end()

	    draw_primitive_begin_texture(pr_trianglefan,texture_pixelwidth)
	    //the first point will be at the center.
	    draw_vertex_texture_colour(x,y,.5,.5,alpha,arg12);
	    for (var i=start; i<=path_end; i+=seglength;)
	    {
	        //map points on the texture to the points on a path, with stretch and twist distortion
	        xx=x+path_get_x(path,i)/2;
	        yy=y+path_get_y(path,i)/2;
	        dir=(i*360)+color;
	        r2=.5*path_get_speed(path,i)-twist;
	        draw_vertex_texture_colour(xx,yy,.5+(lengthdir_x(r2,dir))/texture_pixelheight,.5+(lengthdir_y(r2,dir))/stretch,alpha,arg12);
	    }
	    draw_primitive_end()
	}



}
