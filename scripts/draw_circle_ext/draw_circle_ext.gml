/// @description draw_circle_ext(x,y,radius,# polygons,texture,texture_pixelwidth,texture_pixelheight,rotation,color1,color2,alpha1,alpha2)
/// @param x
/// @param y
/// @param radius
/// @param # polygons
/// @param texture
/// @param texture_pixelwidth
/// @param texture_pixelheight
/// @param rotation
/// @param color1
/// @param color2
/// @param alpha1
/// @param alpha2
function draw_circle_ext(x, y, radius, texture, texture_pixelwidth, texture_pixelheight, rotation, color1, color2, alpha1, alpha2, arg11) {
	//by Ground Effect Games
	//designed to run in the regular draw event, using a regular texture
	//to understand how this works, you need to know polar coordinates

	//only draw if we have enough triangles to do it with.
	if (texture>=3)
	{
	    var i,side,texture_angle;
    
	    //The number of sides cannot physically exceed the circumference of the circle.
	    //also, we round the number of sides to prevent a loss in precision of the drawing.
	    side=360/round(texture);
    
	    draw_primitive_begin_texture(pr_trianglestrip,texture_pixelwidth)//change to pr_linestrip to debug
	    for (i=color1-360;i<=color1;i+=side)
	    {
	        texture_angle=i+color1;
	        //middle circle of points
	        draw_vertex_texture_color(x+lengthdir_x(radius,i),y+lengthdir_y(radius,i),.5+(lengthdir_x(radius,texture_angle))/texture_pixelheight,.5+(lengthdir_y(radius,texture_angle)/rotation),alpha1,arg11)
	        //there is only one point in the center
	        draw_vertex_texture_color(x,y,.5,.5,color2,alpha2)
	    }
	    draw_primitive_end();
	}



}
