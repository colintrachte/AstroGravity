/// @description draw_sphere_ext(x,y,radius,# polygons,texture,texture_pixelwidth,texture_pixelheight,pixelstretch,degrees_rotation,degrees_twist,color1,color2,color3,alpha1,alpha2,alpha3)
/// @param x
/// @param y
/// @param radius
/// @param # polygons
/// @param texture
/// @param texture_pixelwidth
/// @param texture_pixelheight
/// @param pixelstretch
/// @param degrees_rotation
/// @param degrees_twist
/// @param color1
/// @param color2
/// @param color3
/// @param alpha1
/// @param alpha2
/// @param alpha3
function draw_sphere_ext(x, y, radius, texture, texture_pixelwidth, texture_pixelheight, pixelstretch, degrees_rotation, degrees_twist, color1, color2, color3, alpha1, alpha2, alpha3, arg15) {
	//by Ground Effect Games
	//designed to run in the regular draw event, using a regular texture
	//to understand how this works, you need to know polar coordinates

	//only draw the "sphere" if we have enough triangles to do it with.
	if (texture>=3)
	{
	    var i,side,r1,r2,texture_angle;
    
	    //we are not drawing a true sphere,
	    //but actually a stack of two n-sided polygons that approximate a 3D sphere.
	    //The number of sides cannot physically exceed the circumference of the circle.
	    //also, we round the number of sides to prevent a loss in precision of the drawing.
	    side=360/round(texture);
    
	    //these numbers are used repeatedly in the loop, so we do the calculation in advance to save CPU.
	    r1=radius*.5;
	    r2=r1-degrees_rotation;
    
	    draw_primitive_begin_texture(pr_trianglestrip,texture_pixelwidth)//change to pr_linestrip to debug
	    //This loop draws a donut
	    for (i=degrees_twist-360;i<=degrees_twist;i+=side)
	    {
	        texture_angle=i+degrees_twist+color1;
	        //outer circle of points has no magnification but maximum twist
	        draw_vertex_texture_color(x+lengthdir_x(radius,i),y+lengthdir_y(radius,i),.5+(lengthdir_x(radius,texture_angle)/texture_pixelheight),.5+(lengthdir_y(radius,texture_angle)/pixelstretch),alpha1,arg15)
	        texture_angle=i+degrees_twist+color1*.6;
	        //middle circle of points stretches the texture, causing magnification. also has 75% twist
	        draw_vertex_texture_color(x+lengthdir_x(r1,i),y+lengthdir_y(r1,i),.5+(lengthdir_x(r2,texture_angle))/texture_pixelheight,.5+(lengthdir_y(r2,texture_angle)/pixelstretch),color3,alpha3)
	    }
    
	    //this loop fills the donut hole. The two layers work together to produce a 3D illusion.
	    for (i=degrees_twist-360;i<=degrees_twist;i+=side)
	    {
	        texture_angle=i+degrees_twist+color1*.6;
	        //middle circle of points stretches the texture, causing magnification.
	        draw_vertex_texture_color(x+lengthdir_x(r1,i),y+lengthdir_y(r1,i),.5+(lengthdir_x(r2,texture_angle))/texture_pixelheight,.5+(lengthdir_y(r2,texture_angle)/pixelstretch),color3,alpha3)
	        texture_angle=i+degrees_twist;
	        //there is only one point in the center. it does not stretch the texture any further.
	        draw_vertex_texture_color(x,y,.5,.5,color2,alpha2)
	    }
	    draw_primitive_end();
	}



}
