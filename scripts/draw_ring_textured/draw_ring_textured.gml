/// @description draw_ring_textured(x,y,inner radius,outer radius,# polygons,texture,texture_pixelwidth,texture_pixelheight,pixelstretch,degrees_rotation,degrees_twist,color1,color2,alpha1,alpha2)
/// @param x
/// @param y
/// @param inner radius
/// @param outer radius
/// @param # polygons
/// @param texture
/// @param texture_pixelwidth
/// @param texture_pixelheight
/// @param pixelstretch
/// @param degrees_rotation
/// @param degrees_twist
/// @param color1
/// @param color2
/// @param alpha1
/// @param alpha2
function draw_ring_textured(x, y, inner, outer, texture, texture_pixelwidth, texture_pixelheight, pixelstretch, degrees_rotation, degrees_twist, color1, color2, alpha1, alpha2, arg14) {
	//by Ground Effect Games
	//designed to run in the regular draw event, using a regular texture
	//to understand how this works, you need to know polar coordinates

	//only draw if we have enough triangles to do it with.
	if (texture>3)
	{
	    var side,r1,r2,end_angle,texture_angle;
    
	    //we are not drawing a true sphere, but actually a stack of two n-sided polygons that approximate a 3D sphere.
	    //The number of sides cannot physically exceed the circumference of the circle.
	    //also, we round the number of sides to prevent a loss in precision of the drawing.
	    side=360/round(texture);
    
	    //these numbers are used repeatedly in the loop, so we do the calculation in advance to save CPU.
	    //middle radius
	    r1=inner+(outer-inner)*.5;
	    //radius of stretch
	    r2=r1-degrees_rotation;
    
	    end_angle=360+degrees_twist;
	    draw_primitive_begin_texture(pr_trianglestrip,texture_pixelwidth)//change to pr_linestrip to debug
    
	    //This loop draws the outside of the ring
	    for (var i=degrees_twist;i<=end_angle;i+=side)
	    {
	        texture_angle=i+degrees_twist+color1;
	        //outer circle of points has no magnification but maximum twist
	        draw_vertex_texture_color(x+lengthdir_x(outer,i),y+lengthdir_y(outer,i),.5+(lengthdir_x(outer,texture_angle)/texture_pixelheight),.5+(lengthdir_y(outer,texture_angle)/pixelstretch),alpha1,arg14)
	        texture_angle=i+degrees_twist+color1*.6;
	        //middle circle of points stretches the texture, causing magnification. also has 75% twist
	        draw_vertex_texture_color(x+lengthdir_x(r1,i),y+lengthdir_y(r1,i),.5+(lengthdir_x(r2,texture_angle))/texture_pixelheight,.5+(lengthdir_y(r2,texture_angle)/pixelstretch),color2,alpha2)
	    }
    
	    //this loop draws the inside of the ring
	    for (var i=degrees_twist;i<=end_angle;i+=side)
	    {
	        texture_angle=i+degrees_twist+color1*.6;
	        //middle circle of points stretches the texture, causing magnification.
	        draw_vertex_texture_color(x+lengthdir_x(r1,i),y+lengthdir_y(r1,i),.5+(lengthdir_x(r2,texture_angle))/texture_pixelheight,.5+(lengthdir_y(r2,texture_angle)/pixelstretch),color2,alpha2)
	        texture_angle=i+degrees_twist;
	        draw_vertex_texture_color(x+lengthdir_x(inner,i),y+lengthdir_y(inner,i),.5+(lengthdir_x(inner,texture_angle))/texture_pixelheight,.5+(lengthdir_y(inner,texture_angle)/pixelstretch),alpha1,arg14)
	    }
	    draw_primitive_end();
	}



}
